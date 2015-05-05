<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="importador.angular.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
		<title>Aprenda AngularJS - Busca Instantânea</title>

		<link href="http://fonts.googleapis.com/css?family=Cookie|Open+Sans:400,700" rel="stylesheet">

		<!-- Arquivo CSS principal -->
        <link rel="stylesheet" type="text/css" href="../angular/style.css" />

		<!--[if lt IE 9]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
</head>
<body ng-app="instantSearch" ng-controller="InstantSearchController">
		<div class="bar">
			<!-- Crie uma ligação entre o modelo searchString e o campo de texto -->
			<input type="text" ng-model="searchString" placeholder="Digite seu termo de pesquisa">
		</div>

		<ul>
			<!-- Renderize um elemento li para cada entrada no array de itens. Note o filtro de busca customizado "searchFor". Ele pega o valor do modelo searchString como um argumento. -->
			<li ng-repeat="i in items | searchFor:searchString">
				<a href="{{ i.url }}"><img ng-src="{{ i.image }}"></a><p>{{ i.title }}</p>
			</li>
		</ul>

		<!-- Incluindo o AngularJS - Google's CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
        <script src="../angular/script.js"></script>
	</body>
</html>
