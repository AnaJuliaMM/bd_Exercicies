-- Criação da entidade Cliente
CREATE TABLE cliente(
	id_cliente SERIAL PRIMARY KEY, 
	nome_cliente varchar(70) NOT NULL,
	rg_cliente varchar(12) NOT NULL UNIQUE,
	cpf_cliente varchar(14) NOT NULL UNIQUE,
	endereco_cliente text NOT NULL,
	telefone_cliente varchar(11) NOT NULL
);

ALTER TABLE cliente ALTER COLUMN rg_cliente TYPE varchar(13);
ALTER TABLE cliente ALTER COLUMN telefone_cliente TYPE varchar(13);


-- Visualizando tabela 
SELECT * FROM  cliente;

-- Inserindo valores
INSERT INTO cliente (nome_cliente, rg_cliente,cpf_cliente, endereco_cliente, telefone_cliente) VALUES 
('Beatriz', '11.111.111-11', '111.111.111-11', 'aaa', '11 11111 1111');

INSERT INTO cliente (nome_cliente, rg_cliente,cpf_cliente, endereco_cliente, telefone_cliente) VALUES 
('Augusto', '22.222.222-22', '222.222.222-22', 'bbb', '22 22222 2222'),
('Conceição', '33.333.333-33', '333.333.333-33', 'ccc', '33 33333 3333'),
('Sergio', '44.444.444-44', '444.444.444-44', 'ddd', '44 44444 4444');

