-- Active: 1749209412451@@127.0.0.1@3307@Examen
-- 1. Mostrar los empleados junto al país donde laboran.
SELECT clientes.nombre, pais.nombre FROM clientes
JOIN pais ON clientes.cliente_id = pais.id;

-- 2. Listar el nombre de cada cliente con su municipio, departamento y país.
SELECT clientes.nombre,municipio.nombre,departamento.nombre,pais.nombre  FROM clientes
JOIN municipio ON clientes.municipioid = municipio.id
JOIN departamento ON municipio.depid = departamento.id
JOIN pais ON departamento.paisid = pais.id;

-- 3. Obtener los nombres de los empleados cuyo puesto existe en más de una sucursal.

SELECT empleados.nombre, empleados.puesto FROM empleados
JOIN sucursal ON empleados.sucursalid = sucursal.id

-- 4. Mostrar el total de empleados por municipio y el nombre del departamento al que pertenecen.

SELECT municipio.nombre, departamento.nombre FROM municipio
JOIN departamento ON municipio.depid = departamento.id;

-- 5. Mostrar todos los municipios con sucursales activas (que tengan al menos un empleado).

SELECT municipio.nombre FROM municipio 
JOIN sucursal ON municipio.id = sucursal.municipioid