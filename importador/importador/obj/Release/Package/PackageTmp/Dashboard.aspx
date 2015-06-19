<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="importador.pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Angular CSS -->
    <link href="http://fonts.googleapis.com/css?family=Cookie|Open+Sans:400,700" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="angular/style.css" />
    <!-- ---------------------------->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="bar">
        <!-- Crie uma ligação entre o modelo searchString e o campo de texto -->
        <input type="text" ng-model="searchString" placeholder="Digite seu termo de pesquisa">
    </div>

    <ul>
        <!-- Renderize um elemento li para cada entrada no array de itens. Note o filtro de busca customizado "searchFor". Ele pega o valor do modelo searchString como um argumento. -->
        <li ng-repeat="i in items | searchFor:searchString">
            <a href="{{ i.url }}">
                <img ng-src="{{ i.image }}"></a><p>{{ i.title }}</p>
        </li>
    </ul>

    <!-- Angular javascript -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script src="angular/script.js"></script>
    <!-- ---------------------------->

</asp:Content>
