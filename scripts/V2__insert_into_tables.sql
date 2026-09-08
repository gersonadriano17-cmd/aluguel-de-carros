-- ============================================================
-- PROJETO: ALUGUEL DE CARROS
-- V2 - Inserção de dados
-- ============================================================

-- PESSOAS
INSERT INTO pessoas
    (cpf, nome, sobrenome, endereco, email)
VALUES
    ('11111111111', 'Joao', 'Silva', 'Rua das Flores, 100', 'joao.silva@email.com'),
    ('22222222222', 'Maria', 'Santos', 'Avenida Brasil, 250', 'maria.santos@email.com'),
    ('33333333333', 'Carlos', 'Oliveira', 'Rua Amazonas, 500', 'carlos.oliveira@email.com'),
    ('44444444444', 'Ana', 'Costa', 'Rua Sao Paulo, 150', 'ana.costa@email.com'),
    ('55555555555', 'Pedro', 'Almeida', 'Avenida Guapore, 700', 'pedro.almeida@email.com')
ON CONFLICT (cpf) DO NOTHING;


-- CLIENTES
INSERT INTO clientes
    (cpf, banco, agencia, conta, tipo_conta, pix_chave)
VALUES
    ('11111111111', 'Banco do Brasil', '1234', '10001-2', 'Corrente', 'joao.pix@email.com'),
    ('22222222222', 'Caixa Economica Federal', '4321', '20002-3', 'Poupanca', '22222222222'),
    ('33333333333', 'Bradesco', '5678', '30003-4', 'Corrente', 'carlos.pix@email.com'),
    ('44444444444', 'Itau', '9876', '40004-5', 'Corrente', '44444444444')
ON CONFLICT (cpf) DO NOTHING;


-- ATENDENTES
-- Joao e Maria sao atendentes.
-- Joao tambem esta cadastrado como cliente.
INSERT INTO atendentes
    (cpf, cargo)
VALUES
    ('11111111111', 'Atendente'),
    ('22222222222', 'Atendente'),
    ('55555555555', 'Gerente')
ON CONFLICT (cpf) DO NOTHING;


-- VEICULOS
INSERT INTO veiculos
    (placa, marca, modelo, tipo)
VALUES
    ('ABC1D23', 'Toyota', 'Corolla', 'Carro de passeio'),
    ('DEF4G56', 'Honda', 'CG 160', 'Moto'),
    ('GHI7J89', 'Chevrolet', 'Onix', 'Carro de passeio'),
    ('JKL0M12', 'Volkswagen', 'Saveiro', 'Carro de passeio'),
    ('NOP3Q45', 'Volvo', 'FH', 'Caminhao')
ON CONFLICT (placa) DO NOTHING;


-- CONTRATOS
INSERT INTO contratos
    (
        numero_contrato,
        data_contrato,
        tipo_pagamento,
        cliente_cpf,
        veiculo_placa,
        data_inicio,
        data_fim
    )
VALUES
    (
        1001,
        '2026-09-01',
        'PIX',
        '11111111111',
        'ABC1D23',
        '2026-09-02',
        '2026-09-10'
    ),
    (
        1002,
        '2026-09-02',
        'Cartao',
        '22222222222',
        'DEF4G56',
        '2026-09-03',
        '2026-09-08'
    ),
    (
        1003,
        '2026-09-03',
        'PIX',
        '33333333333',
        'GHI7J89',
        '2026-09-05',
        '2026-09-15'
    ),
    (
        1004,
        '2026-09-04',
        'Cartao',
        '44444444444',
        'JKL0M12',
        '2026-09-06',
        '2026-09-12'
    )
ON CONFLICT (numero_contrato) DO NOTHING;