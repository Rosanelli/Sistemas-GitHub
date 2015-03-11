using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Data.SqlClient;
using System.Collections;
using System;
using System.Globalization;

namespace mr
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private string arquivo;

        public List<Lancamentos> lancamentos = new List<Lancamentos>();

        public string data;

        public int numero = 1;

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

        public string DataLancamento;
        public string NumeroLanc;

        public string Historico;

        public string CDebito;
        public string CCredito;

        public bool vaiArquivo = true;

        private string buscaConta(string conta)
        {
            string conta2 = "";

            if (conta.Length > 5)
            {
                conta = conta.Substring(0, 5);
            }

            using (var conexao = new Conexao())
            {
                string query = String.Format("select RTRIM(Ltrim(para)) as para from dePara where de = '{0}'", conta.Trim());

                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        conta2 = reader["para"].ToString().Trim();
                    }
                }
                else
                {
                    conta2 = conta;
                    vaiArquivo = false;
                    pegaNumeroLanc = true;

                    if (conta2 != ".0.00")
                    {
                        StreamWriter wr2 = new StreamWriter(String.Format("C:\\Users\\Alan\\Desktop\\dentsul\\contasIguais.txt"), true);
                        wr2.WriteLine(String.Format("{0}",conta2));
                        wr2.Close();
                    }

                }
            }
            return conta2;
        }

        public bool pegaNumeroLanc = false;

        private bool buscaNumeroLanc(string numero)
        {
            bool temNUmero;
            var query = String.Format("select * from numeroLanc where numero = '{0}'", numero.Trim());
            using (var conexao = new Conexao())
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.HasRows)
                {
                    temNUmero = true;
                }
                else
                {
                    temNUmero = false;
                }
            }
            return temNUmero;
        }

        private void inseriLog(string numero)
        {
            var query = String.Format("insert into numeroLanc values('{0}')", numero);

            using (var conexao = new Conexao())
            {
                var command = conexao.CreateCommand(query);
                conexao.ExecuteNonQuery(command);
            }
        }

        private void formataLayout()
        {
            try
            {
                StreamReader rd = new StreamReader(String.Format(@"{0}", arquivo), Encoding.Default);

                string dataArquivo = DateTime.Today.ToString("dd-MM-yyyy");

                FileStream fs = File.Create(String.Format("C:\\Users\\Alan\\Desktop\\dentsul\\CTBLCTOS-Dent.txt"));
                fs.Close();

                bool Header = false;
                bool DataTeste = false;


                string DebitoDebito;
                string CreditoCredito;

                while (!rd.EndOfStream)
                {
                    string linha = RemoveAccents(rd.ReadLine()).Replace("º", "").ToUpper();

                    if (linha == "             8426      0    VALOR INSS RETIDO S/ SERVICO MES ")
                    {
                    }

                    if (pegaNumeroLanc == true)
                    {
                        NumeroLanc = linha.Substring(13, 8);
                    }

                    pegaNumeroLanc = false;

                    if (DataTeste == true)
                    {
                        if (linha.Length < 99)
                        {
                            string historico2 = linha.Substring(28, linha.Length - 28);

                            Historico = Historico.TrimStart() + " " + historico2.TrimEnd().TrimStart();
                        }
                        else
                        {
                            string debito = linha.Substring(72, 19).Trim();
                            string credito = linha.Substring(87, 19).Trim();
                            string contaCredito = linha.Substring(29, 6).Trim();
                            CCredito = contaCredito;


                            if (Historico.Trim() != "")
                            {
                                string valor;
                                if (credito == "")
                                {
                                    valor = debito;

                                    DebitoDebito = buscaConta(CDebito.Replace("-", "").Trim());

                                    CreditoCredito = buscaConta(CCredito.Replace("-", "").Trim());
                                }
                                else
                                {
                                    valor = credito;

                                    DebitoDebito = buscaConta(CCredito.Replace("-", "").Trim());

                                    CreditoCredito = buscaConta(CDebito.Replace("-", "").Trim());
                                }

                                if (vaiArquivo == true)
                                {

                                    bool temNumero = buscaNumeroLanc(NumeroLanc);
                                    if (temNumero == false)
                                    {
                                        if (DebitoDebito.PadLeft(5, '0') == CreditoCredito.PadLeft(5, '0'))
                                        {
                                            if (DebitoDebito == "05124")
                                            {
                                                StreamWriter wr2 = new StreamWriter(String.Format("C:\\Users\\Alan\\Desktop\\dentsul\\contasIguais.txt"), true);
                                                wr2.WriteLine(String.Format("{0}{1}{2}{3}{4}                                                {5}                   {8}                   {6}{7}", "LC1", "00001", "   ", "1", DataLancamento, DebitoDebito.PadLeft(5, '0'), (valor.Replace(".", "").Replace(",", ".")).PadLeft(16, '0'), Historico, CreditoCredito.PadLeft(5, '0')));
                                                wr2.Close();
                                            }
                                        }
                                        else
                                        {
                                            if (CreditoCredito == "05124")
                                            {
                                                StreamWriter wr = new StreamWriter(String.Format("C:\\Users\\Alan\\Desktop\\dentsul\\CTBLCTOS-Dent.txt"), true);
                                                wr.WriteLine(String.Format("{0}{1}{2}{3}{4}                                                {5}                   {8}                   {6}{7}", "LC1", "00001", "   ", "1", DataLancamento, DebitoDebito.PadLeft(5, '0'), (valor.Replace(".", "").Replace(",", ".")).PadLeft(16, '0'), Historico, CreditoCredito.PadLeft(5, '0')));
                                                wr.Close();
                                            }
                                        }
                                    }

                                    pegaNumeroLanc = true;

                                    inseriLog(NumeroLanc.Trim());
                                }

                                vaiArquivo = true;
                            }


                            Historico = "";
                        }
                    }

                    if (Header == false)
                    {
                        string numeroHeader = linha.Substring(3, 7).Trim();
                        if (numeroHeader != "DATA" && !numeroHeader.Contains('/') && numeroHeader != "")
                        {
                            Header = true;
                            DataTeste = false;
                            CDebito = numeroHeader;
                        }
                    }


                    string dataLanc = linha.Substring(3, 5).Trim();
                    if (dataLanc != "" && dataLanc.Contains('/') && dataLanc != "DATA")
                    {
                        DataTeste = true;
                        string historico1 = linha.Substring(28, linha.Length - 28);
                        Historico = historico1.TrimEnd().TrimStart();
                        DataLancamento = (dataLanc + "/2012").Replace("/", "");

                        NumeroLanc = linha.Substring(13, 8);
                    }




                    Header = false;






                    //    string tipo = "LC1";

                    //    string ordem = Convert.ToString(numero).PadLeft(5, '0');

                    //    string filler = "   ";

                    //    string modoLanc = "1";

                    //    string dataEscrituracao = linha.Substring(9, 8);

                    //    string contadebito1 = linha.Substring(25, 5).Trim();
                    //    string contaDebito = contadebito1.PadLeft(5, '0');

                    //    string contacredito1 = linha.Substring(41, 5).Trim();
                    //    string contaCredito = contacredito1.PadLeft(5, '0');

                    //    string valor = linha.Substring(49, 10);

                    //    string centavos = linha.Substring(59, 2);

                    //    string valorLanc = (valor + "." + centavos).PadLeft(16, '0');

                    //    int tamanho = linha.Count() - 61;
                    //    string historico = linha.Substring(61, tamanho);

                    //    Lancamentos lanc = new Lancamentos();
                    //    lanc.tipo = tipo;
                    //    lanc.ordem = ordem;
                    //    lanc.filler = filler;
                    //    lanc.ModoLanc = modoLanc;
                    //    lanc.dataEscrituracao = dataEscrituracao;
                    //    lanc.contaDebito = contaDebito;
                    //    lanc.valorLancamento = valorLanc;
                    //    lanc.historico = historico;
                    //    lanc.contaCredito = contaCredito;

                    //    lancamentos.Add(lanc);

                    //    numero++;
                    //}
                    //rd.Close();

                    //for (int i = 0; i < lancamentos.Count; i++)
                    //{
                    //    StreamWriter wr = new StreamWriter(String.Format("{0}\\CTBLCTOS-Top{1}.txt", buscaSaida(), dataArquivo), true);
                    //    wr.WriteLine(String.Format("{0}{1}{2}{3}{4}                                                {5}                   {8}                   {6}{7}", lancamentos[i].tipo, lancamentos[i].ordem, lancamentos[i].filler, lancamentos[i].ModoLanc, lancamentos[i].dataEscrituracao, lancamentos[i].contaDebito, lancamentos[i].valorLancamento, lancamentos[i].historico, lancamentos[i].contaCredito));
                    //    wr.Close();

                    //    int progresso = Convert.ToInt32(i);

                    //    progressBar1.Maximum = progresso + 1;
                    //    progressBar1.Value = progresso;
                    //}

                    //MessageBox.Show("Concluido !");

                    //progressBar1.Value = 0;

                    //arquivo = null;

                    //txtArquivo.Text = "";
                }

                MessageBox.Show("OK");

            }
            catch (ArgumentException ex)
            {
                MessageBox.Show("Selecione um Arquivo!" + ex.Message);
            }
            catch (IndexOutOfRangeException ex)
            {
                MessageBox.Show("range fora");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message + " Erro! Contate o Administrador");
            }
        }

        private string pegaCodigoConta(string cod)
        {
            int codigo = 0;

            string trecho = cod.Split('"').Last();
            string trecho2 = trecho.Replace(";", "");
            string trecho3 = trecho.Replace("\"", "").PadLeft(5, '0');

            return trecho3;
        }

        private string pegaCodigoContaCredito(string cod)
        {
            int codigo = 0;

            string trecho = cod.Split('"').Last();
            string trecho2 = trecho.Replace(";", "");
            string trecho3 = trecho.Replace("\"", "").PadLeft(5, '0');

            return trecho3;
        }

        private static string pegaValor(string valor1)
        {
            string trecho = valor1.Split('"').Last();
            string trecho1 = trecho.Replace(",", ".");
            string valorFinal = trecho1.PadLeft(16, '0');
            return valorFinal;
        }

        private string pegaData(string data)
        {
            string trecho = data.Split('"').First();
            string trecho2 = trecho.Replace(";", "");
            string trecho3 = trecho.Replace("/", "");
            string trecho4 = trecho3.Split(' ').First();

            return trecho4;
        }

        private static string formataHistorico(string historico)
        {
            string hist = "";

            hist = historico;

            string trecho = hist.Replace("\"", "").Trim();
            string trecho1 = trecho.Split('"').Last();
            return trecho1;
        }

        public string buscaSaida()
        {
            var query = "select * from configuracao";
            Caminhos caminhos = new Caminhos();

            using (var conexao = new Conexao())
            {
                string caminhoEntrada = "";
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while (reader.Read())
                {
                    caminhoEntrada = Convert.ToString(reader["caminhoSaida"]);
                }

                return caminhoEntrada;
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            formataLayout();
        }

        //public string buscaEntrada()
        //{
        //    var query = "select * from configuracao";
        //    Caminhos caminhos = new Caminhos();

        //    using (var conexao = new Conexao())
        //    {
        //        string caminhoEntrada = "";
        //        SqlDataReader reader = conexao.ExecuteQuery(query);
        //        while (reader.Read())
        //        {
        //            caminhoEntrada = Convert.ToString(reader["caminhoEntrada"]);
        //        }

        //        return caminhoEntrada;
        //    }
        //}

        //private void button2_Click(object sender, EventArgs e)
        //{
        //    using (OpenFileDialog openFileDialog = new OpenFileDialog())
        //    {
        //        openFileDialog.Title = "Selecionar arquivo";
        //        openFileDialog.InitialDirectory = buscaEntrada();
        //        openFileDialog.Filter = "All files (*.*)|*.*|All files (*.*)|*.*";
        //        openFileDialog.FilterIndex = 2;
        //        openFileDialog.RestoreDirectory = true;
        //        if (openFileDialog.ShowDialog() == DialogResult.OK)
        //            arquivo = openFileDialog.FileName;
        //    }

        //    txtArquivo.Text = arquivo;
        //}

        private void configuraçõesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Configuracao form = new Configuracao();
            form.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog())
            {
                openFileDialog.Title = "Selecionar arquivo";

                openFileDialog.Filter = "All files (*.*)|*.*|All files (*.*)|*.*";
                openFileDialog.FilterIndex = 2;
                openFileDialog.RestoreDirectory = true;
                if (openFileDialog.ShowDialog() == DialogResult.OK)
                    arquivo = openFileDialog.FileName;
            }

            txtArquivo.Text = arquivo;
        }
    }
}
