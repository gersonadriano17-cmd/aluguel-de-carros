-- ============================================================
-- PROJETO: ALUGUEL DE CARROS
-- V5 - Consultas de teste
-- ============================================================

-- Lista todas as pessoas
SELECT *
FROM pessoas;


-- Lista todos os clientes
SELECT *
FROM clientes;


-- Lista todos os atendentes
SELECT *
FROM atendentes;


-- Lista todos os veículos
SELECT *
FROM veiculos;


-- Lista todos os contratos
SELECT *
FROM contratos;


-- Lista os contratos com os dados dos clientes e veículos
SELECT
    c.numero_contrato,
    p.nome,
    p.sobrenome,
    v.placa,
    v.marca,
    v.modelo,
    v.tipo,
    c.tipo_pagamento,
    c.data_inicio,
    c.data_fim
FROM contratos c
JOIN clientes cl
    ON c.cliente_cpf = cl.cpf
JOIN pessoas p
    ON cl.cpf = p.cpf
JOIN veiculos v
    ON c.veiculo_placa = v.placa;


-- Mostra as pessoas que são simultaneamente
-- clientes e atendentes
SELECT
    p.cpf,
    p.nome,
    p.sobrenome,
    p.email
FROM pessoas p
JOIN clientes c
    ON p.cpf = c.cpf
JOIN atendentes a
    ON p.cpf = a.cpf;