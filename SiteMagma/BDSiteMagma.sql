
create table NOTICIA(
 id int identity,
 titulo varchar(110),
 descricao varchar(250),
 texto varchar(2500),
 Constraint PK_idnoticia primary key(id),
 Constraint UK_titulonoticia unique(titulo)
)