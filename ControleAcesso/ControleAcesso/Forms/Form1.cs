using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using ControleAcesso.Classes;
using ControleAcesso.Classes.AD;
using ControleAcesso.Classes.EN;

namespace ControleAcesso
{
    public partial class Form1 : Form
    {

        SerialPort serialPort1 = new SerialPort();

        public Form1()
        {
            InitializeComponent();

            List<AcessoEN> lista = AcessoAD.buscaTodosAcessos();
            if(lista != null)
                atualizaGrid(lista);

            serialPort1.PortName = "COM3";
            serialPort1.BaudRate = 9600;

            serialPort1.Open();
        }

        private void atualizaGrid(List<AcessoEN> lista)
        {
            for (int i = 0; i < lista.Count; i++)
            {
                string tipo;

                if (lista[i]._Tipo.ToString() == "E")
                {
                    tipo = "Entrada";
                }
                else
                {
                    tipo = "Saida";
                }

                gridAcessos.Rows.Add(
                    lista[i]._NomeUsuario.ToString(),
                    tipo,
                    lista[i]._Data.ToString());
            }
        }

        private void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string RxString;
            RxString = serialPort1.ReadExisting();

            List<UsuarioEN> lista = new List<UsuarioEN>();

            lista = UsuarioAD.buscaUsuarios();
            if( lista != null)
            {
                foreach (var user in lista)
                {
                    if ( user._Senha.Trim() == RxString.Trim())
                    {
                        // libera acesso ao portao
                        serialPort1.Write("S");
                        
                        //verifica entra/saida do usuario
                        AcessoEN en = AcessoAD.busca_Acesso(user._IDUsuario);

                        // inseri entrada ou saida do usuario
                        if( en == null)
                        {
                            AcessoEN en2 = new AcessoEN();
                            en2._Data = DateTime.Now;
                            en2._IDUsuario = user._IDUsuario;
                            en2._Tipo = 'E';
                            AcessoAD.inseri_Acesso(en2);

                        }
                        else
                        {

                            AcessoEN en3 =  new AcessoEN();
                            
                            if (en._Tipo == 'E')
                                en3._Tipo = 'S';
                            else
                                en3._Tipo = 'E';

                            en3._Data = DateTime.Now;
                            en3._IDUsuario = user._IDUsuario;
                            AcessoAD.inseri_Acesso(en3);

                            MessageBox.Show("OK");
                        }

                        gridAcessos.Rows.Clear();

                        List<AcessoEN> lista2 = AcessoAD.buscaTodosAcessos();
                        if (lista2 != null)
                            atualizaGrid(lista2);
                    }
                }
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (serialPort1.IsOpen) serialPort1.Close();
        }

       

    }
}
