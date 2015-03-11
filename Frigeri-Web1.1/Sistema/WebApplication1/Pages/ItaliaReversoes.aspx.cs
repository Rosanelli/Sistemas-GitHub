using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;
using WebApplication1.Classes.ItaliaReversoes;

namespace WebApplication1.Pages
{
    public partial class ItaliaReversoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populaRepArquivos();
        }

        public int cont = 1;

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

                ArquivoReversao arquivo = new ArquivoReversao();
                arquivo.NomeArquivo = nomeExtensao;
                arquivo.Foto = diretorioArquivo;
                arquivo.Tipo = '1';
                arquivo.Modo = 'R';
                ArquivoReversao.SalvaArquivo(arquivo);

                litStatus.Text = "Formatado com Sucesso!";

                populaRepArquivos();
            }
            catch (Exception ex)
            {
                litStatus.Text = ex.Message;
            }
        }

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

                int testaCnpj = linhaseparada[5].Trim().Count();
                string cnpj;
                cnpj = FormataCnpj(linhaseparada[5], testaCnpj);

                testaCnpj = linhaseparada[7].Trim().Count();
                string cnpj2;
                cnpj2 = FormataCnpj(linhaseparada[7], testaCnpj);

                string terceiro ="VLR.REVERSAO CT-E ";
                string numeroFatura = linhaseparada[3].Trim();

                DateTime data = Convert.ToDateTime(linhaseparada[4].Trim());

                string preValor = linhaseparada.Last().Trim().Replace(".", "");
                string valor = preValor.Replace(",", ".");


                string historico = terceiro + numeroFatura;

                Lancamento lanc = new Lancamento();
                lanc.campoFixo = "LC1";
                lanc.sequencial = Convert.ToString(cont).PadLeft(5, '0');
                lanc.modoLancamento = "1";
                lanc.data = data.ToString("dd/MM/yyyy").Replace("/", "");
                lanc.historico = historico;
                lanc.valor = valor;
                lanc.CentroCustoCredito = "     ";

                lanc.debito = "89999";
                lanc.credito = "89999";

                lanc.cnpjDebito = cnpj2;
                lanc.cnpjCredito = cnpj;

                lancamentos.Add(lanc);
                cont++;
            }

            rd.Close();

            return lancamentos;
        }

        private static string FormataCnpj(string linhaseparada, int testaCnpj)
        {
            string cnpj;
            if (testaCnpj != 11 && testaCnpj > 11)
            {
                cnpj = linhaseparada.Trim().PadLeft(14, '0');
            }
            else if (testaCnpj < 11)
            {
                cnpj = linhaseparada.Trim().PadLeft(11, '0');
            }
            else
            {
                cnpj = linhaseparada.Substring(0, 14).Trim();
            }
            return cnpj;
        }

        public void formataLayout(List<Lancamento> lancamentos, string nome, string extensao)
        {
            string diretorio = String.Format("~/Arquivos/{0}.txt", nome + "Formatado");

            string caminhoArquivoFormatado = Server.MapPath(diretorio);

            FileStream fs = File.Create(caminhoArquivoFormatado);
            fs.Close();

            for (int i = 0; i < lancamentos.Count; i++)
            {
                if (lancamentos[i].cnpjDebito.PadLeft(14, ' ') == lancamentos[i].cnpjCredito.PadLeft(14, ' '))
                {
                }
                else
                {
                    StreamWriter wr = new StreamWriter(caminhoArquivoFormatado, true);
                    wr.WriteLine(String.Format("{0}{1}   {2}{3}                                                {4}{5}     {6}{7}{10}{8}{9}", lancamentos[i].campoFixo, lancamentos[i].sequencial, lancamentos[i].modoLancamento, lancamentos[i].data, lancamentos[i].debito, lancamentos[i].cnpjDebito.PadLeft(14, ' '), lancamentos[i].credito, lancamentos[i].cnpjCredito.PadLeft(14, ' '), lancamentos[i].valor.Replace(',', '.').PadLeft(16, '0'), lancamentos[i].historico, lancamentos[i].CentroCustoCredito));
                    wr.Close();
                }
            }

            ArquivoReversao arquivo = new ArquivoReversao();
            arquivo.NomeArquivo = nome + "Formatado";
            arquivo.Foto = diretorio;
            arquivo.Tipo = '2';
            arquivo.Modo = 'R';
            ArquivoReversao.SalvaArquivo(arquivo);
        }

        private void populaRepArquivos()
        {
            repArquivos.DataSource = ArquivoReversao.buscaArquivosOriginais();
            repArquivos.DataBind();

            repArquivosFormatados.DataSource = ArquivoReversao.buscaArquivosFormatados();
            repArquivosFormatados.DataBind();
        }
    }
}