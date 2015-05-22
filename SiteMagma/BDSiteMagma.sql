
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
 imagem varchar(300),
 imagemZoom varchar(300),
 descricao varchar(120),
 aplicacao varchar(500),
 idgrupo int,
 Constraint PK_idproduto primary key(id),
 Constraint FK_idproduto foreign key(idgrupo) references grupo_produto(id)
)

create table grupo_produto(
  id int identity,
  descricao varchar(50),
  Constraint PK_idgrupo_produto primary key(id)   
)

select * from produto