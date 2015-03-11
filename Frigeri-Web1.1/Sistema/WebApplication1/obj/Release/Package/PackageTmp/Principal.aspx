<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="WebApplication1.Principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <ol class="round">
        <li class="one">
            <h5>Itália</h5>
            <asp:ImageButton ID="imgUnimed" runat="server" ImageUrl="~/Images/italia.png" OnClick="imgUnimed_Click1" />
        </li>
        <li class="two">
            <h5>Unylaser</h5>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/unylaser.jpg" OnClick="ImageButton1_Click" />
        </li>
    </ol>
</asp:Content>
