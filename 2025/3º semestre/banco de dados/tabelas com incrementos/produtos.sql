CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0
);
SELECT * FROM produtos ORDER BY categoria;
INSERT INTO produtos (nome, categoria, preco, estoque) VALUES
    ('Smartphone X', 'Eletrônicos', 2500.00, 15),
    ('Camiseta Branca', 'Vestuário', 59.90, 30),
    ('Notebook Pro', 'Eletrônicos', 4500.00, 8),
    ('Mesa de Escritório', 'Móveis', 799.90, 12),
    ('Fone Bluetooth', 'Eletrônicos', 199.90, 25);



UPDATE produtos
SET preco = preco * 1.10
WHERE categoria = 'Eletrônicos';








	