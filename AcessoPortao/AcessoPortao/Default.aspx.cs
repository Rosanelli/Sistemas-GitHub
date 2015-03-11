using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcessoPortao
{
    public partial class _Default : Page
    {

        SerialPort serialPort1 = new SerialPort();

        protected void Page_Load(object sender, EventArgs e)
        {
            serialPort1.PortName = "COM3";
            serialPort1.BaudRate = 9600;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!serialPort1.IsOpen)
                serialPort1.Open();

            serialPort1.Write("S");

            serialPort1.Close();
        }
    }
}