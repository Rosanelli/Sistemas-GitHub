using ControleAcesso.Classes.EN;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ControleAcesso.Classes.AD
{
    public class AcessoAD
    {
        public static void inseri_Acesso(AcessoEN en)
        {
            var query = "insert into Acesso (Data,Tipo,IDUsuario) values (@Data,@Tipo,@IDUsuario)";
            using (var conexao = new Conexao())
            {
                var command = conexao.CreateCommand(query);
                command.Parameters.AddWithValue("@Data", en._Data);
                command.Parameters.AddWithValue("@Tipo", en._Tipo);
                command.Parameters.AddWithValue("@IDUsuario", en._IDUsuario);

                conexao.ExecuteNonQuery(command);
            }
        }


        public static List<AcessoEN> buscaTodosAcessos()
        {
            List<AcessoEN> lista = new List<AcessoEN>();
            var query = @"select ac.ID_Acesso as ID_Acesso,ac.Data as Data,ac.Tipo as Tipo,u.Nome as Nome from Acesso ac 
                          inner join Usuario u
                          ON u.IDUsuario = ac.IDUsuario";

            using (var conexao = new Conexao())
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        AcessoEN en = new AcessoEN();
                        en._IDAcesso = Convert.ToInt32(reader["ID_Acesso"]);
                        en._Data = Convert.ToDateTime(reader["Data"]);
                        en._Tipo = Convert.ToChar(reader["Tipo"]);
                        en._NomeUsuario = reader["Nome"].ToString();

                        lista.Add(en);
                    }
                }
                else
                {
                    lista = null;
                }
            }
            return lista;
        }

        public static AcessoEN busca_Acesso(int IDUsuario)
        {
            AcessoEN en = new AcessoEN();
            var query = String.Format("select ID_Acesso,Data,Tipo from Acesso where IDUsuario = '{0}'",IDUsuario);

            using (var conexao = new Conexao())
            {
                SqlDataReader reader = conexao.ExecuteQuery(query);

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        en._IDAcesso = Convert.ToInt32(reader["ID_Acesso"]);
                        en._Data = Convert.ToDateTime(reader["Data"]);
                        en._Tipo = Convert.ToChar(reader["Tipo"]);
                        en._IDUsuario = IDUsuario;
                    }
                }
                else
                {
                    en = null;
                }
            }
            return en;
        }
    }
}
