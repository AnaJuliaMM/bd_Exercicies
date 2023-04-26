-- **************************************
-- COMANDO DDL: data definition language
-- **************************************

-- Criando Tabela
CREATE TABLE teste(
	idAluno int primary key,
	nome varchar (30),
	idade int
);

-- Alterando a tabela
ALTER TABLE teste
ADD cpf varchar(14),
ADD curso varchar(50);

-- Apagando a table
DROP TABLE teste;



-- ****************************************
-- COMANDO DML: data manipulation language
-- ****************************************

-- Insert: inserindo dados
INSERT INTO teste VALUES(1, 'Ana Julia', 18, '111.111.111-11', 'ADS');

INSERT INTO teste(idade, nome, curso, idaluno) VALUES (21, 'Misael', 'ADS', 2);

INSERT INTO teste(idaluno, nome, cpf, idade, curso) VALUES (3, 'Gustavo', '333.333.333-33', 20, 'ADS');

INSERT INTO teste (idaluno, nome, idade, curso) VALUES 
(4, 'Thiago', 21, 'ADS'), 
(5, 'Leticia', 18, 'ADS'),
(6, 'Vinicius', 25, 'ADS'),
(7, 'Rafael', 39, 'ADS');


-- Update: atualizando colunas
UPDATE teste SET cpf = '777.777.777-77' 
WHERE idaluno>4;


-- Query/Select: buscando os dados
SELECT idaluno FROM teste;
SELECT nome FROM teste;
SELECT * FROM teste;