-- Criação da tabela Cliente
CREATE TABLE client(
	client_code char(10) PRIMARY KEY,
	company_name varchar(70) NOT NULL,
	contact_name varchar(70) NOT NULL,
	contact_position varchar(40) NOT NULL,
	address varchar(50),
	city varchar(25),
	region varchar(25),
	cep char(15),
	country varchar(25),
	phone_number char(20),
	fax char(20)
);

-- Visualizar a tabela
SELECT * FROM client;

-- Inserindo linhas de dados
INSERT INTO client(client_code,company_name, contact_name, contact_position, city, country)
VALUES  ('DEPLE', 'Deep Purple', 'Ian Gillan','Representante Comercial', 'Osasco', 'Brasil');

INSERT INTO client(client_code,company_name, contact_name, contact_position, city, country) VALUES  
('ACDC', 'ACDC', 'Angus McKinnon Young','Proprietario', 'São Paulo', 'Brasil'),
('KING', 'Queen', 'Freddie Mercury','Proprietario', 'Londres', 'Reino Unido');

-- Buscando linhas que cumpram a condição
SELECT * FROM client WHERE country='Brasil';

-- Alterando compo da linha da tabela
UPDATE client SET client_code = 'KING' WHERE client_code = 'QUEENB';

-- Deletando registro inserido
INSERT INTO client (
	client_code
	, company_name
	, contact_name
	, contact_position
	, address
	, city
	, region
	, cep
	, country
	, phone_number
	, fax 
) VALUES (
	'WTSNK'
	, 'United Artists Records'
	, 'David Coverdale'
	, 'Gerente de Marketing'
	, 'Gerente de Marketing'
	, 'Londres'
	, 'Westlake Clark '
	, 'OH 45344'
	, 'Reino Unido'
	, '+44 843 538 0298'
	, '+44 121 240 5844' );

UPDATE client SET country= 'Alemanha' WHERE cLIENT_code = 'WTSNK';
DELETE FROM client WHERE client_code = 'WTSNK';

-- Utilizando WHERE IN
SELECT
company_name
, contact_name
, address
, country
FROM  client
WHERE country IN('Brasil', 'Reino Unido');

-- Utilizando WHERE NOT
SELECT
company_name
, contact_name
, address
, country
FROM  client
WHERE country  NOT IN ('Brasil', 'Reino Unido');

-- Utilizando WHERE LIKE
SELECT company_name, contact_name, address, country
FROM  client WHERE client_code  LIKE '%Ac%';

------------------------------------------------------------------------------------------------------------

-- Creation of table TransportCompany
CREATE TABLE transport_company(
	company_code int PRIMARY KEY,
	company_name varchar(30) NOT NULL,
	phone_number char(20)
);

-- Visualizar tabela
SELECT * FROM transport_company;

-- Inserindo valor 
INSERT INTO transport_company VALUES (1, 'Modern', '15 3249 7777');

INSERT INTO transport_company VALUES (2, 'Modern', '15 3249 7777');

INSERT INTO transport_company VALUES 
(4, 'HIGHseed'),
(5, 'juLIX'),
(6, 'noDELAY');

INSERT INTO transport_company VALUES (3, 'TRANSnacional', '90 0996 4432');




------------------------------------------------------------------------------------------------------------

-- table Category's creation
CREATE TABLE category(
	category_code int PRIMARY KEY,
	category_name varchar(30) NOT NULL,
	description varchar(100)
);

-- Visualizando a tabela
SELECT * FROM category;

-- Inserindo linhas
INSERT INTO category (category_code, category_name, description) 
VALUES 
(1, 'Electronics', 'Products that use electronic components and circuits'),
(2, 'Furniture', 'Household and office furniture'),
(3, 'Apparel', 'Clothing, footwear, and accessories'),
(4, 'Grocery', 'Food and household essentials');


------------------------------------------------------------------------------------------------------------

-- table requestDetails's creation
CREATE TABLE request_details(
	request_number int REFERENCES requests (request_number) ,
	product_code int REFERENCES products(product_code),
	unitary_price money,
	quantity int,
	discount float,
	CONSTRAINT request_pk PRIMARY KEY (request_number, product_code)
);

SELECT * FROM request_details;

-- Inserindo dados na tabela
INSERT INTO request_details VALUES (1, 1, 10.99, 50, 0.3);

insert into request_details VALUES 
(2,2, 29.88, 100, 0.10),
(3, 3, 60.89, 200, 00);

-- Exibindo com WHERE BETWEEN
SELECT * FROM request_details WHERE quantity>50 AND quantity<=100;

------------------------------------------------------------------------------------------------------------

-- table Suppliers's creation
CREATE TABLE suppliers(
	supplier_code int PRIMARY KEY,
	company_name varchar(70) NOT NULL,
	contact_name varchar(70) NOT NULL,
	contect_position varchar(40),
	address varchar(50),
	city varchar(25),
	region varchar(25),
	cep char(15),
	country varchar(25),
	phone_number char(20),
	fax char(20)
);

ALTER TABLE suppliers RENAME COLUMN contect_position TO contact_position;

-- Visualizando
SELECT * FROM suppliers;

-- Inserindo valores
INSERT INTO suppliers (supplier_code, company_name, contact_name, contact_position, address, city, region, cep, country, phone_number, fax) 
VALUES 
(1, 'ABC Company', 'John Doe', 'Sales Manager', '123 Main St', 'Anytown', 'CA', '12345', 'USA', '555-1234', '555-4321'),
(2, 'XYZ Corporation', 'Jane Smith', 'Marketing Director', '456 Market St', 'Otherville', 'NY', '67890', 'USA', '555-5678', '555-8765'),
(3, 'Acme Industries', 'Bob Johnson', 'Operations Manager', '789 Broadway', 'Smalltown', 'TX', '23456', 'USA', '555-2468', '555-8642'),
(4, 'Global Enterprises', 'Samantha Lee', 'CEO', '101 Park Ave', 'Bigcity', 'CA', '56789', 'USA', '555-1357', '555-7531');


------------------------------------------------------------------------------------------------------------

-- table Employees's creation
CREATE TABLE employees(
	employee_code int primary key,
	last_name varchar(30),
	employee_name varchar(30) NOT NULL,
	employee_position varchar(40),
	employee_treatment char(10),
	date_of_birth date,
	contract_date date,
	address varchar(50),
	city varchar(25),
	region varchar(25),
	cep char(15),
	country varchar(25),
	phone_number char(20),
	home_phone char(20),
	telephone_extension char(5),
	observation varchar(200)	
);

-- Visualizar tabela 
SELECT * FROM employees;

-- Preenchendo a tabela
INSERT INTO employees (employee_code, last_name, employee_name, employee_position, employee_treatment, date_of_birth, contract_date, address, city, country, phone_number, home_phone, observation) VALUES
    (001, 'Silva', 'João', 'Analista de Sistemas', 'Sr.', '1980-06-10', '2020-01-01', 'Rua A, 123', 'São Paulo', 'Brasil', '+55 11 1234-5678', '+55 11 9876-5432', 'Observação 1'),
    (002, 'Santos', 'Maria', 'Gerente de Projetos', 'Sra.', '1985-08-20', '2018-06-15', 'Rua B, 456', 'Rio de Janeiro', 'Brasil', '+55 21 2345-6789', '+55 21 8765-4321', 'Observação 2'),
    (003, 'Oliveira', 'Pedro', 'Desenvolvedor Full-stack', 'Jr.', '1992-12-05', '2021-03-01', 'Rua C, 789', 'Belo Horizonte', 'Brasil', '+55 31 3456-7890', '+55 31 0987-6543', 'Observação 3'),
    (004, 'Costa', 'Ana', 'Analista de Negócios', 'Pl.', '1987-03-15', '2017-09-10', 'Rua D, 1234', 'Porto Alegre', 'Brasil', '+55 51 2345-6789', '+55 51 8765-4321', 'Observação 4'),
    (005, 'Ferreira', 'Rafael', 'Desenvolvedor Front-end', 'Jr.', '1995-05-25', '2022-02-15', 'Rua E, 5678', 'Curitiba', 'Brasil', '+55 41 3456-7890', '+55 41 0987-6543', 'Observação 5'),
    (006, 'Mendes', 'Carla', 'Gerente de Recursos Humanos', 'Pl.', '1983-11-30', '2019-05-20', 'Rua F, 9012', 'Fortaleza', 'Brasil', '+55 85 2345-6789', '+55 85 8765-4321', 'Observação 6');

------------------------------------------------------------------------------------------------------------

-- table Requests's creation
CREATE TABLE requests(
	request_number int PRIMARY KEY  ,
	client_code char(10) REFERENCES client,
	employee_code int REFERENCES employees(employee_code),
	date_of_request date,
	date_of_delivery date,
	date_of_dispatch date,
	transpost_company_code int REFERENCES transport_company(company_code),
	freight money,
	addressee_name varchar(50),
	addressee_address varchar(50),
	destination_cep char(15),
	destination_country varchar(25),
	destination_city varchar(25),
	destination_region varchar(25)
);

ALTER TABLE requests RENAME COLUMN transpost_company_code TO transport_company_code;
 
-- Visualizando a tabela
SELECT * FROM requests;

-- Inserindo tabela
INSERT INTO requests (request_number, client_code, employee_code, date_of_request, date_of_delivery, date_of_dispatch, transport_company_code, freight, addressee_name, addressee_address, destination_cep, destination_country, destination_city, destination_region) VALUES
(1, 'DEPLE', 001, '2022-01-10', '2022-01-15', '2022-01-12', 1, 150.00, 'João da Silva', 'Rua A, 123', '01234-567', 'Brasil', 'São Paulo', 'SP');
	
INSERT INTO requests 
(request_number, client_code, employee_code, date_of_request, date_of_delivery, date_of_dispatch, transport_company_code, freight, addressee_name, addressee_address, destination_cep, destination_country, destination_city, destination_region) 
VALUES
(2, 'ACDC', 002, '2022-02-05', '2022-02-10', '2022-02-07', 2, 200.00, 'Maria dos Santos', 'Rua B, 456', '04567-890', 'Brasil', 'Rio de Janeiro', 'RJ'),
(3, 'KING', 003, '2022-03-01', '2022-03-05', '2022-03-03', 3, 250.00, 'Pedro Oliveira', 'Rua C, 789', '02345-678', 'Brasil', 'Belo Horizonte', 'MG');

------------------------------------------------------------------------------------------------------------

-- table Products's creation
CREATE TABLE products(
	product_code int PRIMARY KEY,
	product_name varchar(50) NOT NULL,
	supplier_code int REFERENCES suppliers(supplier_code),
	category_code int REFERENCES category(category_code), 
	unit_amount char(30),
	unitary_price money,
	stock_amount int,
	amount_request int,
	replacement_level int,
	discontinued boolean
);

SELECT * FROM products;

ALTER TABLE products RENAME COLUMN unit_amount TO unitary_amount;
ALTER TABLE products DROP COLUMN discontinued;
ALTER TABLE products DROP COLUMN unitary_amount;
ALTER TABLE products ADD COLUMN discontinued boolean;


-- Inserindo valor na tabela produto
INSERT INTO products (product_code,product_name, supplier_code, category_code, unitary_price, stock_amount, amount_request, replacement_level, discontinued)
VALUES 
(1, ' TAB S7', 1, 1, 99.99, 50, 10, 20, false);

INSERT INTO products VALUES
(2, 'wood vintage chair', 2, 2,  199.99, 20, 5, 10, false),
(3, 'gold earings', 3, 2, 49.99, 100, 25, 50, false),
(4, 'cookie', 4, 2, 9.99, 200, 50, 100, true);



------------------------------------------------------------------------------------------------------------


