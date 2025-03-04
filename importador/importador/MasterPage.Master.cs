﻿using importador.classes.AD;
using importador.classes.EN;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace importador
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ClienteEN> lista = ClienteAD.buscaClientes();

            ClienteEN en = new ClienteEN();

            int IDCliente = Convert.ToInt32(Session["IDCliente"]);

            if (IDCliente != 0)
            {
                foreach (var c in lista)
                {
                    if (c._ID_Cliente == IDCliente)
                    {
                        en._ID_Cliente = c._ID_Cliente;
                        en._Razao_Social = c._Razao_Social;
                        en._Foto = c._Foto;
                    }
                }


                btnLogin.Text = String.Format("Olá {0}!", en._Razao_Social);

                btnSair.Visible = true;
            }
            else
            {
                btnSair.Visible = false;
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {

            UsuarioEN user = new UsuarioEN();

            user = UsuarioAD.autenticaUsuario(txtUsuario.Text, txtSenha.Text);

            if (user == null)
            {
                ModalPopupExtender1.Show();
                lblException.Text = "Usuario ou Senha incorretos";
            }
            else
            {
                Session["IDCliente"] = user._IDCliente;
                FormsAuthentication.RedirectFromLoginPage(txtUsuario.Text, false);
                

                Session["Usuario"] = user._Usuario;
                btnLogin.Text = String.Format("Olá {0}!", txtUsuario.Text);

            }

            txtSenha.Text = "";
            txtUsuario.Text = "";

        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session["IDCliente"] = 0;
            Response.Redirect("Dashboard.aspx");
            
        }

        protected void logo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Dashboard.aspx");
        }


    }
}