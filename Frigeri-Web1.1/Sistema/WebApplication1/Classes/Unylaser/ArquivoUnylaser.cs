using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApplication1.Classes.Italia;

namespace WebApplication1.Classes.Unylaser
{
    public class ArquivoUnylaser
    {
        public int ID { get; set; }

        public string NomeArquivo { get; set; }

        public string Foto { get; set; }

        public char Tipo { get; set; }

        public static void SalvaArquivo(ArquivoUnylaser arquivo)
        {
            var query = @"INSERT INTO Arquivo
                          (NomeArquivo,Foto,Tipo)
                          VALUES (@NomeArquivo,@Foto,@Tipo)";

            using (var conexao = new Conexao("Server= localhost\\sqlexpress ;Database= Frigeri; user=sa; password=025640;"))
            {
                var command = conexao.CreateCommand(query);
                command.Parameters.AddWithValue("@NomeArquivo", arquivo.NomeArquivo);
                command.Parameters.AddWithValue("@Foto", arquivo.Foto);
                command.Parameters.AddWithValue("@Tipo", arquivo.Tipo);
                conexao.ExecuteNonQuery(command);
            }
        }

        public static List<ArquivoUnylaser> buscaArquivosOriginais()
        {
            List<ArquivoUnylaser> arquivos = new List<ArquivoUnylaser>();

            var query = "Select * from arquivo where Tipo = 1";

            using (var conexao = new Conexao("Server= localhost\\sqlexpress ;Database= Frigeri; user=sa; password=025640;"))
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while (reader.Read())
                {
                    ArquivoUnylaser arquivo = new ArquivoUnylaser();
                    arquivo.NomeArquivo = reader["NomeArquivo"].ToString();
                    arquivo.Foto = reader["Foto"].ToString();

                    arquivos.Add(arquivo);
                }
            }

            return arquivos;
        }

        public static List<ArquivoUnylaser> buscaArquivosFormatados()
        {
            List<ArquivoUnylaser> arquivos = new List<ArquivoUnylaser>();

            var query = "Select * from arquivo where Tipo = 2";

            using (var conexao = new Conexao("Server= localhost\\sqlexpress ;Database= Frigeri; user=sa; password=025640;"))
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while (reader.Read())
                {
                    ArquivoUnylaser arquivo = new ArquivoUnylaser();
                    arquivo.NomeArquivo = reader["NomeArquivo"].ToString();
                    arquivo.Foto = reader["Foto"].ToString();

                    arquivos.Add(arquivo);
                }
            }

            return arquivos;
        }
    }
}