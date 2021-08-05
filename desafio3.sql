CREATE VIEW historico_reproducao_usuarios AS
SELECT 
  u.nome_usuario as usuario,
  c.nome_cancao as nome
FROM usuario as u
INNER JOIN historico as h
ON u.usuario_id = h.usuario_id
INNER JOIN cancao as c
ON c.cancao_id = h.cancao_id
ORDER BY u.nome_usuario, c.nome_cancao;
