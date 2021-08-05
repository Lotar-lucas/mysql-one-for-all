CREATE VIEW top_2_hits_do_momento AS
SELECT
  c.nome_cancao as cancao,
  as reproducoes
FROM cancao as c
INNER JOIN historico as h
