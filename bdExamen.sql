-- Active: 1749209412451@@127.0.0.1@3307@mysql
CREATE DATABASE Examen;
DROP DATABASE IF EXISTS Examen;

USE Examen;

-- 1. Pais
DROP TABLE IF EXISTS `pais`;
CREATE TABLE `pais` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `pais_unique` (`nombre`)
);

-- 2. Departamento
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) NOT NULL,
    `paisid` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`paisid`) REFERENCES `pais`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. Municipio
DROP TABLE IF EXISTS `municipio`;
CREATE TABLE `municipio` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) DEFAULT NULL,
    `depid` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`depid`) REFERENCES `departamento` (`id`)
);

-- 4. Empresa

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
    `id` INT NOT NULL,
    `nombre` varchar(80) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `empresa_unique` (`nombre`)
);

-- 5. Surcursal
DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE `sucursal` (
    `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) NOT NULL,
    `direccion` varchar(80) DEFAULT NULL,
    `empresaid` INT NOT NULL,
    `municipioid` INT NOT NULL,
    FOREIGN KEY (`empresaid`) REFERENCES `empresa` (`id`),
    FOREIGN KEY (`municipioid`) REFERENCES `municipio` (`id`)
);
-- 6. Clientes
DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
    `cliente_id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) DEFAULT NULL,
    `email` varchar(50) DEFAULT NULL,
    `telefono` varchar(15) DEFAULT NULL,
    `direccion` varchar(50) DEFAULT NULL,
    `fecha_registro` date DEFAULT NULL,
    `municipioid` INT DEFAULT NULL,
    PRIMARY KEY (`cliente_id`),
    UNIQUE KEY `email` (`email`),
    FOREIGN KEY (`municipioid`) REFERENCES `municipio`(`id`)
);

-- 7. Empleados
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
    `empleado_id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) DEFAULT NULL,
    `puesto` varchar(50) DEFAULT NULL,
    `fecha_contratacion` date DEFAULT NULL,
    `salario` decimal(10,2) DEFAULT NULL,
    `sucursalid` INT NOT NULL,
    PRIMARY KEY (`empleado_id`),
    FOREIGN KEY (`sucursalid`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 8. Pedidos
DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
    `pedido_id` INT NOT NULL AUTO_INCREMENT,
    `cliente_id` INT DEFAULT NULL,
    `empleado_id` INT DEFAULT NULL,
    `fecha_pedido` date DEFAULT NULL,
    `estado` varchar(20) DEFAULT NULL,
    PRIMARY KEY (`pedido_id`),
    FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`),
    FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 9. Productos
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
    `producto_id` INT NOT NULL AUTO_INCREMENT,
    `nombre` varchar(80) DEFAULT NULL,
    `categoria` varchar(80) DEFAULT NULL,
    `precio` decimal(10,2) DEFAULT NULL,
    `stock` int DEFAULT NULL,
    PRIMARY KEY (`producto_id`)
);

-- 10. Productos suc
DROP TABLE IF EXISTS `producto_suc`;
CREATE TABLE `producto_suc` (
    `productoid` INT NOT NULL,
    `sucursalid` INT NOT NULL,
    PRIMARY KEY (`productoid`,`sucursalid`),
    KEY `producto_suc_sucursal_FK` (`sucursalid`),
    FOREIGN KEY (`productoid`) REFERENCES `productos` (`producto_id`),
    FOREIGN KEY (`sucursalid`) REFERENCES `sucursal` (`id`)
);
-- 11. Detalles pedidos
DROP TABLE IF EXISTS `detalles_pedidos`;
CREATE TABLE `detalles_pedidos` (
    `detalle_id` int NOT NULL AUTO_INCREMENT,
    `pedido_id` int DEFAULT NULL,
    `producto_id` int DEFAULT NULL,
    `cantidad` int DEFAULT NULL,
    `precio_unitario` decimal(10,2) DEFAULT NULL,
    `sucid` int DEFAULT NULL,
    PRIMARY KEY (`detalle_id`),
    KEY `pedido_id` (`pedido_id`),
    KEY `detalles_pedidos_producto_suc_FK` (`producto_id`,`sucid`),
    FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
    FOREIGN KEY (`producto_id`, `sucid`) REFERENCES `producto_suc` (`productoid`, `sucursalid`)
);
