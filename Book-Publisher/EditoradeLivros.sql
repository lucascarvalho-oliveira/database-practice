create database book_publisher;
use book_publisher;

create table editora(
cod_editora int auto_increment primary key,
descricao varchar(45) not null,
endereco varchar(45)
);

create table livro(
cod_livro int auto_increment primary key,
isbn varchar(45) not null,
titulo varchar(45) not null,
num_edicao varchar(45),
preco float not null,
editora_cod int not null,
foreign key fk_editora_cod(editora_cod) references editora(cod_editora)
);

create table autor(
cod_autor int auto_increment primary key,
nome varchar(45) not null,
sexo char,
data_nascimento date not null
);

create table livro_autor(
cod_livro int not null,
cod_autor int not null,
PRIMARY KEY(cod_livro,cod_autor),
foreign key fk_cod_livro(cod_livro) references livro(cod_livro),
foreign key fk_cod_autor(cod_autor) references autor(cod_autor)
);

-- Trocando o nome da caluna descriçâo para nome.
alter table editora rename column descricao to nome;

-- Trocando o tipo de dado da coluna sexo.
alter table autor modify column sexo varchar(1);

-- Adcionando uma restrisão a coluna isbn.
alter table livro add constraint unique(isbn);

-- Adicionando 10 como padrao na tabela valor.
alter table livro modify preco float not null default 10;

-- Apagando a coluna num_edicao da tabela livro.
alter table livro drop column num_edicao;

-- Adicionando a coluna edicao a tabela livro.
alter table livro add column edicao varchar(45) after titulo;


