-- 1. Cree un procedimiento llamado `ps_registrar_cliente_unico`  
-- que inserta un nuevo cliente si su correo no está registrado .

DELIMITER $$

CREATE PROCEDURE ps_registrar_cliente_unico (
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_direccion VARCHAR(200),
    IN p_fecha_registro DATE,
    IN p_ciudad_id INT
)
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM clientes WHERE correo = p_correo
    ) THEN
        INSERT INTO clientes (
            nombre, correo, telefono, direccion, fecha_registro, ciudad_id) 
            VALUES (p_nombre, p_correo, p_telefono, p_direccion, p_fecha_registro, p_ciudad_id);
    END IF;
END$$

DELIMITER ;
