using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ControleAcesso.Classes.EN
{
    public class AcessoEN
    {
        public int _IDAcesso { get; set; }

        public DateTime _Data { get; set; }

        public char _Tipo { get; set; }

        public int _IDUsuario { get; set; }

        public string _NomeUsuario { get; set; }
    }
}
