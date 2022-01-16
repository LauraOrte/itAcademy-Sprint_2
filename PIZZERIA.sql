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

CREATE TABLE IF NOT EXISTS comandes (
	id INT NOT NULL AUTO_INCREMENT,
	comanda_hora DATETIME,
	tipus ENUM('domicili', 'botiga'),
	producte_pizza INT NOT NULL,
	producte_hamburguesa INT NOT NULL,
	producte_beguda INT NOT NULL,
	comanda_botiga INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (producte_pizza) REFERENCES pizza(id),
	FOREIGN KEY (producte_hamburguesa) REFERENCES hamburgueses(id),
	FOREIGN KEY (producte_beguda) REFERENCES begudes(id),
	FOREIGN KEY (comanda_botiga) REFERENCES botiga(id)
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


