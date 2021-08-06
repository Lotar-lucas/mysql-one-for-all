DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id INT)
RETURNS INT READS SQL DATA
BEGIN
DECLARE total_music INT;
SELECT COUNT(usuario_id) FROM historico
WHERE usuario_id = id
INTO total_music;
RETURN total_music;
END $$;
DELIMITER ;
SELECT quantidade_musicas_no_historico(3) INTO @total_musica;
