DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id_usuario INT)
RETURNS INT READS SQL DATA
BEGIN
DECLATE total INT;
SELECT
  COUNT(cancao_id)
FROM historico
WHERE usuario_id = id_usuario
INTO total;
RETURNS total;
END $$
DELIMITER ;