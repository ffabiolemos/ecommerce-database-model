use ecommerce_refinado;

-- =========================
-- CLIENTES (5)
-- =========================
insert into cliente (endereco, tipo_cliente) values
('Rua A, 100 - SP', 'PF'),
('Rua B, 200 - RJ', 'PF'),
('Rua C, 300 - MG', 'PF'),
('Av. Empresarial, 1000 - SP', 'PJ'),
('Av. Comercial, 2000 - PR', 'PJ');

-- =========================
-- CLIENTES PF (3)
-- =========================
insert into cliente_pf (id_cliente, nome, cpf, data_nascimento) values
(1, 'João Pereira', '11111111111', '1992-03-15'),
(2, 'Mariana Lima', '22222222222', '1988-07-21'),
(3, 'Ricardo Alves', '33333333333', '1995-11-02');

-- =========================
-- CLIENTES PJ (2)
-- =========================
insert into cliente_pj (id_cliente, razao_social, nome_fantasia, cnpj) values
(4, 'Alpha Tecnologia LTDA', 'AlphaTech', '11111111000191'),
(5, 'Beta Comércio SA', 'BetaCom', '22222222000182');

-- =========================
-- PRODUTOS (6)
-- =========================
insert into produto (nome, categoria, valor, avaliacao) values
('Notebook Lenovo', 'Eletrônico', 3200.00, 4.5),
('iPhone 14', 'Eletrônico', 5000.00, 4.9),
('Camiseta Nike', 'Vestimenta', 150.00, 4.4),
('Mesa Escritório', 'Móveis', 800.00, 4.3),
('Carrinho Hot Wheels', 'Brinquedos', 80.00, 4.6),
('Chocolate Gourmet', 'Alimentos', 35.00, 4.8);

-- =========================
-- PAGAMENTOS (8 registros)
-- =========================
insert into pagamento (id_cliente, tipo_pagamento, detalhes) values
(1, 'Cartão', 'Visa final 1234'),
(1, 'Pix', 'CPF 11111111111'),
(2, 'Boleto', 'Banco do Brasil'),
(2, 'Cartão', 'Master final 4567'),
(3, 'Pix', 'CPF 33333333333'),
(4, 'Cartão', 'Cartão Empresarial'),
(4, 'Boleto', 'Itaú Empresa'),
(5, 'Pix', 'CNPJ 22222222000182');

-- =========================
-- PEDIDOS (5)
-- =========================
insert into pedido (id_cliente, status_pedido, valor_frete) values
(1, 'Confirmado', 20.00),
(2, 'Em processamento', 15.00),
(3, 'Confirmado', 18.00),
(4, 'Confirmado', 25.00),
(5, 'Em processamento', 30.00);

-- =========================
-- ITENS DO PEDIDO (10 registros)
-- =========================
insert into item_pedido (id_pedido, id_produto, quantidade, valor_unitario) values
(1, 1, 1, 3200.00),
(1, 6, 3, 35.00),
(2, 2, 1, 5000.00),
(2, 3, 2, 150.00),
(3, 4, 1, 800.00),
(3, 5, 4, 80.00),
(4, 1, 2, 3200.00),
(4, 3, 5, 150.00),
(5, 2, 1, 5000.00),
(5, 6, 10, 35.00);

-- =========================
-- ENTREGAS (5 - 1 por pedido)
-- =========================
insert into entrega (id_pedido, status_entrega, codigo_rastreio) values
(1, 'Em transporte', 'BR000000001SP'),
(2, 'Aguardando envio', 'BR000000002RJ'),
(3, 'Entregue', 'BR000000003MG'),
(4, 'Em transporte', 'BR000000004SP'),
(5, 'Aguardando envio', 'BR000000005PR');
