-- ============================================================
-- PROJETO: ALUGUEL DE CARROS
-- V3 - Atualização de dados
-- ============================================================

-- Atualiza o endereço do cliente João
UPDATE pessoas
SET endereco = 'Rua das Flores, 200'
WHERE cpf = '11111111111'
  AND endereco <> 'Rua das Flores, 200';


-- Atualiza o modelo do veículo
UPDATE veiculos
SET modelo = 'Corolla XEi'
WHERE placa = 'ABC1D23'
  AND modelo <> 'Corolla XEi';


-- Atualiza a forma de pagamento do contrato
UPDATE contratos
SET tipo_pagamento = 'Cartao'
WHERE numero_contrato = 1001
  AND tipo_pagamento <> 'Cartao';