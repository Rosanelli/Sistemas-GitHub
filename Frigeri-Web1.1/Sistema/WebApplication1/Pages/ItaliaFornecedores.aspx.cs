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
using WebApplication1.Classes.ItaliaFornecedor;

namespace WebApplication1.Pages
{
    public partial class ItaliaFornecedores : System.Web.UI.Page
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

                ArquivoFornecedor arquivo = new ArquivoFornecedor();
                arquivo.NomeArquivo = nomeExtensao;
                arquivo.Foto = diretorioArquivo;
                arquivo.Tipo = '1';
                arquivo.Modo = 'F';
                ArquivoFornecedor.SalvaArquivo(arquivo);

                litStatus.Text = "Formatado com Sucesso!";

                populaRepArquivos();

            }
            catch (ArgumentNullException)
            {
                litStatus.Text = String.Format("Alternativa: {0} inexistente no De: Para:", alternativaNula);
            }
            catch (Exception ex)
            {
                litStatus.Text = ex.Message;
            }
        }

        public string operacao;

        public int cont = 1;

        public static bool contaNula = false;

        public static string CentroCusto;

        public static string alternativaNula;

        private List<Lancamento> leCsv(string caminho)
        {
            List<Lancamento> lancamentos = new List<Lancamento>();

            StreamReader rdteste = new StreamReader(caminho);
            rdteste.Close();
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
                        if (linhaseparada[0] == "Fornecedor")
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

                            string historico = numeroFatura + " " + terceiro.Replace('Ç','C');

                            Lancamento lanc = new Lancamento();
                            lanc.campoFixo = "LC1";
                            lanc.sequencial = Convert.ToString(cont).PadLeft(5, '0');
                            lanc.modoLancamento = "1";
                            lanc.data = data.ToString("dd/MM/yyyy").Replace("/", "");
                            lanc.historico = "PAGAMENTO DUPL. " + historico.ToUpper();
                            lanc.valor = valor;
                        

                            if (operacao == "003")
                            {
                                lanc.debito = "57105";
                                lanc.credito = buscaConta(alternativa);
                                if (contaNula == true)
                                {
                                    throw new ArgumentNullException();
                                }
                                lanc.cnpjCredito = "";
                                lanc.cnpjDebito = "";

                                lanc.historico = "PAGAMENTO JUROS S/DUPL. " + historico.ToUpper();

                                lancamentos.Add(lanc);
                                cont++;
                            }
                            else if (operacao == "002")
                            {
                                lanc.historico = "PAGAMENTO DUPL. " + historico.ToUpper();
                                lanc.debito = "79999";
                                lanc.credito = buscaConta(alternativa);
                                if (contaNula == true)
                                {
                                    throw new ArgumentNullException();
                                }
                                lanc.cnpjCredito = "";
                                lanc.cnpjDebito = cnpj;

                                lancamentos.Add(lanc);
                                cont++;
                            }

                            lanc.CentroCustoCredito = CentroCusto;
                            if (lanc.CentroCustoCredito == null || lanc.CentroCustoCredito == "")
                            {
                                lanc.CentroCustoCredito = "     ";
                            }

                            
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
                wr.WriteLine(String.Format("{0}{1}   {2}{3}                                                {4}{5}     {6}{7}{10}{8}{9}", lancamentos[i].campoFixo, lancamentos[i].sequencial, lancamentos[i].modoLancamento, lancamentos[i].data, lancamentos[i].debito, lancamentos[i].cnpjDebito.PadLeft(14, ' '), lancamentos[i].credito, lancamentos[i].cnpjCredito.PadLeft(14, ' '), lancamentos[i].valor.Replace(',', '.').PadLeft(16, '0'), lancamentos[i].historico,lancamentos[i].CentroCustoCredito));
                wr.Close();
            }

            ArquivoFornecedor arquivo = new ArquivoFornecedor();
            arquivo.NomeArquivo = nome + "Formatado";
            arquivo.Foto = diretorio;
            arquivo.Tipo = '2';
            arquivo.Modo = 'F';
            ArquivoFornecedor.SalvaArquivo(arquivo);
        }

        private void populaRepArquivos()
        {
            repArquivos.DataSource = ArquivoFornecedor.buscaArquivosOriginais();
            repArquivos.DataBind();

            repArquivosFormatados.DataSource = ArquivoFornecedor.buscaArquivosFormatados();
            repArquivosFormatados.DataBind();
        }

        public static string buscaConta(string alternativa)
        {
            string conta = "";

            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database=FrigeriItalia; user=sa; password=025640;"))
            {
                var query = String.Format("select Conta,CC from DePara where Alternativa = '{0}'", alternativa);

                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.Read())
                {
                    conta = Convert.ToString(reader["Conta"]);
                    CentroCusto = Convert.ToString(reader["CC"]);
                }
                else
                {
                    contaNula = true;
                    alternativaNula = alternativa;
                }

                return conta;
            }
        }

        protected void repArquivos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

    }
}