<p align="center">
  <a href="../README.md">
    <img src="https://img.shields.io/badge/Language-Português-green?style=for-the-badge">
  </a>
</p>

# Banking System - MySQL Database

## Description

This project contains the modeling and implementation of a **banking system database** using **MySQL**.

The database stores information about:

- Banks
- Branches
- Accounts
- Clients
- Account history
- Client phone numbers

The goal is to demonstrate the creation of **relational tables**, the use of **primary keys**, **foreign keys**, and data insertion.

## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    BANCO ||--o{ AGENCIA : possui
    AGENCIA ||--o{ CONTA : contem
    CLIENTE ||--o{ HISTORICO : tem
    CONTA ||--o{ HISTORICO : registra
    CLIENTE ||--o{ TELEFONE_CLIENTE : possui
```

This diagram represents the main relationships of the database:

- A bank has several branches
- A branch contains several accounts
- A client can have multiple accounts recorded in the history
- An account can appear multiple times in the history
- A client can have multiple phone numbers

## Database Structure

The database created in the script is called:

```sql
banco
```

It contains the following tables:

- banco
- agencia
- conta
- cliente
- historico
- telefone_cliente

## Table: banco

Stores registered banks.

| Field | Type | Description |
|------|------|-----------|
| codigo | INT | Bank identifier |
| nome | VARCHAR(45) | Bank name |

## Table: agencia

Stores bank branches.

| Field | Type | Description |
|------|------|-----------|
| numero_agencia | INT | Branch number |
| cod_banco | INT | Bank code |
| endereco | VARCHAR(45) | Branch address |

Relationship:

```sql
agencia.cod_banco → banco.codigo
```

## Table: conta

Stores bank accounts.

| Field | Type | Description |
|------|------|-----------|
| num_conta | VARCHAR(7) | Account number |
| saldo | FLOAT | Account balance |
| tipo_conta | INT | Account type |
| num_agencia | INT | Account branch |

Relationship:

```sql
conta.num_agencia → agencia.numero_agencia
```

## Table: cliente

Stores bank clients.

| Field | Type | Description |
|------|------|-----------|
| cpf | VARCHAR(14) | Client CPF |
| nome | VARCHAR(45) | Name |
| endereco | VARCHAR(45) | Address |
| sexo | CHAR(1) | Gender |

## Table: historico

Stores the relationship history between client and account.

| Field | Type | Description |
|------|------|-----------|
| cpf | VARCHAR(14) | Client CPF |
| num_conta | VARCHAR(7) | Account number |
| data_inicio | DATE | Start date |

Composite primary key:

```sql
(cpf, num_conta)
```

Relationships:

```sql
historico.cpf → cliente.cpf
historico.num_conta → conta.num_conta
```

## Table: telefone_cliente

Stores client phone numbers.

| Field | Type | Description |
|------|------|-----------|
| cpf_cli | VARCHAR(14) | Client CPF |
| telefone | VARCHAR(20) | Phone number |

Composite primary key:

```sql
(cpf_cli, telefone)
```

Relationship:

```sql
telefone_cliente.cpf_cli → cliente.cpf
```

---

## How to Run

1. Open **MySQL Workbench** or another MySQL manager
2. Copy the contents of the `Banco.sql` file
3. Execute the script

The script will:

1. Create the database
2. Create the tables
3. Insert example data
4. Execute queries

## Concepts Used

- Database modeling
- Primary keys
- Foreign keys
- Relationships between tables
- Data insertion
- SQL queries
