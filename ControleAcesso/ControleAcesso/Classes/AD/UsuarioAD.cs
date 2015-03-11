using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ControleAcesso.Classes.AD
{
    class UsuarioAD
    {
        public static List<UsuarioEN> buscaUsuarios()
        {
            List<UsuarioEN> lista = new List<UsuarioEN>();

            var query = @"Select IDUsuario,Nome,Senha 
                          From Usuario";

            using (var conexao = new Conexao())
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        UsuarioEN en = new UsuarioEN();
                        en._IDUsuario = Convert.ToInt32(reader["IDUsuario"]);
                        en._Nome = reader["Nome"].ToString();
                        en._Senha = reader["Senha"].ToString();

                        lista.Add(en);
                    }
                }
                else
                    lista = null;
            }

            return lista;
        }

    }
}
