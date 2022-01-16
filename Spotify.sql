CREATE DATABASE IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE IF NOT EXISTS usuari (
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(60) NOT NULL,
	password VARCHAR(60) NOT NULL,
	nom_usuari VARCHAR(60) NOT NULL,
	data_naixement DATE,
	sexe VARCHAR(30) NOT NULL,
	pais VARCHAR(60) NOT NULL,
	codi_postal INT NOT NULL,
	suscripció_usuari ENUM('free', 'premium'),
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS suscripcions (
	id INT NOT NULL AUTO_INCREMENT,
	data_inici DATE,
	data_renovació DATE,
	pagament ENUM('crèdit', 'Paypal'),
	suscripcions_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (suscripcions_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS pagament (
	id INT NOT NULL,
	data DATE,
	preu FLOAT NOT NULL,
	pagament_suscripció INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (pagament_suscripció) REFERENCES suscripcions(id)
);

CREATE TABLE IF NOT EXISTS crèdit (
	número INT NOT NULL,
	data_caducitat DATE,
	codi_seguretat INT NOT NULL,
	crèdit_pagament INT NOT NULL,
	FOREIGN KEY (crèdit_pagament) REFERENCES pagament(id)
);

CREATE TABLE IF NOT EXISTS paypal (
	nom_usuari VARCHAR(60) NOT NULL,
	paypal_pagament INT NOT NULL,
	FOREIGN KEY (paypal_pagament) REFERENCES pagament(id)
);


CREATE TABLE IF NOT EXISTS playlists (
	id INT NOT NULL AUTO_INCREMENT,
	títol VARCHAR(60) NOT NULL,
	número_cançons INT NOT NULL,
	data_creació DATE,
	estat ENUM('activa', 'esborrada'),
	playlists_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (playlists_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS artista (
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(60) NOT NULL,
	imatge LONGBLOB,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS àlbum (
	id INT NOT NULL AUTO_INCREMENT,
	títol VARCHAR(60) NOT NULL,
	any_publicació YEAR NOT NULL,
	imatge_portada LONGBLOB,
	àlbum_artista INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (àlbum_artista) REFERENCES artista(id)
);

CREATE TABLE IF NOT EXISTS cançó (
	id INT NOT NULL AUTO_INCREMENT,
	títol VARCHAR(60) NOT NULL,
	durada FLOAT NOT NULL,	
	num_reproduccions INT NOT NULL,
	cançó_àlbum INT NOT NULL,
	cançó_artista INT NOT NULL,
	cançó_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (cançó_àlbum) REFERENCES àlbum(id),
	FOREIGN KEY (cançó_artista) REFERENCES artista(id),
	FOREIGN KEY (cançó_usuari) REFERENCES usuari(id)
);