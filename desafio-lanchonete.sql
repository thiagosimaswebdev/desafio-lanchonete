-- LIMPEZA (evita erros)

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;


CREATE TABLE clientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(20),
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	preco NUMERIC(10,2) NOT NULL,
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE pedidos (
	id SERIAL PRIMARY KEY,
	cliente_id INT NOT NULL,
	status VARCHAR(50) DEFAULT 'pendente',
	criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT fk_cliente
	FOREIGN KEY (cliente_id)
	REFERENCES clientes(id)
	ON DELETE CASCADE
);


CREATE TABLE itens_pedido (
	id SERIAL PRIMARY KEY,
	pedido_id INT NOT NULL,
	produto_id INT NOT NULL,
	quantidade INT NOT NULL,
	preco_unitario NUMERIC(10,2) NOT NULL,

	CONSTRAINT fk_pedido
	FOREIGN KEY (pedido_id)
	REFERENCES pedidos(id)
	ON DELETE CASCADE,

	CONSTRAINT fk_produto
	FOREIGN KEY (produto_id)
	REFERENCES produtos(id)
	ON DELETE CASCADE
);


-- Clientes
INSERT INTO clientes (nome, telefone) VALUES
('Thiago', '21999999999'),
('Maria', '21988888888');

-- Produtos
INSERT INTO produtos (nome, preco) VALUES
('Hamburguer', 15.00),
('Batata Frita', 10.00),
('Refrigerante', 6.00);

-- Pedido
INSERT INTO pedidos (cliente_id, status) VALUES
(1, 'pendente');

-- Itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES
(1, 1, 2, 15.00),
(1, 2, 1, 10.00),
(1, 3, 2, 6.00);


-- Pedidos com cliente
SELECT 
	p.id,
	c.nome AS cliente,
	p.status,
	p.criado_em
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;

-- Itens de um pedido
SELECT 
	p.id AS pedido,
	pr.nome AS produto,
	ip.quantidade,
	ip.preco_unitario
FROM itens_pedido ip
JOIN pedidos p ON ip.pedido_id = p.id
JOIN produtos pr ON ip.produto_id = pr.id
WHERE p.id = 1;

-- Total do pedido
SELECT 
	p.id,
	SUM(ip.quantidade * ip.preco_unitario) AS total
FROM pedidos p
JOIN itens_pedido ip ON ip.pedido_id = p.id
GROUP BY p.id; 