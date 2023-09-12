-- 1) Crear una base de datos - mysql gestiona el almacenamiento
CREATE DATABASE bd_ventas2023;

	-- Validar la base de datos creada
SHOW DATABASES;

-- 2) Mysql no permite renombrar BD 
	-- Como alternativa se puede  transferir los datos de la antigua a la nueva BD
	-- Seleccionar la BD antigua 
USE bd_ventas2023;

	-- Creamos tabla "modelo" que sera migrada a la nueva db bd_ventas2024
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomprod VARCHAR(255),
    desprod TEXT
);

	-- Crear nuena base de datos - mysql gestiona el almacenamiento
CREATE DATABASE bd_ventas2024;
	-- Migramos la tabla a la nueva bd
RENAME TABLE bd_ventas2023.ventas TO bd_ventas2024.ventas;

	-- Validar la base de datos
SHOW DATABASES;

	-- Borrar la base de datos
DROP DATABASE bd_ventas2023;
DROP DATABASE bd_ventas2024;