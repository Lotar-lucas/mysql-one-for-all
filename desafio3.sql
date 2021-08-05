CREATE VIEW historico_reproducao_usuarios AS
SELECT 
  u.nome_usuario as usuario,
  h.nome_cancao as nome
FROM usuario as u
INNER JOIN historico as h