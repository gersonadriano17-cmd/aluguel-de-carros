# Sistema de Aluguel de Carros

## 1. Apresentação do Projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional para uma empresa de aluguel de veículos, utilizando o Sistema Gerenciador de Banco de Dados (SGBD) PostgreSQL.

O sistema foi desenvolvido com foco no atendimento de motoristas de aplicativos que necessitam alugar veículos para realizar suas atividades profissionais.

## 2. Objetivo Geral

O objetivo do projeto é desenvolver uma estrutura de banco de dados capaz de armazenar e organizar informações sobre pessoas, clientes, atendentes, veículos e contratos de aluguel.

O banco permite registrar os clientes, os atendentes, os veículos disponíveis e os contratos realizados, mantendo os relacionamentos e a integridade dos dados.

## 3. Público-Alvo

O sistema é destinado a empresas que trabalham com aluguel de veículos, especialmente empresas que atendem motoristas de aplicativos.

Os principais usuários são:

- Clientes que alugam veículos;
- Atendentes responsáveis pelo atendimento aos clientes;
- Funcionários responsáveis pelo gerenciamento dos contratos e veículos.

## 4. Funcionalidades

O banco de dados permite:

- Cadastrar pessoas;
- Identificar pessoas que são clientes;
- Identificar pessoas que são atendentes;
- Permitir que uma mesma pessoa seja cliente e atendente;
- Cadastrar veículos;
- Registrar o tipo do veículo;
- Registrar contratos de aluguel;
- Associar contratos aos respectivos clientes;
- Associar contratos aos veículos alugados;
- Registrar a forma de pagamento;
- Registrar o período de vigência dos contratos;
- Atualizar informações;
- Excluir registros;
- Realizar consultas sobre os dados armazenados.

## 5. Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

### Pessoas

Armazena os dados básicos das pessoas cadastradas no sistema.

### Clientes

Armazena informações adicionais das pessoas que podem realizar contratos de aluguel.

### Atendentes

Identifica as pessoas que trabalham como atendentes.

Uma pessoa pode estar cadastrada simultaneamente como cliente e atendente.

### Veículos

Armazena os veículos disponíveis para aluguel, contendo placa, marca, modelo e tipo.

### Contratos

Armazena os contratos de aluguel, relacionando um cliente a um veículo e registrando as informações de pagamento e período de vigência.

## 6. Diagrama do Banco de Dados

 mermaid
  DIagrama

   PESSOAS {
        VARCHAR(11) cpf PK
        VARCHAR(100) nome
        VARCHAR(100) sobrenome
        VARCHAR(200) endereco
        VARCHAR(150) email
    }

  CLIENTES {
        VARCHAR(11) cpf PK, FK
        VARCHAR(100) banco
        VARCHAR(20) agencia
        VARCHAR(30) conta
        VARCHAR(20) tipo_conta
        VARCHAR(150) pix_chave
    }

  ATENDENTES {
        VARCHAR(11) cpf PK, FK
        VARCHAR(50) cargo
    }

  VEICULOS {
        VARCHAR(10) placa PK
        VARCHAR(50) marca
        VARCHAR(100) modelo
        VARCHAR(30) tipo
    }

  CONTRATOS {
        INTEGER numero_contrato PK
        DATE data_contrato
        VARCHAR(20) tipo_pagamento
        VARCHAR(11) cliente_cpf FK
        VARCHAR(10) veiculo_placa FK
        DATE data_inicio
        DATE data_fim
    }

  PESSOAS ||--o| CLIENTES : "pode ser"
  PESSOAS ||--o| ATENDENTES : "pode ser"
  CLIENTES ||--o{ CONTRATOS : "realiza"
  VEICULOS ||--o{ CONTRATOS : "é alugado em"





7. Scripts SQL

Os scripts utilizados na implementação do banco estão disponíveis na pasta scripts.

V1 - Criação das tabelas

Criação das tabelas e definição das chaves primárias, chaves estrangeiras e restrições de integridade.

V2 - Inserção de dados

Inserção de dados fictícios para testar as tabelas e seus relacionamentos.

V3 - Atualização de dados

Execução de comandos UPDATE para validar a alteração de informações.

V4 - Exclusão de dados

Execução de comandos DELETE para validar a exclusão de registros.

V5 - Consultas

Execução de comandos SELECT para consultar e validar os dados armazenados.


8. Tecnologias Utilizadas
PostgreSQL
SQL
Git
GitHub
Mermaid




Organização dos Arquivos
aluguel-de-carros/
│
├── README.md
│
└── scripts/
    ├── V1__create_tables.sql
    ├── V2__insert_into_tables.sql
    ├── V3__update_data.sql
    ├── V4__delete_data.sql
    └── V5__select_queries.sql
