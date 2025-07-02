-- Active: 1749209412451@@127.0.0.1@3307@Examen
-- 1. Mostrar los empleados junto al país donde laboran.
SELECT clientes.nombre, pais.nombre FROM clientes
JOIN pais ON clientes.cliente_id = pais.id;

