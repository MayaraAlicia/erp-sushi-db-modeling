-- 1. Listar todos os clientes
SELECT * FROM clientes;

-- 2. Listar todos os produtos ativos
SELECT * 
FROM produtos 
WHERE ativo = 1;

-- 3. Exibir funcionários cadastrados
SELECT nome, cargo,
telefone FROM funcionarios;

-- 4. Buscar pedidos do dia atual
SELECT * 
FROM pedidos 
WHERE DATE(data_pedido) = CURDATE();

-- 5. Produtos com estoque baixo
SELECT nome, quantidade_estoque 
FROM produtos 
WHERE quantidade_estoque < 10;

-- 6. Clientes que já realizaram pedidos
SELECT DISTINCT c.nome 
FROM clientes c 
JOIN pedidos p ON p.cliente_id = c.cliente_id;

-- 7. Itens de um pedido específico
SELECT i.*, p.nome AS produto 
FROM itens_pedidos i JOIN produtos p ON p.produto_id = i.produto_id 
WHERE pedido_id = 15;

-- 8. Pedidos que ainda estão em andamento
SELECT pedido_id, cliente_id, status 
FROM pedidos 
WHERE status IN ('Em preparo', 'Saiu para entrega');

-- 9. Total de pedidos por cliente
SELECT c.nome, COUNT(*) AS total_pedidos
 FROM pedidos p
 JOIN clientes c ON c.cliente_id = p.cliente_id 
GROUP BY c.nome;

-- 10. Produtos mais caros
SELECT nome, preco 
FROM produtos 
ORDER BY preco 
DESC LIMIT 5;

-- 11. Somar o valor de um pedido usando seus itens
SELECT SUM(subtotal) AS total 
FROM itens_pedidos 
WHERE pedido_id = 10;

-- 12. Total de vendas no mês atual
	SELECT SUM(valor_total) AS total_mes 
FROM pedidos WHERE MONTH(data_pedido) = MONTH(CURDATE()) 
AND YEAR(data_pedido) = YEAR(CURDATE());

-- 13. Fornecedores com quantidade de produtos cadastrados
SELECT f.nome, COUNT(p.produto_id) AS produtos 
FROM fornecedores f 
LEFT JOIN produtos p ON p.fornecedor_id = f.fornecedor_id 
GROUP BY f.nome;

-- 14. Pedidos sem pagamento
SELECT p.pedido_id, p.valor_total 
FROM pedidos p 
LEFT JOIN pagamentos pg ON pg.pedido_id = p.pedido_id 
WHERE pg.pedido_id IS NULL;

-- 15. Total vendido por funcionário
SELECT f.nome, SUM(p.valor_total) AS total_vendido 
FROM pedidos p 
JOIN funcionarios f ON f.funcionario_id = p.funcionario_id 
GROUP BY f.nome 
ORDER BY total_vendido DESC;
