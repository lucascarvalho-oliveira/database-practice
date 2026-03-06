<p align="center">
  <a href="./README.en.md">
    <img src="https://img.shields.io/badge/Language-English-blue?style=for-the-badge">
  </a>
</p>

# Banco de Dados — Editora de Livros

Este projeto contém a modelagem e implementação de um **banco de dados relacional para gerenciamento de uma editora de livros**.
O banco foi desenvolvido utilizando **SQL** e demonstra conceitos fundamentais de **modelagem relacional**, incluindo criação de tabelas, chaves primárias, chaves estrangeiras e alterações estruturais.
O objetivo do projeto é **simular a organização de informações de livros, autores e editoras**, permitindo representar corretamente os relacionamentos entre essas entidades.

# Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas principais:

### Editora

Armazena informações sobre as editoras responsáveis pela publicação dos livros.

Campos:

* `cod_editora` — Identificador único da editora (Primary Key)
* `nome` — Nome da editora
* `endereco` — Endereço da editora

### Livro

Armazena os dados dos livros cadastrados no sistema.

Campos:

* `cod_livro` — Identificador único do livro (Primary Key)
* `isbn` — Código ISBN do livro (único)
* `titulo` — Título do livro
* `edicao` — Edição do livro
* `preco` — Preço do livro (valor padrão: 10)
* `editora_cod` — Referência para a editora responsável

Relacionamento:

* Cada livro pertence a **uma editora**

### Autor

Armazena os dados dos autores.

Campos:

* `cod_autor` — Identificador único do autor (Primary Key)
* `nome` — Nome do autor
* `sexo` — Sexo do autor
* `data_nascimento` — Data de nascimento

### Livro_Autor

Tabela associativa responsável pelo relacionamento entre livros e autores.

Campos:

* `cod_livro`
* `cod_autor`

Características:

* Chave primária composta (`cod_livro`, `cod_autor`)
* Representa um relacionamento **muitos para muitos**

Relacionamento:

* Um livro pode ter **vários autores**
* Um autor pode escrever **vários livros**

# Relacionamentos do Banco

O modelo implementa os seguintes relacionamentos:

* **Editora 1:N Livro**
* **Livro N:N Autor**

Esse relacionamento N:N é resolvido através da tabela intermediária **livro_autor**.

# Alterações Estruturais Realizadas

Durante a construção do banco foram realizadas algumas modificações estruturais:

* Renomeação da coluna `descricao` para `nome` na tabela `editora`
* Alteração do tipo da coluna `sexo`
* Criação de restrição `UNIQUE` para o campo `isbn`
* Definição de valor padrão para o campo `preco`
* Remoção da coluna `num_edicao`
* Adição da coluna `edicao`

Essas alterações demonstram o uso de comandos **ALTER TABLE** para evolução do banco de dados.

# Tecnologias Utilizadas

* SQL
* Modelagem de Banco de Dados Relacional
* Conceitos de Integridade Referencial
* Chaves Primárias e Estrangeiras

# Objetivo do Projeto

Este projeto foi desenvolvido com fins **educacionais**, com o objetivo de praticar:

* Criação de bancos de dados
* Modelagem de entidades e relacionamentos
* Implementação de chaves primárias e estrangeiras
* Manipulação da estrutura de tabelas utilizando `ALTER TABLE`
* Aplicação de restrições de integridade

# Possíveis Melhorias Futuras

Algumas melhorias que poderiam ser implementadas:

* Inserção de dados de exemplo (`INSERT`)
* Criação de consultas (`SELECT`) para análise de dados
* Implementação de `VIEWs`
* Criação de `PROCEDURES`
* Implementação de índices para otimização de consultas

# Estrutura do Projeto

```
EditoradeLivros.sql
```

Arquivo responsável por:

* Criar o banco de dados
* Criar as tabelas
* Definir relacionamentos
* Aplicar alterações estruturais
