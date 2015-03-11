using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SiteRada.Paginas
{
    public partial class Parallax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //foto_Eletrica.Attributes.Add("onmouseover", "this.style.opacity= 0.8");
            //foto_Eletrica.Attributes.Add("onmouseout", "this.style.opacity= 1");

            foto_Hidraulica.Attributes.Add("onmouseover", "this.style.opacity= 0.8");
            foto_Hidraulica.Attributes.Add("onmouseout", "this.style.opacity= 1");

            foto_Pintura.Attributes.Add("onmouseover", "this.style.opacity= 0.8");
            foto_Pintura.Attributes.Add("onmouseout", "this.style.opacity= 1");

        }
    }
}