CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
INSERT INTO pedidos (cliente_id, valor_total, status) VALUES
    (1, 250.00, 'Entregue'),     -- Wellinton (ativo)
    (3, 150.00, 'Pendente'),     -- Ana (inativo)
    (2, 350.00, 'Processando'),  -- Rubens (ativo)
    (3, 180.00, 'Cancelado'),    -- Ana (inativo)
    (4, 420.00, 'Entregue'),     -- Ryan (ativo)
    (5, 210.00, 'Processando');  -- Clara (ativo)
	
SELECT * FROM clientes;

DELETE FROM pedidos
WHERE cliente_id IN (
    SELECT id FROM clientes WHERE ativo = FALSE
);

SELECT p.id, c.nome AS cliente, p.valor_total, p.status, p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
ORDER BY p.data_pedido;



	