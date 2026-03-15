CREATE DATABASE banco;
USE banco;

CREATE TABLE banco(
codigo int not null auto_increment primary key,
nome varchar(45)
);

CREATE TABLE agencia(
numero_agencia int not null auto_increment primary key,
cod_banco int not null,
endereco varchar(45),
foreign key fk_cod_banco(cod_banco) references banco(codigo)
);

CREATE TABLE conta(
num_conta varchar(7) not null primary key,
saldo float not null,
tipo_conta int,
num_agencia int not null,
foreign key fk_num_agencia(num_agencia) references agencia(numero_agencia)
);

CREATE TABLE cliente(
cpf varchar(14) not null primary key,
nome varchar(45) not null,
endereco varchar(45),
sexo char(1)
);

CREATE TABLE historico(
cpf varchar(14) not null,
num_conta varchar(7) not null,
data_inicio date,
primary key(cpf, num_conta),
foreign key fk_cpf(cpf) references cliente(cpf),
foreign key fk_num_conta(num_conta) references conta(num_conta)
);

CREATE TABLE telefone_cliente(
cpf_cli varchar(14) not null,
telefone varchar(20) not null,
primary key(cpf_cli, telefone),
foreign key fk_cpf_cli(cpf_cli) references cliente(cpf)
);

---------------------------------------------------------------------------------

-- Adicionando valores a tabela banco.
insert into banco (codigo, nome)
values (1, 'Banco Brasil'),
(4, 'CEF');

-- Adicionando valores a tabela agencia.
insert into agencia (numero_agencia, cod_banco, endereco)
values (0562, 4, 'Rua Joaquim Teixeira Alves, 155'),
(3153, 1, 'Av. Marcelino Pires, 1960');

-- Adicionando valores a tabela conta.
insert into conta (num_conta, saldo, tipo_conta, num_agencia)
values ('86340-2', 763.05, 2, 3153),
('23584-7', 3879.12, 1, 0562);

-- Adicionando valores a tabela cliente.
insert into cliente (cpf, nome, endereco, sexo)
values ('111.222.333-44', 'Jennifer B Souza', 'Rua Guiabá, 1050', 'F'),
('666.777.888-99', 'Caetano K Lima', 'Rua Ivinhema, 879', 'M'),
('555.444.777-33', 'Silvia Macedo', 'Rua Estado Unidos, 735', 'F');

-- Adicionando valores a tabela historico.
insert into historico (cpf, num_conta, data_inicio)
values ('111.222.333-44', '23584-7', '1997-12-17'),
('666.777.888-99', '23584-7', '1997-12-17'),
('555.444.777-33', '86340-2', '2010-11-29');

-- Adicionando valores a tabela telefone_cliente.
insert into telefone_cliente (cpf_cli, telefone)
values ('111.222.333-44', '(67)3422-7788'),
('666.777.888-99', '(67)3423-9900'),
('666.777.888-99', '(67)8121-8833');

-- mostrar tabela na tela.
select * from telefone_cliente;