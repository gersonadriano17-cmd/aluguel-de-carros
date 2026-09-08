-- ============================================================
-- PROJETO: ALUGUEL DE CARROS
-- V1 - Criação das tabelas
-- ============================================================

CREATE TABLE IF NOT EXISTS pessoas (
    cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS clientes (
    cpf VARCHAR(11) PRIMARY KEY,
    banco VARCHAR(100) NOT NULL,
    agencia VARCHAR(20) NOT NULL,
    conta VARCHAR(30) NOT NULL,
    tipo_conta VARCHAR(20) NOT NULL,
    pix_chave VARCHAR(150),

    CONSTRAINT fk_cliente_pessoa
        FOREIGN KEY (cpf)
        REFERENCES pessoas(cpf),

    CONSTRAINT chk_tipo_conta
        CHECK (tipo_conta IN ('Corrente', 'Poupanca'))
);

CREATE TABLE IF NOT EXISTS atendentes (
    cpf VARCHAR(11) PRIMARY KEY,
    cargo VARCHAR(50) NOT NULL DEFAULT 'Atendente',

    CONSTRAINT fk_atendente_pessoa
        FOREIGN KEY (cpf)
        REFERENCES pessoas(cpf)
);

CREATE TABLE IF NOT EXISTS veiculos (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    tipo VARCHAR(30) NOT NULL,

    CONSTRAINT chk_tipo_veiculo
        CHECK (tipo IN ('Moto', 'Caminhao', 'Carro de passeio'))
);

CREATE TABLE IF NOT EXISTS contratos (
    numero_contrato INTEGER PRIMARY KEY,
    data_contrato DATE NOT NULL DEFAULT CURRENT_DATE,
    tipo_pagamento VARCHAR(20) NOT NULL,
    cliente_cpf VARCHAR(11) NOT NULL,
    veiculo_placa VARCHAR(10) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,

    CONSTRAINT fk_contrato_cliente
        FOREIGN KEY (cliente_cpf)
        REFERENCES clientes(cpf),

    CONSTRAINT fk_contrato_veiculo
        FOREIGN KEY (veiculo_placa)
        REFERENCES veiculos(placa),

    CONSTRAINT chk_tipo_pagamento
        CHECK (tipo_pagamento IN ('Cartao', 'PIX')),

    CONSTRAINT chk_periodo_contrato
        CHECK (data_fim >= data_inicio)
);