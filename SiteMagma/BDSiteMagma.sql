
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

ALTER TABLE grupo_produto ADD aplicacao varchar(1000)NULL;

create table texto_idioma(
	id int identity,
	descricao varchar(120),
	aplicacao varchar(1000),
	idproduto int,
	ididioma int,
	Constraint FK_idproduto_texto foreign key(idproduto) references produto(id),
	Constraint FK_ididioma foreign key(ididioma) references idioma(id),
	Constraint UK_produto_idioma unique (idproduto,ididioma)
)


create table idioma(
	id int identity,
	descricao varchar(50)
	Constraint PK_ididioma primary key(id),
)

create table USUARIO
(
	ID int identity,
	nome varchar(35),
	usuario varchar(35),
	senha varchar(32),
	tipo varchar(25),
	
	CONSTRAINT PK_usuario primary key (usuario),
	CONSTRAINT FK_tipo foreign key (tipo) references TIPO_USUARIO(descricao)
)


CREATE TABLE TIPO_USUARIO
(
	ID int identity,
	descricao varchar(25),
	
	CONSTRAINT PK_descricao primary key(descricao)
)


create table evento
(
	ID int identity,
	nome varchar(50),
	data datetime,
	CONSTRAINT PK_evento primary key (ID)
)

create table texto_noticia
(
	ID int identity,
	Titulo varchar(50),
	Link varchar(150),
	Linkbool char,
	Descricao varchar(220),
	Texto varchar(2000),
	IDEvento int,
	IDIdioma int,
	CONSTRAINT PK_texto_noticia primary key(ID),
	CONSTRAINT FK_texto_evento foreign key (IDEvento) references evento(ID),
	CONSTRAINT FK_IDIdioma_texto_Noticia foreign key (IDIdioma) references idioma(id)
)

ALTER TABLE texto_noticia Alter Column Titulo varchar(300)NULL;
ALTER TABLE texto_noticia Alter Column Descricao varchar(500)NULL;


create table foto
(
	ID int identity,
	Nome varchar(50),
	Caminho varchar(200),
	IDEvento int,
	CONSTRAINT PK_foto primary key(ID),
	CONSTRAINT FK_evento_foto foreign key (IDEvento) references evento(ID)
)

create table Arquivo_Slider
(
	ID int identity,
	Foto varchar(300),
	Titulo varchar(250),
	Subtitulo varchar(500),
	IDGrupo int,
	CONSTRAINT FK_IDGrupo_Slider foreign key (IDGrupo) references grupo_produto(id)
)


insert into tipo_usuario
values ('admin')


insert into usuario
values('magmattec','magmattec','efa40d8a73bf4b62b2bc1e820b035c7d','admin')


insert into idioma
values('português')


insert into idioma
values('inglês')


ALTER TABLE grupo_produto ADD imagem varchar(300);


