<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItaliaReversoes.aspx.cs" Inherits="WebApplication1.Pages.ItaliaReversoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <div>
            <asp:FileUpload ID="fupArquivo" runat="server" />
            <asp:Literal ID="litStatus" runat="server"></asp:Literal>
        </div>
        <div>
            <asp:Button ID="btnUpload" runat="server" Text="Formatar Arquivo" OnClick="btnUpload_Click" />
        </div>
    </fieldset>

    <div>
        <asp:Literal ID="Literal1" Text="Arquivos Originais" runat="server" />
        <asp:Repeater ID="repArquivos" runat="server" >
            <ItemTemplate>
                <div>
                    <asp:HyperLink ID="HyperLink1" Text='<%# Eval("NomeArquivo")%>' NavigateUrl='<%# Eval("Foto")%>' runat="server">HyperLink</asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div>
        <asp:Literal ID="Literal2" Text="Arquivos Formatados" runat="server" />
        <asp:Repeater ID="repArquivosFormatados" runat="server">
            <ItemTemplate>
                <div>
                    <asp:HyperLink ID="HyperLink1" Text='<%# Eval("NomeArquivo")%>' NavigateUrl='<%# Eval("Foto")%>' runat="server">HyperLink</asp:HyperLink>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
