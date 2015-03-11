using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApplication1.Classes.Italia
{
    public class Arquivo
    {
        public int ID { get; set; }

        public string NomeArquivo { get; set; }

        public string Foto { get; set; }

        public char Tipo { get; set; }

        public char Modo { get; set; }

        //localhost\\sqlexpress
        public static void SalvaArquivo(Arquivo arquivo)
        {
            var query = @"INSERT INTO Arquivo
                          (NomeArquivo,Foto,Tipo,Modo)
                          VALUES (@NomeArquivo,@Foto,@Tipo,@Modo)";

            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database= FrigeriItalia; user=sa; password=025640;"))
            {
                var command = conexao.CreateCommand(query);
                command.Parameters.AddWithValue("@NomeArquivo", arquivo.NomeArquivo);
                command.Parameters.AddWithValue("@Foto", arquivo.Foto);
                command.Parameters.AddWithValue("@Tipo", arquivo.Tipo);
                command.Parameters.AddWithValue("@Modo", arquivo.Modo);
                conexao.ExecuteNonQuery(command);
            }
        }

        public static List<Arquivo> buscaArquivosOriginais()
        {
            List<Arquivo> arquivos = new List<Arquivo>();

            var query = "Select * from arquivo where Tipo = 1 and Modo = 'C'";


            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database= FrigeriItalia; user=sa; password=025640;"))
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while (reader.Read())
                {
                    Arquivo arquivo = new Arquivo();
                    arquivo.NomeArquivo = reader["NomeArquivo"].ToString();
                    arquivo.Foto = reader["Foto"].ToString();

                    arquivos.Add(arquivo);
                }
            }

            return arquivos;
        }

        public static List<Arquivo> buscaArquivosFormatados()
        {
            List<Arquivo> arquivos = new List<Arquivo>();

            var query = "Select * from arquivo where Tipo = 2 and Modo = 'C'";

            using (var conexao = new Conexao("Server= localhost\\SQLEXPRESS ;Database= FrigeriItalia; user=sa; password=025640;"))
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                while (reader.Read())
                {
                    Arquivo arquivo = new Arquivo();
                    arquivo.NomeArquivo = reader["NomeArquivo"].ToString();
                    arquivo.Foto = reader["Foto"].ToString();

                    arquivos.Add(arquivo);
                }
            }

            return arquivos;
        }
    }
}