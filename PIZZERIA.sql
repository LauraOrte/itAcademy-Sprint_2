CREATE DATABASE IF NOT EXISTS Pizzeria;
USE Pizzeria;
CREATE TABLE IF NOT EXISTS provincia (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS localitat (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,
	localitat_provincia INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (localitat_provincia) REFERENCES provincia (id)
);

CREATE TABLE IF NOT EXISTS clients (
	id INT NOT NULL AUTO_INCREMENT, 
	nom VARCHAR(60) NOT NULL,
	cognom VARCHAR(60) NOT NULL,
	adreça VARCHAR(200) NOT NULL,
	codi_postal INT NOT NULL,
	telf INT NOT NULL,
	clients_localitat INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (clients_localitat) REFERENCES localitat(id)
);

CREATE TABLE IF NOT EXISTS empleats (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,
	cognom VARCHAR(60) NOT NULL,
	NIF INT NOT NULL,
	telf INT NOT NULL,
	treball ENUM('cuiner', 'repartidor'),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS botiga (
	id INT NOT NULL AUTO_INCREMENT,
	adreça VARCHAR(200) NOT NULL,
	codi_postal INT NOT NULL,
	botiga_localitat INT NOT NULL,
	botiga_empleats INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (botiga_localitat) REFERENCES localitat(id),
	FOREIGN KEY (botiga_empleats) REFERENCES empleats(id)
);

CREATE TABLE IF NOT EXISTS categoria_pizzas (
	id INT NOT NULL AUTO_INCREMENT,
	nom_categoria VARCHAR(60) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS pizza (
	id INT NOT NULL AUTO_INCREMENT,
	nom_pizza VARCHAR(60) NOT NULL,
	descripció_pizza TEXT,
	imatge_pizza LONGBLOB,
	preu_pizza FLOAT NOT NULL,
	pizza_categoria INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (pizza_categoria) REFERENCES categoria_pizzas(id)
);

CREATE TABLE IF NOT EXISTS hamburgueses (
	id INT NOT NULL AUTO_INCREMENT,
	nom_hamburguesa VARCHAR(60) NOT NULL,
	descripció_hamburguesa TEXT,
	imatge_hamburguesa LONGBLOB,
	preu_hamburguesa FLOAT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS begudes (
	id INT NOT NULL AUTO_INCREMENT,
	nom_beguda VARCHAR(60) NOT NULL,
	descripció_beguda TEXT,
	imatge_beguda LONGBLOB,
	preu_beguda FLOAT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS productes (
	id INT NOT NULL AUTO_INCREMENT,
    producte_beguda INT NOT NULL,
    producte_hamburguesa INT NOT NULL,
    producte_pizza INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (producte_pizza) REFERENCES pizza(id),
	FOREIGN KEY (producte_hamburguesa) REFERENCES hamburgueses(id),
	FOREIGN KEY (producte_beguda) REFERENCES begudes(id)
);

CREATE TABLE IF NOT EXISTS comandes (
	id INT NOT NULL AUTO_INCREMENT,
	comanda_hora DATETIME,
	tipus ENUM('domicili', 'botiga'),
	comanda_botiga INT NOT NULL,
	comanda_productes INT NOT NULL,
    comanda_clients INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (comanda_botiga) REFERENCES botiga(id),
	FOREIGN KEY (comanda_productes) REFERENCES productes(id),
    FOREIGN KEY (comanda_clients) REFERENCES clients (id)
); 

CREATE TABLE IF NOT EXISTS domicili (
	id INT NOT NULL AUTO_INCREMENT,
	hora_entrega DATETIME,
	domicili_empleat INT NOT NULL,
	domicili_comanda INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (domicili_empleat) REFERENCES empleats(id),
	FOREIGN KEY (domicili_comanda) REFERENCES comandes(id)
);
  
-- PROVINCIA
INSERT INTO provincia (nom)
VALUES ('Provincia1');
INSERT INTO provincia (nom)
VALUES ('Provincia2');
INSERT INTO provincia (nom)
VALUES ('Provincia3');

-- LOCALITAT
INSERT INTO localitat (nom, localitat_provincia)
VALUES ('Barcelona', 1);
INSERT INTO localitat (nom, localitat_provincia)
VALUES ('Barcelona', 2);
INSERT INTO localitat (nom, localitat_provincia)
VALUES ('Girona', 3);

-- CLIENTS
INSERT INTO clients (nom, cognom, adreça, codi_postal, telf, clients_localitat)
VALUES ('Pepa', 'Martínez', 'Calle perdida 1', 08904, 944832637, 1);
INSERT INTO clients (nom, cognom, adreça, codi_postal, telf, clients_localitat)
VALUES ('Marta', 'Perez', 'Calle perdida 2', 08900, 92019283, 2);
INSERT INTO clients (nom, cognom, adreça, codi_postal, telf, clients_localitat)
VALUES ('Pedro', 'Ruíz', 'Calle perdida 3', 07900, 94111111, 3);

-- EMPLEATS
INSERT INTO empleats (nom, cognom, NIF, telf, treball)
VALUES ('Marc', 'Ortega', 3928939, 911110233, 'cuiner');
INSERT INTO empleats (nom, cognom, NIF, telf, treball)
VALUES ('Laura', 'Igle', 1010101, 93333333, 'repartidor');
INSERT INTO empleats (nom, cognom, NIF, telf, treball)
VALUES ('Josua', 'Oriz', 9384622, 92222222, 'repartidor');

-- BOTIGA
INSERT INTO botiga (adreça, codi_postal, botiga_localitat, botiga_empleats)
VALUES ('Calle Sin1', 87777, 1, 3);
INSERT INTO botiga (adreça, codi_postal, botiga_localitat, botiga_empleats)
VALUES ('Calle Sin2', 84444, 2, 1);
INSERT INTO botiga (adreça, codi_postal, botiga_localitat, botiga_empleats)
VALUES ('Calle Sin3', 83333, 3, 2);

-- CATEGORIA PIZZAS
INSERT INTO categoria_pizzas ( nom_categoria)
VALUES ('Categoria1');
INSERT INTO categoria_pizzas ( nom_categoria)
VALUES ('Categoria2');
INSERT INTO categoria_pizzas ( nom_categoria)
VALUES ('Categoria3');

-- PIZZAS
INSERT INTO pizza (nom_pizza, descripció_pizza, imatge_pizza, preu_pizza, pizza_categoria)
VALUES ('Caprichosa', 'Masa fina muy rica', 'pizza1.img', 9.99, 1);
INSERT INTO pizza (nom_pizza, descripció_pizza, imatge_pizza, preu_pizza, pizza_categoria)
VALUES ('Gordaka', 'Masa gruesa muy rica', 'pizza2.img', 10.99, 2);
INSERT INTO pizza (nom_pizza, descripció_pizza, imatge_pizza, preu_pizza, pizza_categoria)
VALUES ('Barbacoa', 'Masa fina con salsa barbacoa', 'pizza3.img', 10.99, 3);

-- HAMBURGUESES
INSERT INTO hamburgueses (nom_hamburguesa, descripció_hamburguesa, imatge_hamburguesa, preu_hamburguesa)
VALUES ('Super', 'A tope de queso', 'hambur1.img', 10);
INSERT INTO hamburgueses (nom_hamburguesa, descripció_hamburguesa, imatge_hamburguesa, preu_hamburguesa)
VALUES ('Slim', 'Muy ligera', 'hambur2.img', 8.99);
INSERT INTO hamburgueses (nom_hamburguesa, descripció_hamburguesa, imatge_hamburguesa, preu_hamburguesa)
VALUES ('Extra', 'A tope de todo, con extra de bacon', 'hambur3.img', 11.99);

-- BEGUDES
INSERT INTO begudes (nom_beguda, descripció_beguda, imatge_beguda, preu_beguda)
VALUES ('Beguda1', 'Mucho azucar', 'beguda1.img', 3.99);
INSERT INTO begudes (nom_beguda, descripció_beguda, imatge_beguda, preu_beguda)
VALUES ('Beguda2', 'Poco azucar', 'beguda2.img', 3.99);
INSERT INTO begudes (nom_beguda, descripció_beguda, imatge_beguda, preu_beguda)
VALUES ('Beguda3', 'Extra azucar', 'beguda3.img', 4.99);

-- PRODUCTES
INSERT INTO productes (producte_beguda, producte_hamburguesa, producte_pizza)
VALUES (1, 2, 3);
INSERT INTO productes (producte_beguda, producte_hamburguesa, producte_pizza)
VALUES (2, 1, 1);
INSERT INTO productes (producte_beguda, producte_hamburguesa, producte_pizza)
VALUES (3, 2, 3);

-- COMANDES
INSERT INTO comandes (comanda_hora, tipus, comanda_botiga, comanda_productes, comanda_clients)
VALUES ('2021-02-8 19:00:59', 'botiga', 1, 2, 1);
INSERT INTO comandes (comanda_hora, tipus, comanda_botiga, comanda_productes, comanda_clients)
VALUES ('2021-02-8 20:00:00', 'botiga', 3, 1, 2);
INSERT INTO comandes (comanda_hora, tipus, comanda_botiga, comanda_productes, comanda_clients)
VALUES ('2021-02-8 21:00:00', 'domicili', 3, 3, 3);

-- DOMICILI
INSERT INTO domicili (hora_entrega, domicili_empleat, domicili_comanda)
VALUES ('2021-02-8 19:30:00', 1, 1);
INSERT INTO domicili (hora_entrega, domicili_empleat, domicili_comanda)
VALUES ('2021-02-8 20:30:00', 2, 3);
INSERT INTO domicili (hora_entrega, domicili_empleat, domicili_comanda)
VALUES ('2021-02-8 21:30:00', 2, 1);

-- CONSULTAS
SELECT be.nom_beguda FROM begudes be INNER JOIN productes p ON be.id = p.producte_beguda INNER JOIN comandes c ON p.id = c.comanda_productes INNER JOIN botiga b ON b.id = c.comanda_botiga INNER JOIN localitat l ON l.id = b.botiga_localitat WHERE l.nom = 'Barcelona';
SELECT COUNT(c.id) totalComandes FROM comandes c INNER JOIN botiga b ON b.id = c.comanda_botiga INNER JOIN empleats e ON e.id = b.botiga_empleats WHERE e.nom = 'Laura';