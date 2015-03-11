create table Usuario
(
	IDUsuario int identity,
	Nome varchar(30),
	Senha varchar(30),
	Constraint PK_IDUsuario Primary Key (IDUsuario)
)

create table Acesso
(
	ID_Acesso int identity,
	Data DateTime,
	Tipo char,
	IDUsuario int,
	Constraint FK_IDUsuario FOREIGN KEY (IDUsuario) REFERENCES Usuario(IDUsuario)	
)