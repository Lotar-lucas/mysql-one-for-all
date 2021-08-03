DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
	plano_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(3,2)
);

CREATE TABLE SpotifyClone.artista(
	artista_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(50) NOT NULL
);

CREATE TABLE SpotifyClone.album(
	album_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(50) NOT NULL,
    artista_id INT(11),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
);



CREATE TABLE SpotifyClone.usuario(
	usuario_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(50) NOT NULL,
    idade INT(3),
    plano_id INT(11),
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
);



CREATE TABLE SpotifyClone.cancao(
	cancao_id INT(11) PRIMARY KEY AUTO_INCREMENT,
    nome_cancao VARCHAR(50) NOT NULL,
    artista_id INT(11),
    album_id INT(11),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id)
);



CREATE TABLE SpotifyClone.seguidor(
	usuario_id INT(11) NOT NULL,
    artista_id INT(11) NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id,artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
);

CREATE TABLE SpotifyClone.historico(
	usuario_id INT(11) NOT NULL,
	cancao_id INT(11) NOT NULL,
    CONSTRAINT PRIMARY KEY(usuario_id,cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
	FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancao(cancao_id)
);