CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.nome_cancao as cancao,
  COUNT(h.cancao_id) as reproducoes
FROM cancao as c
INNER JOIN historico as h
ON h.cancao_id = c.cancao_id
GROUP BY c.nome_cancao
ORDER BY COUNT(h.cancao_id) DESC, c.nome_cancao
LIMIT 2;
