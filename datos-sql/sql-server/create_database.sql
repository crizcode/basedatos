USE MASTER
GO

/* 1). Crear BD con las configuraciones predeterminadas de ubicación 
y tamaño que establece el servidor (ruta de instalación de SQL Server)*/

CREATE DATABASE BD_VENTAS2023
GO

	-- Validar los archivos creados en la base de datos DB_VENTAS2023
SP_HELPDB BD_VENTAS2023
GO
	-- Borrar BD
DROP DATABASE BD_VENTAS2023
GO


-- 2). Crear BD "BD_VENTAS2023" con estrategia de almacenamiento personalizada
-- Ruta de almacenamiento y tamaño de archivos personalizados.

CREATE DATABASE BD_VENTAS2023
ON PRIMARY
(
	NAME = 'BD_VENTAS2023_PRI',
	FILENAME='C:\BDVENTAS2023\DATA\BD_VENTAS2023.MDF',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=10%
)
LOG ON
(
    NAME='BD_VENTAS2023_TRA',
    FILENAME='C:\BDVENTAS2023\DATA\BD_VENTAS2023.LDF',
    SIZE=5MB,
    MAXSIZE=40MB,
    FILEGROWTH=10%
);
GO

	-- Validar los archivos creados en la base de datos DB_VENTAS2023
SP_HELPDB BD_VENTAS2023
GO

-- 3). Modificar propiedades de BD "BD_VENTAS2023" 

	-- Agregar un secundo archivo de almacenamiento a la base de datos BD_VENTAS2024
ALTER DATABASE BD_VENTAS2024
ADD FILE (
	NAME = 'BD_VENTAS2023_SEC',
	FILENAME='C:\BDVENTAS2023\DATA\BD_VENTAS2023_SEC.NDF',
	SIZE=10MB,
	MAXSIZE=100MB,
	FILEGROWTH=10%
);
GO
	-- Validar los archivos creados en la base de datos DB_VENTAS2023
SP_HELPDB BD_VENTAS2023
GO

	-- Cambiar el nombre de la base de datos
ALTER DATABASE BD_VENTAS2023
MODIFY NAME = BD_VENTAS2024;
GO
	-- Validar los archivos creados en la base de datos DB_VENTAS2024
SP_HELPDB BD_VENTAS2024
GO
	-- Borrar BD BD_VENTAS2024
DROP DATABASE BD_VENTAS2024
