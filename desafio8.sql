DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON artista
FOR EACH ROW
BEGIN
  DELETE from seguidor
  WHERE seguidor.usuario_id = OLD.usuario_id;
  DELETE FROM historico
  WHERE historico.usuario_id = OLD.usuario_id;
END$$
DELIMITER ;