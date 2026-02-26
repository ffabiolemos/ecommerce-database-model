-- Quantos pedidos foram feitos por cada cliente?
select 
    c.id_cliente,
    count(p.id_pedido) as total_pedidos
from cliente c
left join pedido p 
    on c.id_cliente = p.id_cliente
group by c.id_cliente
order by total_pedidos desc;

-- Clientes que fizeram mais de 1 pedido
select 
    id_cliente,
    count(*) as total_pedidos
from pedido
group by id_cliente
having count(*) > 1;

-- Valor total gasto por cada cliente
select 
    c.id_cliente,
    sum(ip.quantidade * ip.valor_unitario) as total_gasto
from cliente c
join pedido pe 
    on c.id_cliente = pe.id_cliente
join item_pedido ip 
    on pe.id_pedido = ip.id_pedido
group by c.id_cliente
order by total_gasto desc;

-- Produto mais vendido (em quantidade)
select 
    p.nome,
    sum(ip.quantidade) as total_vendido
from produto p
join item_pedido ip 
    on p.id_produto = ip.id_produto
group by p.nome
order by total_vendido desc
limit 1;

-- Produtos que venderam mais de 3 unidades (HAVING)
select 
    p.nome,
    sum(ip.quantidade) as total_vendido
from produto p
join item_pedido ip 
    on p.id_produto = ip.id_produto
group by p.nome
having sum(ip.quantidade) > 3
order by total_vendido desc;

-- Clientes que nunca fizeram pedido (LEFT JOIN + WHERE)
select c.id_cliente
from cliente c
left join pedido p 
    on c.id_cliente = p.id_cliente
where p.id_pedido is null;

-- Pedido com maior valor total (SUBQUERY)
select id_pedido, total
from (
    select 
        id_pedido,
        sum(quantidade * valor_unitario) as total
    from item_pedido
    group by id_pedido
) as totais
where total = (
    select max(total_geral)
    from (
        select sum(quantidade * valor_unitario) as total_geral
        from item_pedido
        group by id_pedido
    ) as sub
);

-- Média de valor dos produtos por categoria
select 
    categoria,
    avg(valor) as media_preco
from produto
group by categoria
order by media_preco desc;

-- Clientes PF que já fizeram pedido (JOIN)
select distinct pf.nome
from cliente_pf pf
join pedido p 
    on pf.id_cliente = p.id_cliente;
    
-- Quantidade de pedidos por tipo de cliente (PF vs PJ)
select 
    c.tipo_cliente,
    count(p.id_pedido) as total_pedidos
from cliente c
join pedido p 
    on c.id_cliente = p.id_cliente
group by c.tipo_cliente;

-- Pedidos com status "Em transporte"
select 
    pe.id_pedido,
    e.status_entrega
from pedido pe
join entrega e 
    on pe.id_pedido = e.id_pedido
where e.status_entrega = 'Em transporte';

-- Clientes que possuem mais de uma forma de pagamento
select 
    id_cliente,
    count(*) as total_pagamentos
from pagamento
group by id_cliente
having count(*) > 1;