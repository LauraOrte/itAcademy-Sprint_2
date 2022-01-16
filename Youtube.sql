CREATE DATABASE IF NOT EXISTS youtube;
USE youtube;
CREATE TABLE IF NOT EXISTS usuari (
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(100) NOT NULL,
	password VARCHAR(60) NOT NULL,
	nom VARCHAR(60) NOT NULL,
	data_naixement DATE NOT NULL,
	sexe VARCHAR(60) NOT NULL,
	pais VARCHAR(60) NOT NULL,
	codi_postal INT NOT NULL,
	PRIMARY KEY (id)
);	

CREATE TABLE IF NOT EXISTS videos (
	id INT NOT NULL AUTO_INCREMENT,
	titol VARCHAR(60) NOT NULL,
	descripció TEXT NOT NULL,
	grandària FLOAT NOT NULL,
	thumbnail blob NOT NULL,
	repodruccions INT NOT NULL,
	data TIMESTAMP NOT NULL,
	estat ENUM('públic', 'ocult', 'privat'),
	video_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (video_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS etiquetes (
	id INT NOT NULL AUTO_INCREMENT,
	nom_etiqueta VARCHAR(60),
	etiqueta_video INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (etiqueta_video) REFERENCES videos(id)
);

CREATE TABLE IF NOT EXISTS canals (
	id INT NOT NULL AUTO_INCREMENT,
	nom_canal VARCHAR(60) NOT NULL,
	descripció TEXT NOT NULL,
	data DATE NOT NULL,
	canal_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (canal_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS playlists (
	id INT NOT NULL AUTO_INCREMENT,
	nom_playlist VARCHAR(60) NOT NULL,
	data_creation DATE,
	estat ENUM('pública', 'privada'),
	playlists_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (playlists_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS comentaris (
	id INT NOT NULL AUTO_INCREMENT,
	text VARCHAR(300) NOT NULL,
	data TIMESTAMP,
	comentari_usuari INT NOT NULL,
	comentari_video INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (comentari_usuari) REFERENCES usuari(id),
	FOREIGN KEY (comentari_video) REFERENCES videos(id)
);

CREATE TABLE IF NOT EXISTS reacció_comentaris (
	id INT NOT NULL AUTO_INCREMENT,
	reacció ENUM('like', 'dislike'),
	data TIMESTAMP,
	reacció_usuari INT NOT NULL,
	reacció_comentari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (reacció_usuari) REFERENCES usuari(id),
	FOREIGN KEY (reacció_comentari) REFERENCES comentaris(id)
);

CREATE TABLE IF NOT EXISTS reacció_videos (
	id INT NOT NULL AUTO_INCREMENT,
	reacció ENUM('like', 'dislike'),
	data TIMESTAMP,
	reacció_video INT NOT NULL,
	video_usuari INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (reacció_video) REFERENCES videos(id),
	FOREIGN KEY (video_usuari) REFERENCES usuari(id)
);