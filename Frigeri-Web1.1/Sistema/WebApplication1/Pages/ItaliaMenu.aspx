<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItaliaMenu.aspx.cs" Inherits="WebApplication1.Pages.ItaliaMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LinkButton Text="Fornecedores" runat="server" OnClick="Unnamed_Click" />
    <asp:LinkButton ID="LinkButton1" Text="Clientes" runat="server" OnClick="LinkButton1_Click" />
    <asp:LinkButton ID="LinkButton2" Text="Despesas" runat="server" OnClick="LinkButton2_Click" />
    <asp:LinkButton ID="LinkButton3" Text="Cortesia" runat="server" OnClick="LinkButton3_Click" />
    <asp:LinkButton ID="LinkButton4" Text="Reversões de Frete" runat="server" OnClick="LinkButton4_Click" />
</asp:Content>
