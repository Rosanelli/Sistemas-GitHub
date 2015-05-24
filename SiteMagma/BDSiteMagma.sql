
create table NOTICIA(
 id int identity,
 titulo varchar(110),
 descricao varchar(250),
 texto varchar(2500),
 Constraint PK_idnoticia primary key(id),
 Constraint UK_titulonoticia unique(titulo)
)

-------------------------------------------------
tabelas atualizadas

create table produto (  
 id int identity,
 nome varchar(60),
 imagem varchar(300),
 idgrupo int,
 Constraint PK_idproduto primary key(id),
 Constraint FK_idproduto foreign key(idgrupo) references grupo_produto(id)
)



create table grupo_produto(
  id int identity,
  descricao varchar(50),
  Constraint PK_idgrupo_produto primary key(id)   
)

create table texto_idioma(
	id int identity,
	descricao varchar(120),
	aplicacao varchar(500),
	idproduto int,
	ididioma int,
	Constraint FK_idproduto_texto foreign key(idproduto) references produto(id),
	Constraint FK_ididioma foreign key(ididioma) references produto(id),
	Constraint UK_produto_idioma unique (idproduto,ididioma)
)



create table idioma(
	id int identity,
	descricao varchar(50)
	Constraint PK_ididioma primary key(id),
)

insert into idioma
values('português')


insert into idioma
values('inglês')


select * from produto