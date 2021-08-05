CREATE VIEW top_3_artistas AS
SELECT
  a.nome_artista as artista,
  count(s.artista_id) as seguidores
FROM artista as a
INNER JOIN seguidor as s
ON s.artista_id = a.artista_id
GROUP BY a.nome_artista
ORDER BY count(s.artista_id) DESC, a.nome_artista
limit 3;
