using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Classes;
using WebApplication1.Classes.Italia;
using WebApplication1.Classes.Unylaser;

namespace WebApplication1.Pages
{
    public partial class Unylaser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populaRepArquivos();
        }

        private string arquivo;

        public double numero = 1;

        public static string RemoveAccents(string text)
        {
            String normalizedText = text.Normalize(NormalizationForm.FormD);
            StringBuilder textWithoutAccents = new StringBuilder();

            for (int i = 0; i < normalizedText.Length; i++)
            {
                Char c = normalizedText[i];

                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    textWithoutAccents.Append(c);
                }
            }

            return textWithoutAccents.ToString();
        }

        private void formataLayout(string caminho,string nome,string extensao)
        {
            try
            {
                StreamReader rd = new StreamReader(caminho);

                string diretorio = String.Format("~/ArquivosUnylaser/{0}.{1}", nome + "Formatado", extensao);

                string caminhoArquivoFormatado = Server.MapPath(diretorio);

                FileStream fs = File.Create(caminhoArquivoFormatado); 
                fs.Close();

                ArquivoUnylaser arquivo = new ArquivoUnylaser();
                arquivo.NomeArquivo = nome + "Formatado";
                arquivo.Foto = diretorio;
                arquivo.Tipo = '2';
                ArquivoUnylaser.SalvaArquivo(arquivo);

                while (!rd.EndOfStream)
                {
                    string plan = Convert.ToString(numero).PadLeft(4, ' ');

                    string linha = rd.ReadLine();

                    int tamanho = linha.Length;

                    string data = linha.Substring(12, 8);

                    string debito = buscaConta(linha.Substring(68, 5));

                    string credito = buscaConta(linha.Substring(92, 5));

                    string ccustoDebito = linha.Substring(87, 5);

                    string ccustoCredito = linha.Substring(111, 5);
                    if (ccustoCredito == "RAT  ")
                    {
                        ccustoCredito = "00000";
                    }

                    tamanho = tamanho - 132;
                    string historico = RemoveAccents(linha.Substring(132, tamanho).PadRight(77, ' '));

                    string teste = RemoveAccents(historico.Substring(0, 74)).Replace("º", ".");


                    string valor = linha.Substring(116, 16);

                    StreamWriter wr = new StreamWriter(caminhoArquivoFormatado, true);


                    if (ccustoDebito == "     " || ccustoDebito == "00000")
                    {
                        plan = Convert.ToString(numero).PadLeft(4, ' ');
                        wr.WriteLine(String.Format("{0}PLANO {1}DB{2}            2131001            {3}{4}", plan, data, debito, teste.PadRight(77, ' '), valor.Replace('.', ',')));
                    }
                    else
                    {

                        plan = Convert.ToString(numero).PadLeft(4, ' ');
                        wr.WriteLine(String.Format("{0}PLANO {1}DB{2}CCUSTO{3} 2131001            {4}{5}", plan, data, debito, ccustoDebito, teste.PadRight(77, ' '), valor.Replace('.', ',')));
                    }


                    if (ccustoCredito == "     " || ccustoCredito == "00000")
                    {
                        numero++;
                        plan = Convert.ToString(numero).PadLeft(4, ' ');
                        wr.WriteLine(String.Format("{0}PLANO {1}cr{2}            2131001            {3}{4}", plan, data, credito, teste.PadRight(77, ' '), valor.Replace('.', ',')));
                    }
                    else
                    {
                        numero++;
                        plan = Convert.ToString(numero).PadLeft(4, ' ');
                        wr.WriteLine(String.Format("{0}PLANO {1}cr{2}CCUSTO{3} 2131001            {4}{5}", plan, data, credito, ccustoCredito, teste.PadRight(77, ' '), valor.Replace('.', ',')));
                    }

                    wr.Close();

                    numero++;

                }
                rd.Close();

            }
            
            catch (Exception ex)
            {
                litStatus.Text = ex.Message;
            }

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            var nomeExtensao = fupArquivo.FileName.Split('.').First();
            var extensaoArquivo = fupArquivo.FileName.Split('.').Last();
            var diretorioArquivo = String.Format("~/ArquivosUnylaser/{0}.{1}", nomeExtensao, extensaoArquivo);
            var caminhoCompleto = Server.MapPath(diretorioArquivo);
            fupArquivo.SaveAs(caminhoCompleto);

            formataLayout(caminhoCompleto, nomeExtensao, extensaoArquivo);

            ArquivoUnylaser arquivo = new ArquivoUnylaser();
            arquivo.NomeArquivo = nomeExtensao;
            arquivo.Foto = diretorioArquivo;
            arquivo.Tipo = '1';
            ArquivoUnylaser.SalvaArquivo(arquivo);

            litStatus.Text = "Formatado com Sucesso!";

            populaRepArquivos();
        }

        private void populaRepArquivos()
        {
            repArquivos.DataSource = ArquivoUnylaser.buscaArquivosOriginais();
            repArquivos.DataBind();

            repArquivosFormatados.DataSource = ArquivoUnylaser.buscaArquivosFormatados();
            repArquivosFormatados.DataBind();
        }

        private string buscaConta(string alternativa)
        {
            string conta = "";

            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database=Frigeri;user=sa; password=025640;"))
            {
                var query = String.Format("select Alternativa from ChangeConta where Conta = '{0}'", alternativa);

                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.Read())
                {
                    conta = Convert.ToString(reader["Alternativa"]);
                }

                return conta;
            }
        }
    }
}