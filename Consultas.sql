-- Active: 1749209412451@@127.0.0.1@3307@Examen
-- 1. Mostrar los empleados junto al país donde laboran.
SELECT clientes.nombre, pais.nombre FROM clientes
JOIN pais ON clientes.cliente_id = pais.id;

-- 2. Listar el nombre de cada cliente con su municipio, departamento y país.
SELECT clientes.nombre,municipio.nombre,departamento.nombre,pais.nombre  FROM clientes
JOIN municipio ON clientes.municipioid = municipio.id
JOIN departamento ON municipio.depid = departamento.id
JOIN pais ON departamento.paisid = pais.id;