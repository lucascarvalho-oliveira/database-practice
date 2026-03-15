<p align="center">
  <a href="./docs/README.en.md">
    <img src="https://img.shields.io/badge/Language-English-blue?style=for-the-badge">
  </a>
</p>

# Sistema Bancário - Banco de Dados MySQL

## Descrição

Este projeto contém a modelagem e implementação de um **banco de dados de sistema bancário** utilizando **MySQL**.

O banco de dados armazena informações sobre:

- Bancos
- Agências
- Contas
- Clientes
- Histórico de contas
- Telefones de clientes

O objetivo é demonstrar a criação de **tabelas relacionais**, uso de **chaves primárias**, **chaves estrangeiras** e inserção de dados.

## Diagrama Entidade Relacionamento (DER)

```mermaid
erDiagram
    BANCO ||--o{ AGENCIA : possui
    AGENCIA ||--o{ CONTA : contem
    CLIENTE ||--o{ HISTORICO : tem
    CONTA ||--o{ HISTORICO : registra
    CLIENTE ||--o{ TELEFONE_CLIENTE : possui
```
Este diagrama representa os relacionamentos principais do banco de dados:
-	Um banco possui várias agências
-	Uma agência possui várias contas
-	Um cliente pode ter várias contas registradas no histórico
-	Uma conta pode aparecer várias vezes no histórico
-	Um cliente pode possuir vários telefones

## Estrutura do Banco de Dados

O banco de dados criado no script se chama:

```sql
banco
```

Ele possui as seguintes tabelas:

- banco
- agencia
- conta
- cliente
- historico
- telefone_cliente

## Tabela: banco

Armazena os bancos cadastrados.

| Campo | Tipo | Descrição |
|------|------|-----------|
| codigo | INT | Identificador do banco |
| nome | VARCHAR(45) | Nome do banco |

## Tabela: agencia

Armazena as agências dos bancos.

| Campo | Tipo | Descrição |
|------|------|-----------|
| numero_agencia | INT | Número da agência |
| cod_banco | INT | Código do banco |
| endereco | VARCHAR(45) | Endereço da agência |

Relacionamento:

```sql
agencia.cod_banco → banco.codigo
```

## Tabela: conta

Armazena as contas bancárias.

| Campo | Tipo | Descrição |
|------|------|-----------|
| num_conta | VARCHAR(7) | Número da conta |
| saldo | FLOAT | Saldo da conta |
| tipo_conta | INT | Tipo da conta |
| num_agencia | INT | Agência da conta |

Relacionamento:

```sql
conta.num_agencia → agencia.numero_agencia
```

## Tabela: cliente

Armazena os clientes do banco.

| Campo | Tipo | Descrição |
|------|------|-----------|
| cpf | VARCHAR(14) | CPF do cliente |
| nome | VARCHAR(45) | Nome |
| endereco | VARCHAR(45) | Endereço |
| sexo | CHAR(1) | Sexo |

## Tabela: historico

Armazena o histórico de relacionamento entre cliente e conta.

| Campo | Tipo | Descrição |
|------|------|-----------|
| cpf | VARCHAR(14) | CPF do cliente |
| num_conta | VARCHAR(7) | Número da conta |
| data_inicio | DATE | Data de início |

Chave primária composta:

```sql
(cpf, num_conta)
```

Relacionamentos:

```sql
historico.cpf → cliente.cpf
historico.num_conta → conta.num_conta
```

## Tabela: telefone_cliente

Armazena os telefones dos clientes.

| Campo | Tipo | Descrição |
|------|------|-----------|
| cpf_cli | VARCHAR(14) | CPF do cliente |
| telefone | VARCHAR(20) | Telefone |

Chave primária composta:

```sql
(cpf_cli, telefone)
```

Relacionamento:

```sql
telefone_cliente.cpf_cli → cliente.cpf
```

---

## Como Executar

1. Abra o **MySQL Workbench** ou outro gerenciador MySQL
2. Copie o conteúdo do arquivo `Banco.sql`
3. Execute o script

O script irá:

1. Criar o banco de dados
2. Criar as tabelas
3. Inserir dados de exemplo
4. Executar consultas

## Conceitos Utilizados

- Modelagem de banco de dados
- Chaves primárias
- Chaves estrangeiras
- Relacionamentos entre tabelas
- Inserção de dados
- Consultas SQL
