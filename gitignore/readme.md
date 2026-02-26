# 🛒 E-commerce Database Design (MySQL)

Projeto de modelagem e implementação de banco de dados relacional para um sistema de e-commerce, desenvolvido utilizando MySQL.  
Este projeto demonstra boas práticas de modelagem, integridade referencial e consultas SQL avançadas.

---

## 📌 Objetivo do Projeto

O objetivo é construir um banco de dados estruturado para um sistema de e-commerce contendo:

- Clientes Pessoa Física (PF) e Pessoa Jurídica (PJ)  
- Múltiplas formas de pagamento por cliente  
- Pedidos com múltiplos produtos  
- Controle de entrega com status e código de rastreio  
- Consultas SQL utilizando JOIN, GROUP BY, HAVING, SUBQUERY, ORDER BY e WHERE  

---

## 🏗️ Modelagem do Banco

O modelo foi estruturado respeitando:

- 3ª Forma Normal (3FN)  
- Integridade referencial com FOREIGN KEYS  
- Especialização de clientes (PF / PJ)  
- Relacionamentos 1:N e 1:1  
- Tabelas associativas para itens do pedido  


---

## 🧱 Estrutura das Tabelas

### Cliente
- `cliente`
- `cliente_pf`
- `cliente_pj`

### Operacional
- `produto`
- `pedido`
- `item_pedido`

### Pagamentos
- `pagamento`

### Entrega
- `entrega`

---

## 🔗 Relacionamentos

- Um cliente pode ser **PF ou PJ (não ambos)**  
- Um cliente pode ter **vários pagamentos**  
- Um cliente pode realizar **vários pedidos**  
- Um pedido pode conter **vários produtos**  
- Um pedido possui **uma única entrega**  
- Cada entrega possui **status e código de rastreio**  

---

## 🛠 Tecnologias Utilizadas

- MySQL  
- VSCode  
- Git & GitHub  

---

## 📊 Exemplos de Consultas Implementadas

- Quantidade de pedidos por cliente  
- Valor total gasto por cliente  
- Produtos mais vendidos  
- Clientes com múltiplas formas de pagamento  
- Pedidos com maior valor  
- Média de preço por categoria  
- Clientes sem pedidos  
- Análise por tipo de cliente (PF vs PJ)  

Utilizando: `JOIN`, `LEFT JOIN`, `GROUP BY`, `HAVING`, `ORDER BY`, `SUBQUERY`, funções agregadas (`SUM`, `COUNT`, `AVG`).

---

## 👤 Autor
Fábio Lemos - 
Estudante de Análise de Dados | Tecnologia | SQL

🔗 GitHub: https://github.com/ffabiolemos

🔗 LinkedIn: https://www.linkedin.com/in/ffabiolemos
