using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace unimed.Class
{
    public class Lancamento
    {
        public string campoFixo { get; set; }

        public string sequencial { get; set; }

        public string modoLancamento { get; set; }
        
        public string data { get; set; }

        public string debito { get; set; }

        public string credito { get; set; }

        public string cnpjDebito { get; set; }

        public string cnpjCredito { get; set; }

        public string valor { get; set; }

        public string historico { get; set; }


    }
}
