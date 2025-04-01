CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    ativo BOOLEAN DEFAULT TRUE
);

INSERT INTO clientes (nome, email, telefone, data_cadastro, ativo) VALUES
    ('Wellinton', 'wellinton@email.com', '(11) 9999-8888', '2023-01-15', TRUE),
    ('Rubens', 'rubens@email.com', '(21) 9876-5432', '2023-02-20', TRUE),
    ('Ana', 'ana@email.com', '(31) 91234-5678', '2023-03-10', FALSE),
    ('Ryan', 'ryan@email.com', '(41) 99876-5432', '2023-04-05', TRUE),
    ('Clara', 'clara@email.com', '(51) 98765-4321', '2023-05-12', TRUE);

SELECT * FROM clientes;