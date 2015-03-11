using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Classes.Unylaser
{
    public class LancamentoUnylaser
    {
        public string data { get; set; }

        public string campoFixo { get; set; }

        public double numeroLancamento { get; set; }

        public double sequencial { get; set; }

        public string indicador { get; set; }

        public int codigoConta { get; set; }

        public int codigoCusto { get; set; }

        public decimal valor { get; set; }

        public string historico { get; set; }
    }
}