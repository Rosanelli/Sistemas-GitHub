using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;
using WebApplication1.Classes.Italia;

namespace WebApplication1
{
    public partial class Unimed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populaRepArquivos();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                var nomeExtensao = fupArquivo.FileName.Split('.').First();
                var extensaoArquivo = fupArquivo.FileName.Split('.').Last();
                var diretorioArquivo = String.Format("~/Arquivos/{0}.{1}", nomeExtensao, extensaoArquivo);
                var caminhoCompleto = Server.MapPath(diretorioArquivo);
                fupArquivo.SaveAs(caminhoCompleto);

                formataLayout(leCsv(caminhoCompleto), nomeExtensao, extensaoArquivo);

                Arquivo arquivo = new Arquivo();
                arquivo.NomeArquivo = nomeExtensao;
                arquivo.Foto = diretorioArquivo;
                arquivo.Tipo = '1';
                arquivo.Modo = 'C';
                Arquivo.SalvaArquivo(arquivo);

                litStatus.Text = "Formatado com Sucesso!";

                populaRepArquivos();

            }
            catch(Exception ex)
            {
                litStatus.Text = ex.Message;
            }
        }

        public string operacao;

        public int cont = 1;

        private List<Lancamento> leCsv(string caminho)
        {
            List<Lancamento> lancamentos = new List<Lancamento>();

            StreamReader rd = new StreamReader(caminho);
            string linha = null;
            string[] linhaseparada = null;

            while ((linha = rd.ReadLine()) != null)
            {
                linhaseparada = linha.Split('|');
                if (linhaseparada.Count() == 6)
                {
                    operacao = linhaseparada[1].Trim();
                }

                if (linhaseparada.Count() == 8)
                {
                    if (linhaseparada[0] == "Cliente")
                    {

                    }
                    else
                    {
                        int testaCnpj = linhaseparada[0].Substring(0, 14).Trim().Count();
                        string cnpj;
                        if (testaCnpj != 11 && testaCnpj > 11)
                        {
                            cnpj = linhaseparada[0].Substring(0, 14).Trim().PadLeft(14, '0');
                        }
                        else if (testaCnpj < 11)
                        {
                            cnpj = linhaseparada[0].Substring(0, 14).Trim().PadLeft(11, '0');
                        }
                        else
                        {
                            cnpj = linhaseparada[0].Substring(0, 14).Trim();
                        }

                        string terceiro = linhaseparada[0].Substring(14, 20).TrimStart().TrimEnd();
                        string numeroFatura = linhaseparada[4].Trim();
                        DateTime data = Convert.ToDateTime(linhaseparada[5].Trim());
                        string alternativa = linhaseparada[6].Trim().PadLeft(3, '0');
                        string valor = linhaseparada[7].Trim();

                        string historico = numeroFatura + " " + terceiro;

                        Lancamento lanc = new Lancamento();
                        lanc.campoFixo = "LC1";
                        lanc.sequencial = Convert.ToString(cont).PadLeft(5, '0');
                        lanc.modoLancamento = "1";
                        lanc.data = data.ToString("dd/MM/yyyy").Replace("/", "");
                        lanc.historico = "RECEBIMENTO CF DUPLICATA " + historico.ToUpper();
                        lanc.valor = valor;

                        if(alternativa == "200")
                        {
                            lanc.debito = "11521";
                            lanc.credito ="89999";
                            lanc.cnpjDebito = "";
                            lanc.cnpjCredito = cnpj;
                        }
                        else if (operacao == "003")
                        {
                            if (alternativa == "9999")
                            {
                                lanc.debito = "21511";
                                lanc.credito = "65102";
                                lanc.cnpjDebito = cnpj;
                                lanc.cnpjCredito = "";
                            }
                            else
                            {
                                lanc.debito = buscaConta(alternativa);
                                lanc.credito = "65102";
                                lanc.cnpjCredito = "";
                                lanc.cnpjDebito = "";
                            }
                            lanc.historico = "RECEBIMENTO JUROS CF DUPLICATA " + historico.ToUpper();
                        }
                        else if (alternativa == "9999")
                        {
                            lanc.debito = "21511";
                            lanc.credito = "89999";
                            lanc.cnpjCredito = cnpj;
                            lanc.cnpjDebito = cnpj;
                        }

                        else if (operacao == "002")
                        {
                            lanc.historico = "RECEBIMENTO CF DUPLICATA " + historico.ToUpper();
                            lanc.debito = buscaConta(alternativa);
                            lanc.credito = "89999";
                            lanc.cnpjCredito = cnpj;
                            lanc.cnpjDebito = "";
                        }

                        else if (operacao == "004")
                        {
                            if (alternativa == "9999")
                            {
                                lanc.debito = "57118";
                                lanc.credito = "21511";
                                lanc.cnpjCredito = cnpj;
                                lanc.cnpjDebito = "";
                            }
                            else
                            {

                                lanc.debito = "57118";
                                lanc.credito = "89999";
                                lanc.cnpjCredito = cnpj;
                                lanc.cnpjDebito = "";
                            }
                            lanc.historico = "DESCONTO CONCEDIDO SOBRE DUPLICATA " + historico.ToUpper();
                        }

                        lancamentos.Add(lanc);

                        cont++;
                    }
                }
            }

            rd.Close();

            return lancamentos;

        }

        public void formataLayout(List<Lancamento> lancamentos, string nome, string extensao)
        {
            string diretorio = String.Format("~/Arquivos/{0}.txt", nome + "Formatado");

            string caminhoArquivoFormatado = Server.MapPath(diretorio);

            FileStream fs = File.Create(caminhoArquivoFormatado);
            fs.Close();

            for (int i = 0; i < lancamentos.Count; i++)
            {
                StreamWriter wr = new StreamWriter(caminhoArquivoFormatado, true);
                wr.WriteLine(String.Format("{0}{1}   {2}{3}                                                {4}{5}     {6}{7}     {8}{9}", lancamentos[i].campoFixo, lancamentos[i].sequencial, lancamentos[i].modoLancamento, lancamentos[i].data, lancamentos[i].debito, lancamentos[i].cnpjDebito.PadLeft(14, '0'), lancamentos[i].credito, lancamentos[i].cnpjCredito.PadLeft(14, '0'), lancamentos[i].valor.Replace(',', '.').PadLeft(16, '0'), lancamentos[i].historico));
                wr.Close();
            }

            Arquivo arquivo = new Arquivo();
            arquivo.NomeArquivo = nome + "Formatado";
            arquivo.Foto = diretorio;
            arquivo.Tipo = '2';
            arquivo.Modo = 'C';
            Arquivo.SalvaArquivo(arquivo);
        }

        private void populaRepArquivos()
        {
            repArquivos.DataSource = Arquivo.buscaArquivosOriginais();
            repArquivos.DataBind();

            repArquivosFormatados.DataSource = Arquivo.buscaArquivosFormatados();
            repArquivosFormatados.DataBind();
        }

        public static string buscaConta(string alternativa)
        {
            string conta = "";

            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database=FrigeriItalia; user=sa; password=025640;"))
            {
                var query = String.Format("select Conta from DePara where Alternativa = '{0}'", alternativa);

                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.Read())
                {
                    conta = Convert.ToString(reader["Conta"]);
                }
                else
                {
                   // escrever na lit
                }

                return conta;
            }
        }
    }
}