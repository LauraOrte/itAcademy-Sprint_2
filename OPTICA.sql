CREATE DATABASE IF NOT EXISTS Optica;
USE Optica;
CREATE TABLE IF NOT EXISTS proveïdors (
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(60) NOT NULL, 
    adreça VARCHAR(200) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    ciutat VARCHAR(30) NOT NULL,
    código_postal INT NOT NULL,
    telèfon INT NOT NULL,
    fax INT NOT NULL,
    NIF INT NOT NULL,
    PRIMARY KEY (id)
    );
    
CREATE TABLE IF NOT EXISTS ulleres (
	id INT NOT NULL AUTO_INCREMENT,
    graduació_dreta FLOAT NOT NULL,
    graduació_esquerra FLOAT NOT NULL,
    tipus_montura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_montura VARCHAR(35) NOT NULL,
    color_vidres VARCHAR(35) NOT NULL,
    preu FLOAT NOT NULL,
	marca_id INT NOT NULL,
    proveïdor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (proveïdor_id) REFERENCES proveïdors(id)
    );    
    
 CREATE TABLE IF NOT EXISTS marca (
	id INT NOT NULL AUTO_INCREMENT,
    nom_marca VARCHAR(60) NOT NULL,
    proveïdor_marca_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (proveïdor_marca_id) REFERENCES proveïdors(id)
    );


CREATE TABLE IF NOT EXISTS clients (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,
	cognom VARCHAR(60) NOT NULL,
	código_postal INT(30) NOT NULL,
	email VARCHAR(60) NOT NULL,
	telèfon INT NOT NULL,
	data_registre DATE NOT NULL,
	client_recomendat INT,
	PRIMARY KEY (id),
	FOREIGN KEY(client_recomendat) REFERENCES clients(id)
);

CREATE TABLE IF NOT EXISTS empleats (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,	
	cognom VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS vendes (
	id INT NOT NULL AUTO_INCREMENT,
	data_venda DATE NOT NULL,
	ulleres_id INT NOT NULL,
	empleat_id INT NOT NULL,
	client_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (ulleres_id) REFERENCES ulleres(id),
	FOREIGN KEY (empleat_id) REFERENCES empleats(id),
	FOREIGN KEY (client_id) REFERENCES clients(id)
    );
    
    
 -- CLIENTS
INSERT INTO clients (nom, cognom, código_postal, email, telèfon, data_registre)
VALUES ('Antonio', 'Fernández', 09984, 'antonioF@gmail.com', 637271819, '2021/12/05');
INSERT INTO clients (nom, cognom, código_postal, email, telèfon, data_registre)
VALUES ('Anna', 'Ortega', 09334, 'annaOrte@gmail.com', 82719102, '2021/12/06');
INSERT INTO clients (nom, cognom, código_postal, email, telèfon, data_registre, client_recomendat)
VALUES ('Paca', 'Pérez', 09123, 'PacaPerez@gmail.com', 61459836, '2021/12/06', 2);

-- EMPLEATS
INSERT INTO empleats (nom, cognom)
VALUES ('Lídia', 'Solano');
INSERT INTO empleats (nom, cognom)
VALUES ('Marc', 'López');

-- PROVEÏDORS
INSERT INTO proveïdors (nom, adreça, pais, ciutat, código_postal, telèfon, fax, NIF)
VALUES ('ProveUno', 'Calle venezuela ático 2a', 'España', 'Barcelona', 07389, 12827374, 2992929, 129291918);
INSERT INTO proveïdors (nom, adreça, pais, ciutat, código_postal, telèfon, fax, NIF)
VALUES ('ProveDos', 'Calle abril 1a 2n', 'España', 'Barcelona', 06666, 12345567, 00099009, 012121223);

-- ULLERES
INSERT INTO ulleres (graduació_dreta, graduació_esquerra, tipus_montura, color_montura, color_vidres, preu, marca_id, proveïdor_id)
VALUES (3.25, 2.15, 'pasta', 'verd', 'blau', 150, 1, 2);
INSERT INTO ulleres (graduació_dreta, graduació_esquerra, tipus_montura, color_montura, color_vidres, preu, marca_id, proveïdor_id)
VALUES (4.50, 3.75, 'flotant', 'negra', 'negra', 100, 2, 1);

-- MARCAS
INSERT INTO marca (nom_marca, proveïdor_marca_id)
VALUES ('Ray-ban', 2);
INSERT INTO marca (nom_marca, proveïdor_marca_id)
VALUES ('Persol', 1);

-- VENDES
INSERT INTO vendes (data_venda, ulleres_id, empleat_id, client_id)
VALUES ('2021/12/28', 1, 1, 1);
INSERT INTO vendes (data_venda, ulleres_id, empleat_id, client_id)
VALUES ('2021/12/28', 2, 1, 2);

-- CONSULTAS
SELECT * FROM vendes WHERE client_id = 2 AND data_venda > '2018/03/03';
SELECT * FROM ulleres u INNER JOIN vendes v ON u.id = v.ulleres_id WHERE v.empleat_id = 2 AND v.data_venda > '2021/12/28' AND v.data_venda < '2022/12/28';
SELECT p.nom FROM proveïdors p INNER JOIN ulleres u ON p.id = u.proveïdor_id INNER JOIN vendes v ON u.id = v.ulleres_id;

 
    