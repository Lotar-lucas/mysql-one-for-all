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

INSERT INTO plano(nome_plano, valor_plano)
VALUES('gratuito', 0.00),
      ('familiar',7.99),
      ('universitario',5.99);

INSERT INTO artista(nome_artista)
VALUES('Walter Phoenix'),
      ('Peter Strong'),
      ('Lance Day'),
      ('Freedie Shannon');

INSERT INTO album(nome_album,artista_id)
VALUES('Envious',1),
      ('Exuberant',1),
      ('Hallowed Steam',2),
      ('Incandescent',3),
      ('Temporary Culture',4);

INSERT INTO usuario(nome_usuario, idade)
VALUES('Thati', 23),
      ('Cintia',35),
      ('Bill',20),
      ('Roger',45);

INSERT INTO cancao(nome_cancao, artista_id, album_id)
VALUES('Soul For Us', 1,1),
      ('Magic Circus',2,3),
      ('Diamond Power',3,4),
      ('Thang Of Thunder',4,5),
      ('Troubles Of My Inner Fire',1,2),
      ('Time Fireworks',1,2),
      ('Honey, So Do I',2,3),
      ("Sweetie, Let's Go Wild",2,3),
      ('She Knows',2,3),
      ('Fantasy For Me',3,4),
      ('Celebration Of More',3,4),
      ('Rock His Everything',3,4),
      ('Home Foreve',3,4),
      ("Honey, Let's Be Silly",3,4),
      ('Without My Streets',4,5),
      ('Words Of Her Life',4,5),
      ('Reflections Of Magic',1,1),
      ('Dance With Her Own',1,1);

INSERT INTO seguidor(usuario_id,artista_id)
VALUES(1,1),
      (1,4),
      (1,3),
      (2,1),
      (2,3),
      (3,2),
      (3,1),
      (4,4);

INSERT INTO historico(usuario_id,cancao_id)
VALUES(1,1),
      (1,2),
      (1,3),
      (1,4),
      (2,13),
      (2,16),
      (2,17),
      (2,14),
      (3,5),
      (3,4),
      (3,2),
      (4,18),
      (4,15),
      (4,11);
