DELIMITER $$
CREATE PROCEDURE albuns_do_artista(in name_artist VARCHAR(50))
BEGIN
SELECT
  a.nome_artista as artista,
  alb.nome_album as album
FROM artista as a
INNER JOIN album as alb
ON a.artista_id = alb.artista_id AND a.nome_artista = name_artist
ORDER BY alb.nome_album;
END $$
DELIMITER ;
CALL albuns_do_artista('Walter Phoenix');