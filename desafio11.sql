CREATE VIEW cancoes_premium AS
SELECT
  c.nome_cancao as nome,
  COUNT(c.nome_cancao) as reproducoes
FROM cancao as c
INNER JOIN historico as h
ON c.cancao_id = h.cancao_id
INNER JOIN usuario as u
ON h.usuario_id = u.usuario_id
WHERE plano_id <> 1
GROUP BY c.nome_cancao
ORDER BY c.nome_cancao;
