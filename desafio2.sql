CREATE VIEW estatisticas_musicais AS
SELECT 
  COUNT(c.nome_cancao) as cancoes,
  COUNT(DISTINCT artista_id) as artistas,
  COUNT(DISTINCT album_id) as albuns
FROM cancao as c;

-- Realizado com auxilio do colega Rafael Mathias


