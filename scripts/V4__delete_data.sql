-- ============================================================
-- PROJETO: ALUGUEL DE CARROS
-- V4 - Exclusão de dados
-- ============================================================

-- Remove um veículo que não possui contrato associado.
DELETE FROM veiculos
WHERE placa = 'NOP3Q45';