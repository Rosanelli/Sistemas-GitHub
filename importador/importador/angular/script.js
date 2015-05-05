// Definindo um novo módulo para nossa aplicação
var app = angular.module ("instantSearch", []);

// Crie um filtro de pesquisa instantânea

app.filter ('searchFor', function () {

	// Todos os filtros devem retornar uma função. O primeiro 
	// parâmetro é um dado que será filtrado, e o segundo é um 
	// argumento que vai ser passado com dois pontos
	// searchFor: searchString

	return function (arr, searchString) {

		if (!searchString) {
			return arr;
		}

		var result = [];

		searchString = searchString.toLowerCase();

		// Usando o útil método forEach para iterar através do array
		angular.forEach (arr, function (item) {

			if (item.title.toLowerCase().indexOf(searchString) !== -1) {
				result.push(item);
			}
		});

		return result;
	};

});


// O Controlador

function InstantSearchController ($scope) {

	// O modelo de dados. Estes itens normalmente são requisitados via Ajax,
	// mas aqui estão simplificados. Veja o próximo exemplo para 
	// dicas usando Ajax.
    
    

    $scope.items = [
		{
		    url: 'http://localhost:52037/Empresa.aspx?param=2',
		    title: 'Banrisul',
		    image: 'http://localhost:52037/Arquivos/banrisul.png'
		},
		{
		    url: 'http://localhost:52037/Empresa.aspx?param=1',
		    title: 'Bradesco',
		    image: 'http://localhost:52037/Arquivos/bradesco.png'
		},
		{
		    url: 'http://localhost:52037/Empresa.aspx?param=3',
		    title: 'Itau',
		    image: 'http://localhost:52037/Arquivos/itau.png'
		},
        {
            url: 'http://localhost:52037/Empresa.aspx?param=4',
            title: 'Jornal Ibia',
            image: 'http://localhost:52037/Arquivos/ibia.png'
        }
	];  
}




