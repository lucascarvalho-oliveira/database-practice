<p align="center">
  <a href="./README.md">
    <img src="https://img.shields.io/badge/Language-Português-green?style=for-the-badge">
  </a>
</p>

# Database — Book Publisher System

This project contains the implementation of a **relational database designed for managing a book publishing system**.
The database was developed using **SQL** and demonstrates fundamental concepts of **relational database modeling**, including table creation, primary keys, foreign keys, and structural modifications.
The purpose of this project is to **simulate how a publishing company manages information about books, authors, and publishers**, representing the relationships between these entities.

# Database Structure

The database is composed of the following main tables:

### Publisher

Stores information about publishing companies responsible for book publications.

Fields:

* `cod_editora` — Unique identifier for the publisher (Primary Key)
* `nome` — Publisher name
* `endereco` — Publisher address

### Book

Stores the information about registered books.

Fields:

* `cod_livro` — Unique identifier for the book (Primary Key)
* `isbn` — Book ISBN code (unique)
* `titulo` — Book title
* `edicao` — Book edition
* `preco` — Book price (default value: 10)
* `editora_cod` — Reference to the publisher

Relationship:

* Each book belongs to **one publisher**

### Author

Stores information about book authors.

Fields:

* `cod_autor` — Unique identifier for the author (Primary Key)
* `nome` — Author name
* `sexo` — Author gender
* `data_nascimento` — Birth date

### Book_Author

A junction table responsible for the relationship between books and authors.

Fields:

* `cod_livro`
* `cod_autor`

Characteristics:

* Composite primary key (`cod_livro`, `cod_autor`)
* Represents a **many-to-many relationship**

Relationship:

* One book can have **multiple authors**
* One author can write **multiple books**

# Database Relationships

The model implements the following relationships:

* **Publisher 1:N Book**
* **Book N:N Author**

The many-to-many relationship is resolved using the **Book_Author** junction table.

# Structural Changes Performed

During the database development, some structural changes were applied:

* Renamed column `descricao` to `nome` in the `editora` table
* Changed the data type of the `sexo` column
* Added a `UNIQUE` constraint to the `isbn` column
* Set a default value for the `preco` column
* Removed the `num_edicao` column
* Added the `edicao` column

These modifications demonstrate the use of **ALTER TABLE** commands to evolve the database structure.

# Technologies Used

* SQL
* Relational Database Modeling
* Referential Integrity
* Primary Keys and Foreign Keys

# Project Purpose

This project was created for **educational purposes**, aiming to practice:

* Database creation
* Entity and relationship modeling
* Implementation of primary and foreign keys
* Structural table modifications using `ALTER TABLE`
* Data integrity constraints

# Possible Future Improvements

Some possible improvements include:

* Adding sample data using `INSERT`
* Creating analytical queries (`SELECT`)
* Implementing `VIEWs`
* Creating `STORED PROCEDURES`
* Adding indexes to optimize queries

# Project Structure

```
EditoradeLivros.sql
```

This file is responsible for:

* Creating the database
* Creating tables
* Defining relationships
* Applying structural changes
