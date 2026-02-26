create database ecommerce;
use ecommerce;

-- =========================
-- CLIENTE (GENÉRICO)
-- =========================
create table cliente(
    id_cliente int auto_increment primary key,
    endereco varchar(100),
    tipo_cliente enum('PF','PJ') not null
);

-- =========================
-- CLIENTE PESSOA FÍSICA
-- =========================
create table cliente_pf(
    id_cliente int primary key,
    nome varchar(50) not null,
    cpf char(11) not null unique,
    data_nascimento date,
    constraint fk_cliente_pf
        foreign key (id_cliente)
        references cliente(id_cliente)
        on delete cascade
);

-- =========================
-- CLIENTE PESSOA JURÍDICA
-- =========================
create table cliente_pj(
    id_cliente int primary key,
    razao_social varchar(100) not null,
    nome_fantasia varchar(100),
    cnpj char(14) not null unique,
    constraint fk_cliente_pj
        foreign key (id_cliente)
        references cliente(id_cliente)
        on delete cascade
);

-- =========================
-- PRODUTO
-- =========================
create table produto(
    id_produto int auto_increment primary key,
    nome varchar(50) not null,
    categoria enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    valor float not null,
    avaliacao float default 0
);

-- =========================
-- PEDIDO
-- =========================
create table pedido(
    id_pedido int auto_increment primary key,
    id_cliente int,
    data_pedido datetime default current_timestamp,
    status_pedido enum('Cancelado','Confirmado','Em processamento') 
        default 'Em processamento',
    valor_frete float default 10,
    constraint fk_pedido_cliente
        foreign key (id_cliente)
        references cliente(id_cliente)
);

-- =========================
-- ITENS DO PEDIDO
-- =========================
create table item_pedido(
    id_pedido int,
    id_produto int,
    quantidade int default 1,
    valor_unitario float not null,
    primary key (id_pedido, id_produto),
    constraint fk_item_pedido_pedido
        foreign key (id_pedido)
        references pedido(id_pedido),
    constraint fk_item_pedido_produto
        foreign key (id_produto)
        references produto(id_produto)
);

-- =========================
-- PAGAMENTO
-- =========================
create table pagamento(
    id_pagamento int auto_increment primary key,
    id_cliente int,
    tipo_pagamento enum('Boleto','Cartão','Pix','Dois cartões') not null,
    detalhes varchar(100),
    constraint fk_pagamento_cliente
        foreign key (id_cliente)
        references cliente(id_cliente)
        on delete cascade
);

-- =========================
-- ENTREGA
-- =========================
create table entrega(
    id_entrega int auto_increment primary key,
    id_pedido int unique,
    status_entrega enum('Aguardando envio','Em transporte','Entregue','Extraviado')
        default 'Aguardando envio',
    codigo_rastreio varchar(50),
    constraint fk_entrega_pedido
        foreign key (id_pedido)
        references pedido(id_pedido)
        on delete cascade
);