-- % AULA 1
---------------------------------------- Departamento -----------------------------------------------------
CREATE TABLE departamento(
	idDepartamento int  primary key,
	siglaDepartamento varchar(3) NOT NULL,
	nomeDepartamento varchar(30) NOT NULL
);

-- Renomeia a coluna
ALTER TABLE departamento RENAME COLUMN idDepartamento to id_Departamento;
ALTER TABLE departamento RENAME COLUMN siglaDepartamento to sigla_Departamento;
ALTER TABLE departamento RENAME COLUMN nomeDepartamento to nome_Departamento;

-- Mudar tipo 
ALTER TABLE departamento ALTER COLUMN nome_departamento TYPE varchar(50);

-- Visualiza
SELECT * FROM departamento;


------------------------------------------ Curso -----------------------------------------------------------
CREATE TABLE curso(
	id_curso int primary key,
	idDepartamento int REFERENCES departamento,
	sigla_curso varchar(3) NOT NULL,
	nome_curso varchar(30) NOT NULL
);

ALTER TABLE curso RENAME idDepartamento TO id_Departamento;
ALTER TABLE curso ALTER COLUMN nome_curso TYPE varchar(50);

-- Visualiza
SELECT * FROM curso;

------------------------------------- Disciplina -----------------------------------------------------------
CREATE TABLE disciplina(
	id_disciplina int primary key,
	id_curso int REFERENCES curso,
	sigla_disciplina varchar(4) NOT NULL,
	nome_disciplina varchar(50),
	optativa BOOLEAN DEFAULT False
);

-- Visualiza
SELECT * FROM disciplina; 

 
------------------------------------------- Aluno ---------------------------------------------------------
CREATE TABLE aluno(
	ra int primary key,
	cpf varchar(14) NOT NULL UNIQUE,
	nome_aluno varchar(100) NOT NULL,
	data_nascimento date NOT NULL CHECK( age(CURRENT_date, data_nascimento)>= '14 years'),
	status boolean DEFAULT true	
);

-- Visualiza
SELECT * FROM aluno; 

-------------------------------------- disciplinaAluno ----------------------------------------------------
CREATE TABLE disciplinaAluno(
	id_disciplina_aluno int primary key,
	id_disciplina int REFERENCES disciplina,
	ra int REFERENCES aluno,
	data_matricula date NOT NULL
);

-- Visualiza
SELECT * FROM disciplinaAluno; 


--------------------------------------------------------------------------------------------------------------

-- % AULA 2

-- 1. Alterando o tamanho do tipo da variável varchar da coluna "nome_departamento" da tabela departamento
ALTER TABLE departamento ALTER COLUMN nome_departamento TYPE varchar(50);
SELECT nome_departamento FROM departamento; -- Checkando

-- 2. Completando tabela departamento 
INSERT INTO departamento VALUES (1, 'CST', 'Curso Superior em Tecnologia');
INSERT INTO departamento VALUES (2, 'CT', 'Curso Técnico');
INSERT INTO departamento VALUES 
(3, 'CAI', 'Curso de Aprendizagem Industrial'), 
(4, 'FIC', 'Formação Inicial Continuada');


--------------------------------------------- SELECT ------------------------------------------------------

-- Exibindo tabela departamento sem restrições
SELECT * FROM departamento;

-- Visualizando a partir do 'id_departamento' CRESCENTE
SELECT * FROM departamento ORDER BY id_departamento;

-- Visualizando a partir do 'id_departamento' DESCRESCENTE
SELECT * FROM departamento ORDER BY id_departamento DESC;

-- Visualizando a partir do 'id_departamento' ALFABÉTICA
SELECT * FROM departamento ORDER BY sigla_departamento;

-- Visualizando a partir do 'id_departamento' ALFABÉTICA INVERSO
SELECT * FROM departamento ORDER BY sigla_departamento DESC;

-- Fazer contagem de TODAS as tuplas
SELECT COUNT(*) FROM departamento;

-- Fazer contagem de NÃO CONTANDO as tuplas com alguma coluna 'NULL'
SELECT COUNT('any') FROM departamento;

------------------------------------------------------------------------------------------------------------

-- Inserindo dados nas entidades(tabela)
INSERT INTO curso VALUES
(1, 1, 'ADS', 'Técnologo em Análise e Desenvolvimento de Sistemas');

INSERT INTO curso VALUES
(2, 1, 'MEC', 'Técnologo em Mecatrônica'),
(3, 2, 'DEV', 'Técnico em Desenvolvimento de Sistemas'),
(4, 2, 'MEC', 'Técnico em Mecatrônica'),
(5, 3, 'EME', 'Eletricista de Manutenção Eletroeletrônia'),
(6, 3, 'MUS', 'Mecânico em Usinagem'),
(7, 3, 'ADM', 'Administração'),
(8, 4, 'CLP', 'Controladores Lógicos Programáveis'),
(9, 4, 'EXC', 'Excel'),
(10, 4, 'PBI', 'Power BI'),
(11, 4, 'ROB', 'Robótica Industrial'),
(12, 4, 'EIN', 'Eletricista Instalador'),
(13, 4, 'HDR' , 'Hidráulica'),
(14, 4, 'PNE', 'Pneumática'),
(15, 4, 'FER', 'Ferramenteiro');

---------------------------------------------------------------------------------------------------------------
-- Visualizando a toda tabela 
SELECT * FROM curso;

-- Visualizando só a sigla e o nome
SELECT sigla_curso, nome_curso FROM curso;

-- Quantidade de linhas 
SELECT COUNT(*) FROM curso;

--- Mostrar tabela departamento e curso TUDO junto
SELECT * FROM curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento ;

--- Mostrar sigla_depart, id_departa e nome_curso 
SELECT departamento.sigla_departamento, departamento.id_departamento, curso.nome_curso 
FROM curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento ;

--- Mostrar sigla_depart, id_departa e id_curso 
SELECT departamento.sigla_departamento, curso.nome_curso, curso.id_curso 
FROM curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento ;

-- Qual departamento cada curso pertence?
SELECT departamento.sigla_departamento, curso.nome_curso 
FROM curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento ;
-- Variação 1
SELECT departamento.sigla_departamento, curso.nome_curso 
FROM curso INNER JOIN departamento 
USING (id_departamento) ;
-- Variação 2
SELECT sigla_departamento, nome_curso 
FROM curso NATURAL INNER JOIN departamento; 

-- Left Join
SELECT sigla_departamento, nome_curso FROM curso LEFT JOIN departamento USING (id_departamento);
-- Full join
SELECT * FROM curso FULL JOIN departamento USING (id_departamento);


-- Quantos cursos cada departamento possui?
SELECT departamento.id_departamento, count(nome_curso) FROM curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento GROUP BY departamento.id_departamento;



-- Quantos cursos cada departamento possui? Ordenar por id (usando group by)
SELECT curso.id_departamento, count(curso.nome_curso) 
FROM curso GROUP BY id_departamento ORDER BY id_departamento;

SELECT curso.id_departamento FROM curso;
SELECT id_departamento FROM curso  GROUP BY id_departamento; -- Mostra os repetidos apenas uma vez
SELECT id_departamento, nome_curso  FROM curso ; 
SELECT id_departamento, COUNT (id_departamento) FROM curso GROUP BY id_departamento ORDER BY id_departamento;


-- Quantos cursos cada departamento possui? Ordenar por sigla 
SELECT departamento.sigla_departamento, count(nome_curso) FROM (curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento) AS sub GROUP BY sub.sigla_departamento ORDER BY sigla_departamento;

SELECT sigla_departamento, count(sigla_departamento) FROM (curso INNER JOIN departamento 
ON departamento.id_departamento = curso.id_departamento) AS sub GROUP BY sub.sigla_departamento ORDER BY sigla_departamento;
