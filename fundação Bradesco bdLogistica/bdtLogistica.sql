-- Criação da tabela Cliente
CREATE TABLE client(
	client_code char(10) PRIMARY KEY,
	company_name varchar(70) NOT NULL,
	contact_name varchar(70) NOT NULL,
	contact_position varchar(40) NOT NULL,
	adress varchar(50),
	city varchar(25),
	region varchar(25),
	cep char(15),
	country varchar(25),
	phone_number char(20),
	fax char(20)
);

ALTER TABLE client RENAME COLUMN adress to address;

-- Creation of table TransportCompany
CREATE TABLE transport_company(
	transport_company_code int PRIMARY KEY,
	transport_company_name varchar(30) NOT NULL,
	phone_number char(20)
);

ALTER TABLE transport_company RENAME COLUMN transport_company_name TO company_name; 
ALTER TABLE transport_company RENAME COLUMN transport_company_code TO company_code; 

-- table Category's creation
CREATE TABLE category(
	category_code int PRIMARY KEY,
	category_name varchar(30) NOT NULL,
	description varchar(100)
);

-- table requestDetails's creation
CREATE TABLE request_details(
	request_number int ,
	request_code int,
	unitary_price money,
	quantity int,
	discount float,
	CONSTRAINT request_pk PRIMARY KEY (request_number, request_code)
);

-- table Suppliers's creation
CREATE TABLE suppliers(
	suppliers_code int,
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

ALTER TABLE suppliers ADD PRIMARY KEY(suppliers_code);
ALTER TABLE suppliers RENAME COLUMN suppliers_code TO supplier_code;

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

-- table Requests's creation
CREATE TABLE requests(
	request_number int PRIMARY KEY ,
	client_code char(10) NOT NULL,
	employee_code int NOT NULL,
	date_of_request date,
	date_of_delivery date,
	date_of_dispatch date,
	transpost_company_code int NOT NULL,
	freight money,
	addressee_name varchar(50),
	addressee_address varchar(50),
	destination_cep char(15),
	destination_country varchar(25),
	destination_city varchar(25),
	destination_region varchar(25)
);

-- table Products's creation
CREATE TABLE products(
	product_code int PRIMARY KEY,
	product_name varchar(50) NOT NULL,
	supplier_code int NOT NULL,
	category_code int NOT NULL, 
	unit_amount char(30),
	unitary_price money,
	stock_amount int,
	amount_request int,
	replacement_level int,
	discontinued int
);

