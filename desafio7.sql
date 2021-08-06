CREATE VIEW perfil_artistas AS
SELECT
  a.nome_artista as artista,
  alb.nome_album as album,
  COUNT(s.artista_id) as seguidores
FROM artista as a
INNER JOIN album as alb
ON alb.artista_id = a.artista_id
INNER JOIN seguidor as s
ON s.artista_id = alb.artista_id
GROUP BY a.nome_artista, alb.nome_album
ORDER BY COUNT(s.artista_id) DESC,a.nome_artista, alb.nome_album;

