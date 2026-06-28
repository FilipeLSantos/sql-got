# Projeto de Banco de Dados - Game of Thrones

Este projeto tem como objetivo implementar um banco de dados relacional inspirado no universo de Game of Thrones, usando PostgreSQL e SQL explícito para criar as tabelas, definir as relações e montar as consultas.

## Objetivo do trabalho

O trabalho consiste em:

- criar o modelo relacional do sistema;
- implementar as relações entre as entidades;
- escrever os scripts em SQL para criação das tabelas;
- inserir dados de teste;
- executar uma consulta relacionada à casa Stark.

As relações já foram pensadas no projeto e agora devem ser representadas no banco de dados por meio de comandos SQL.

## Tema do projeto

O contexto do banco é baseado no mundo de Game of Thrones, com entidades como:

- casas;
- personagens;
- armas;
- batalhas;
- guerras;
- participações em batalhas;
- assassinatos.

## Nome do banco de dados

O banco de dados pode ser chamado de:

```sql
got_db
```

Ou, se preferirem, um nome parecido como `got_project` ou `got_stark_db`.

## Pré-requisitos

Para desenvolver e executar o projeto, é necessário ter instalado:

- PostgreSQL;
- pgAdmin;
- Git;
- GitHub.

## Como criar o banco no pgAdmin

1. Abra o pgAdmin.
2. Entre no servidor PostgreSQL.
3. Clique com o botão direito em Databases.
4. Escolha Create > Database.
5. Crie o banco com o nome `got_db`.
6. Abra o banco e use o Query Tool para executar os scripts SQL.

## Scripts SQL a serem criados

Os scripts podem ser criados da seguinte forma:

- `01_create_tables.sql` — criação das tabelas e das relações;
- `02_insert_data.sql` — inserção de dados de teste;
- `03_consulta_stark.sql` — execução da consulta solicitada.

## Como executar os scripts

Execute os scripts na ordem abaixo no Query Tool do pgAdmin:

1. `01_create_tables.sql`
2. `02_insert_data.sql`
3. `03_consulta_stark.sql`

## Exemplo de fluxo de trabalho

O fluxo esperado para o projeto é:

1. criar as tabelas com as chaves primárias, estrangeiras e restrições;
2. inserir dados com sentido no contexto do universo de Game of Thrones;
3. testar a consulta e verificar os resultados.

## Observação

O foco principal deste trabalho é a implementação correta das relações no banco de dados e a criação dos scripts SQL de forma clara e organizada, mantendo o tema de Game of Thrones como contexto do projeto.
