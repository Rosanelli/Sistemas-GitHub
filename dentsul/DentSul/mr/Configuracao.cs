using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace mr
{
    public partial class Configuracao : Form
    {
        public Configuracao()
        {
            InitializeComponent();

            buscaCaminhos();
        }

        public void buscaCaminhos()
        {
            var query = "select * from configuracao";
            Caminhos caminhos = new Caminhos();
            
            using (var conexao = new Conexao())
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while(reader.Read())
                {
                    txtEntrada.Text = Convert.ToString(reader["caminhoEntrada"]);

                    txtSaida.Text = Convert.ToString(reader["caminhoSaida"]);
                }
            }
        }

        private void txtEntrada_MouseClick(object sender, MouseEventArgs e)
        {
            txtEntrada.ReadOnly = false;
        }

        private void salvaEntrada(string caminhoEntrada)
        {
            var query = "update configuracao set caminhoEntrada = @caminhoEntrada where id = 1";
            
            using(var conexao = new Conexao())
            {
                var command = conexao.CreateCommand(query);
                command.Parameters.AddWithValue("@caminhoEntrada",caminhoEntrada);
                conexao.ExecuteNonQuery(command);
            }
        }

        private void salvaSaida(string caminhoSaida)
        {
            var query = "update configuracao set caminhoSaida = @caminhoSaida where id = 1";

            using (var conexao = new Conexao())
            {
                var command = conexao.CreateCommand(query);
                command.Parameters.AddWithValue("@caminhoSaida", caminhoSaida);
                conexao.ExecuteNonQuery(command);
            }
        }

        private void btnEntrada_Click(object sender, EventArgs e)
        {
            salvaEntrada(txtEntrada.Text);
            buscaCaminhos();
            txtEntrada.ReadOnly = true;

            MessageBox.Show("Salvo com Sucesso!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            salvaSaida(txtSaida.Text);
            buscaCaminhos();
            txtSaida.ReadOnly = true;

            MessageBox.Show("Salvo com Sucesso!");
        }

        private void txtSaida_MouseClick(object sender, MouseEventArgs e)
        {
            txtSaida.ReadOnly = false;
        }

        
    }
}
