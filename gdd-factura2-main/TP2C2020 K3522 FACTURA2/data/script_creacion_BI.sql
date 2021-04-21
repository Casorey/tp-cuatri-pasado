
/*Dimensiones!*/

	IF  EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE 
        object_id = OBJECT_ID(N'[GDD2020].[CALCULAR_EDAD]')
         AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	DROP FUNCTION [GDD2020].[CALCULAR_EDAD]
	END

		IF  EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE 
        object_id = OBJECT_ID(N'[GDD2020].[CALCULAR_CATEGORIA_EDAD]')
         AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	BEGIN
	DROP FUNCTION [GDD2020].[CALCULAR_CATEGORIA_EDAD]
	END

GO

CREATE FUNCTION [GDD2020].[CALCULAR_EDAD]
        (@FECHA_NACIMIENTO  DATE) 
RETURNS int 
AS BEGIN 
    DECLARE @retorno int

    SET @retorno = YEAR(GETDATE()) - YEAR(@FECHA_NACIMIENTO)

    RETURN @retorno
END

GO

CREATE FUNCTION [GDD2020].[CALCULAR_CATEGORIA_EDAD]
        (@FECHA_NACIMIENTO  DATE) 
RETURNS char(12)
AS BEGIN 
    DECLARE @edad int,
            @retorno char(12)

    SET @edad = YEAR(GETDATE()) - YEAR(@FECHA_NACIMIENTO)

    SET @retorno = case when @edad BETWEEN 18 AND 30 then 'Joven'
                        when @edad BETWEEN 31 AND 50 then 'Adulto'
                          else 'AdultoMayor'
                   end
    RETURN @retorno
END

	GO

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_MODELO_CODIGO_AUTOPARTE')  )
	ALTER TABLE [GDD2020].[BI_AUTOPARTE] DROP CONSTRAINT FK_BI_MODELO_CODIGO_AUTOPARTE

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_FABRICANTE_CODIGO_AUTOPARTE')  )
	ALTER TABLE [GDD2020].[BI_AUTOPARTE] DROP CONSTRAINT FK_BI_FABRICANTE_CODIGO_AUTOPARTE

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_MODELO_CODIGO')  )
	ALTER TABLE [GDD2020].[POTENCIA] DROP CONSTRAINT FK_BI_MODELO_CODIGO

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_SUCURSAL_CODIGO_COMPRAS')  )
	ALTER TABLE [GDD2020].[COMPRAS] DROP CONSTRAINT FK_SUCURSAL_CODIGO_COMPRAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_CLIENTE_CODIGO_COMPRAS')  )
	ALTER TABLE [GDD2020].[COMPRAS] DROP CONSTRAINT FK_CLIENTE_CODIGO_COMPRAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_AUTO_PARTE_CODIGO_COMPRAS')  )
	ALTER TABLE [GDD2020].[COMPRAS] DROP CONSTRAINT FK_AUTO_PARTE_CODIGO_COMPRAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_AUTO_PATENTE_COMPRAS')  )
	ALTER TABLE [GDD2020].[COMPRAS] DROP CONSTRAINT FK_AUTO_PATENTE_COMPRAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_SUCURSAL_CODIGO_VENTAS')  )
	ALTER TABLE [GDD2020].[VENTAS] DROP CONSTRAINT FK_SUCURSAL_CODIGO_VENTAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_AUTO_PARTE_CODIGO_VENTAS')  )
	ALTER TABLE [GDD2020].[VENTAS] DROP CONSTRAINT FK_AUTO_PARTE_CODIGO_VENTAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_AUTO_PATENTE_VENTAS')  )
	ALTER TABLE [GDD2020].[VENTAS] DROP CONSTRAINT FK_AUTO_PATENTE_VENTAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_CLIENTE_CODIGO_VENTAS')  )
	ALTER TABLE [GDD2020].[VENTAS] DROP CONSTRAINT FK_CLIENTE_CODIGO_VENTAS

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_MODELO_CODIGO_AUTOMOVIL')  )
	ALTER TABLE [GDD2020].[BI_AUTOMOVIL] DROP CONSTRAINT FK_BI_MODELO_CODIGO_AUTOMOVIL

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_FABRICANTE_CODIGO_AUTOMOVIL')  )
	ALTER TABLE [GDD2020].[BI_AUTOMOVIL] DROP CONSTRAINT FK_BI_FABRICANTE_CODIGO_AUTOMOVIL

	IF EXISTS (  SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[GDD2020].FK_BI_TIPO_AUTO_CODIGO')  )
	ALTER TABLE [GDD2020].[BI_AUTOMOVIL] DROP CONSTRAINT FK_BI_TIPO_AUTO_CODIGO

	IF OBJECT_ID('[GDD2020].[BI_CLIENTE]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_CLIENTE]

	IF OBJECT_ID('[GDD2020].[TIEMPO]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[TIEMPO]
	
	IF OBJECT_ID('[GDD2020].[BI_SUCURSAL]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_SUCURSAL]

	IF OBJECT_ID('[GDD2020].[BI_MODELO]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_MODELO]

	IF OBJECT_ID('[GDD2020].[BI_FABRICANTE]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_FABRICANTE]

	IF OBJECT_ID('[GDD2020].[BI_TIPOAUTO]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_TIPOAUTO]

	IF OBJECT_ID('[GDD2020].[BI_CAJA]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_CAJA]

	IF OBJECT_ID('[GDD2020].[BI_AUTOPARTE]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_AUTOPARTE]

	IF OBJECT_ID('[GDD2020].[BI_MOTOR]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_MOTOR]

	IF OBJECT_ID('[GDD2020].[BI_TRANSMISION]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_TRANSMISION]


	IF OBJECT_ID('[GDD2020].[POTENCIA]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[POTENCIA]

	IF OBJECT_ID('[GDD2020].[BI_AUTOMOVIL]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[BI_AUTOMOVIL]
	
	IF OBJECT_ID('[GDD2020].[COMPRAS]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[COMPRAS]

	IF OBJECT_ID('[GDD2020].[VENTAS]', 'U') IS NOT NULL 
	DROP TABLE [GDD2020].[VENTAS]

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Ganancias_Automoviles_vendidos' AND type = 'V') 
	DROP VIEW dbo.Ganancias_Automoviles_vendidos;

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Ganancias_Autopartes_vendidas' AND type = 'V') 
	DROP VIEW dbo.Ganancias_Autopartes_vendidas;

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Precio_promedio_autoparte' AND type = 'V') 
	DROP VIEW dbo.Precio_promedio_autoparte;

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Precio_promedio_auto' AND type = 'V') 
	DROP VIEW dbo.Precio_promedio_auto;

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Automoviles_vendidos' AND type = 'V') 
	DROP VIEW dbo.Automoviles_vendidos;

	IF EXISTS (SELECT * FROM sys.views WHERE name = 'Maximo_stock_por_sucursal' AND type = 'V') 
	DROP VIEW dbo.Maximo_stock_por_sucursal;
	
	
GO
 

CREATE TABLE [GDD2020].[BI_CLIENTE](
	[CLIENTE_CODIGO] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[CLIENTE_DNI] [decimal](18, 0),
	[CLIENTE_APELLIDO] [nvarchar](255),
	[CLIENTE_NOMBRE] [nvarchar](255),
	[EDAD] int,
	[CLASIFICACION_EDAD] [varchar] (20)
) ON [PRIMARY]

INSERT INTO GDD2020.BI_CLIENTE (CLIENTE_DNI,CLIENTE_APELLIDO,CLIENTE_NOMBRE,EDAD,CLASIFICACION_EDAD)
SELECT CLIENTE_DNI,CLIENTE_APELLIDO,CLIENTE_NOMBRE,GDD2020.CALCULAR_EDAD(CLIENTE_FECHA_NAC),GDD2020.CALCULAR_CATEGORIA_EDAD(CLIENTE_FECHA_NAC)
FROM  GDD2020.CLIENTE

CREATE TABLE [GDD2020].[TIEMPO](
	[CODIGO_FECHA] int NOT NULL PRIMARY KEY,
	[MES] char(2),
	[ANIO] char(4)
)

CREATE TABLE [GDD2020].[BI_SUCURSAL](
	[SUCURSAL_CODIGO] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[SUCURSAL_DIRECCION] [nvarchar](255) NULL,
	[SUCURSAL_MAIL] [nvarchar](255) NULL,
	[SUCURSAL_TELEFONO] [decimal](18, 0) NULL,
	[SUCURSAL_CIUDAD] [nvarchar](255) NULL
) ON [PRIMARY] 

INSERT INTO GDD2020.BI_SUCURSAL(SUCURSAL_DIRECCION,SUCURSAL_MAIL,SUCURSAL_TELEFONO)
SELECT SUCURSAL_DIRECCION,SUCURSAL_MAIL,SUCURSAL_TELEFONO
FROM GDD2020.SUCURSAL

CREATE TABLE [GDD2020].[BI_MODELO](
	[MODELO_CODIGO] [decimal](18, 0) PRIMARY KEY,
	[MODELO_NOMBRE] [nvarchar](255) ,
	[MODELO_POTENCIA] [decimal](18, 0)
) ON [PRIMARY]

INSERT INTO GDD2020.BI_MODELO(MODELO_CODIGO,MODELO_NOMBRE,MODELO_POTENCIA)
SELECT MODELO_CODIGO,MODELO_NOMBRE,MODELO_POTENCIA
FROM GDD2020.MODELO

CREATE TABLE [GDD2020].[BI_FABRICANTE](
	[FABRICANTE_CODIGO] BIGINT PRIMARY KEY,
	[FABRICANTE_NOMBRE] [nvarchar](255) 
) ON [PRIMARY] 

INSERT INTO GDD2020.BI_FABRICANTE(FABRICANTE_CODIGO,FABRICANTE_NOMBRE)
SELECT FABRICANTE_CODIGO,FABRICANTE_NOMBRE
FROM GDD2020.FABRICANTE

CREATE TABLE [GDD2020].[BI_TIPOAUTO](
	[TIPO_AUTO_CODIGO] [decimal](18, 0) PRIMARY KEY,
	[TIPO_AUTO_DESC] [nvarchar](255) NULL
) ON [PRIMARY]

INSERT INTO GDD2020.BI_TIPOAUTO(TIPO_AUTO_CODIGO,TIPO_AUTO_DESC)
SELECT TIPO_AUTO_CODIGO,TIPO_AUTO_DESC
FROM GDD2020.TIPOAUTO

CREATE TABLE [GDD2020].[BI_CAJA](
	[TIPO_CAJA_CODIGO] [decimal](18, 0) PRIMARY KEY,
	[TIPO_CAJA_DESC] [nvarchar](255) NULL,
) ON [PRIMARY]

INSERT INTO GDD2020.BI_CAJA(TIPO_CAJA_CODIGO,TIPO_CAJA_DESC)
SELECT TIPO_CAJA_CODIGO,TIPO_CAJA_DESC
FROM GDD2020.CAJA

CREATE TABLE [GDD2020].[BI_AUTOPARTE](
	[AUTO_PARTE_CODIGO] [decimal](18, 0) PRIMARY KEY,
	[AUTO_PARTE_DESCRIPCION] [nvarchar](255) NULL,
	[MODELO_CODIGO] [decimal](18, 0),
	[FABRICANTE_CODIGO] BIGINT,
	CONSTRAINT FK_BI_MODELO_CODIGO_AUTOPARTE FOREIGN KEY (MODELO_CODIGO) REFERENCES [GDD2020].[BI_MODELO](MODELO_CODIGO),
	CONSTRAINT FK_BI_FABRICANTE_CODIGO_AUTOPARTE FOREIGN KEY (FABRICANTE_CODIGO) REFERENCES [GDD2020].[BI_FABRICANTE](FABRICANTE_CODIGO)
) ON [PRIMARY]

INSERT INTO GDD2020.BI_AUTOPARTE(AUTO_PARTE_CODIGO,AUTO_PARTE_DESCRIPCION,MODELO_CODIGO,FABRICANTE_CODIGO)
SELECT ap.AUTO_PARTE_CODIGO,ap.AUTO_PARTE_DESCRIPCION,mo.MODELO_CODIGO,fab.FABRICANTE_CODIGO
FROM GDD2020.AUTOPARTE ap
JOIN GDD2020.BI_MODELO mo ON (ap.MODELO_CODIGO = mo.MODELO_CODIGO)
JOIN GDD2020.BI_FABRICANTE fab ON (fab.FABRICANTE_CODIGO = ap.FABRICANTE_CODIGO)

CREATE TABLE [GDD2020].[BI_MOTOR](
	[TIPO_MOTOR_CODIGO] [decimal](18, 0) PRIMARY KEY,
) ON [PRIMARY]

INSERT INTO GDD2020.BI_MOTOR(TIPO_MOTOR_CODIGO)
SELECT TIPO_MOTOR_CODIGO
FROM GDD2020.MOTOR

CREATE TABLE [GDD2020].[BI_TRANSMISION](
	[TIPO_TRANSMISION_CODIGO] [decimal](18, 0) PRIMARY KEY,
	[TIPO_TRANSMISION_DESC] [nvarchar](255) NULL,
) ON [PRIMARY] --insertado

INSERT INTO GDD2020.BI_TRANSMISION(TIPO_TRANSMISION_CODIGO,TIPO_TRANSMISION_DESC)
SELECT TIPO_TRANSMISION_CODIGO,TIPO_TRANSMISION_DESC
FROM GDD2020.TRANSMISION

CREATE TABLE [GDD2020].[POTENCIA](
	[POTENCIA_CODIGO] BIGINT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	[MODELO_POTENCIA] [decimal](18,0),
	[MODELO_CODIGO] [decimal](18,0),
	CONSTRAINT FK_BI_MODELO_CODIGO FOREIGN KEY (MODELO_CODIGO) REFERENCES [GDD2020].[BI_MODELO](MODELO_CODIGO)
) ON [PRIMARY]

INSERT INTO GDD2020.POTENCIA(MODELO_POTENCIA,MODELO_CODIGO)
SELECT MODELO_POTENCIA,MODELO_CODIGO
FROM GDD2020.BI_MODELO

CREATE TABLE [GDD2020].[BI_AUTOMOVIL](
	[AUTO_PATENTE] [nvarchar](50) PRIMARY KEY,
	[AUTO_NRO_CHASIS] [nvarchar](50),
	[AUTO_NRO_MOTOR] [nvarchar](50),
	[AUTO_CANT_KMS] [decimal](18, 0),
	[AUTO_FECHA_ALTA] [datetime2](3),
	[MODELO_CODIGO] [decimal](18, 0),
	[FABRICANTE_CODIGO] BIGINT,
	[SUCURSAL_CODIGO] BIGINT,
	[TIPO_AUTO_CODIGO] [decimal](18, 0),
	CONSTRAINT FK_BI_MODELO_CODIGO_AUTOMOVIL FOREIGN KEY (MODELO_CODIGO) REFERENCES [GDD2020].[BI_MODELO](MODELO_CODIGO),
	CONSTRAINT FK_BI_FABRICANTE_CODIGO_AUTOMOVIL FOREIGN KEY (FABRICANTE_CODIGO) REFERENCES [GDD2020].[BI_FABRICANTE](FABRICANTE_CODIGO),
	CONSTRAINT FK_BI_TIPO_AUTO_CODIGO FOREIGN KEY (TIPO_AUTO_CODIGO) REFERENCES [GDD2020].[BI_TIPOAUTO](TIPO_AUTO_CODIGO)
)

INSERT INTO GDD2020.BI_AUTOMOVIL(AUTO_PATENTE,AUTO_NRO_CHASIS,AUTO_NRO_MOTOR,AUTO_CANT_KMS,AUTO_FECHA_ALTA,MODELO_CODIGO,FABRICANTE_CODIGO,SUCURSAL_CODIGO,TIPO_AUTO_CODIGO)
SELECT AUTO_PATENTE,AUTO_NRO_CHASIS,AUTO_NRO_MOTOR,AUTO_CANT_KMS,AUTO_FECHA_ALTA,MODELO_CODIGO,FABRICANTE_CODIGO,SUCURSAL_CODIGO,TIPO_AUTO_CODIGO
FROM GDD2020.AUTOMOVIL
 

CREATE TABLE [GDD2020].[COMPRAS](
	[COMPRAS_CODIGO] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[COMPRA_NRO] [decimal](18, 0),
	[SUCURSAL_CODIGO] BIGINT,
	[CLIENTE_CODIGO] BIGINT,
	[AUTO_PARTE_CODIGO] [decimal](18, 0),
	[AUTO_PATENTE] [nvarchar](50),
	[COMPRA_FECHA] [datetime2](3),
	[PRECIO_TOTAL] decimal(18,2)
	CONSTRAINT FK_SUCURSAL_CODIGO_COMPRAS FOREIGN KEY (SUCURSAL_CODIGO) REFERENCES [GDD2020].[BI_SUCURSAL](SUCURSAL_CODIGO),
	CONSTRAINT FK_CLIENTE_CODIGO_COMPRAS FOREIGN KEY (CLIENTE_CODIGO) REFERENCES [GDD2020].[BI_CLIENTE](CLIENTE_CODIGO),
	CONSTRAINT FK_AUTO_PARTE_CODIGO_COMPRAS FOREIGN KEY (AUTO_PARTE_CODIGO) REFERENCES [GDD2020].[BI_AUTOPARTE](AUTO_PARTE_CODIGO),
	CONSTRAINT FK_AUTO_PATENTE_COMPRAS FOREIGN KEY (AUTO_PATENTE) REFERENCES [GDD2020].[BI_AUTOMOVIL](AUTO_PATENTE)
)

INSERT INTO GDD2020.COMPRAS(COMPRA_NRO,SUCURSAL_CODIGO,CLIENTE_CODIGO,AUTO_PARTE_CODIGO,AUTO_PATENTE,COMPRA_FECHA,PRECIO_TOTAL)
SELECT DISTINCT c.COMPRA_NRO,c.SUCURSAL_CODIGO,CLIENTE_CODIGO,ap.AUTO_PARTE_CODIGO,au.AUTO_PATENTE,COMPRA_FECHA,COMPRA_PRECIO_T*(SELECT ISNULL (COMPRA_CANT_T,1)) TOTAL
FROM GDD2020.COMPRA c
LEFT JOIN GDD2020.COMPRA_AUTOPARTE cap ON (cap.COMPRA_NRO = c.COMPRA_NRO)
LEFT JOIN GDD2020.COMPRA_AUTOPARTE_X_AUTOPARTE cxap ON (cxap.CODIGO_COMPRA_AUTOPARTE = cap.CODIGO_COMPRA_AUTOPARTE)
LEFT JOIN GDD2020.BI_AUTOPARTE ap ON (ap.AUTO_PARTE_CODIGO = cxap.AUTO_PARTE_CODIGO)
LEFT JOIN GDD2020.COMPRA_AUTOMOVIL ca ON (ca.COMPRA_NRO = c.COMPRA_NRO)
LEFT JOIN GDD2020.BI_AUTOMOVIL au ON (au.AUTO_PATENTE = ca.AUTO_PATENTE)
LEFT JOIN (SELECT DISTINCT COMPRA_NRO,SUM(COMPRA_PRECIO) COMPRA_PRECIO_T,SUM(COMPRA_CANT) COMPRA_CANT_T 
FROM GDD2020.ITEM_COMPRA GROUP BY COMPRA_NRO) subq ON subq.COMPRA_NRO = c.COMPRA_NRO

CREATE TABLE [GDD2020].[VENTAS](
	[VENTAS_CODIGO] BIGINT IDENTITY(1,1) PRIMARY KEY,
	[FACTURA_NRO] [decimal](18, 0),
	[FACTURA_FECHA] [datetime2](3) NULL,
	[SUCURSAL_CODIGO] BIGINT,
	[PRECIO_FACTURADO] [decimal](18, 2) NULL,
	[AUTO_PARTE_CODIGO] [decimal](18, 0),
	[AUTO_PATENTE] [nvarchar](50),
	CONSTRAINT FK_SUCURSAL_CODIGO_VENTAS FOREIGN KEY (SUCURSAL_CODIGO) REFERENCES [GDD2020].[BI_SUCURSAL](SUCURSAL_CODIGO),
	CONSTRAINT FK_AUTO_PARTE_CODIGO_VENTAS FOREIGN KEY (AUTO_PARTE_CODIGO) REFERENCES [GDD2020].[BI_AUTOPARTE](AUTO_PARTE_CODIGO),
	CONSTRAINT FK_AUTO_PATENTE_VENTAS FOREIGN KEY (AUTO_PATENTE) REFERENCES [GDD2020].[BI_AUTOMOVIL](AUTO_PATENTE)
)

INSERT INTO GDD2020.VENTAS(FACTURA_NRO,FACTURA_FECHA,SUCURSAL_CODIGO,PRECIO_FACTURADO,AUTO_PARTE_CODIGO,AUTO_PATENTE)
SELECT DISTINCT fac.FACTURA_NRO,fac.FACTURA_FECHA,fac.SUCURSAL_CODIGO,fac.PRECIO_FACTURADO,ap.AUTO_PARTE_CODIGO,fau.AUTO_PATENTE
FROM GDD2020.FACTURACION fac
LEFT JOIN GDD2020.FACTURA_AUTOPARTE fap ON (fap.FACTURA_NRO = fac.FACTURA_NRO)
LEFT JOIN GDD2020.FACTURA_AUTOPARTE_X_AUTOPARTE faxa ON (faxa.FAC_AUTOPARTE_CODIGO = fap.FAC_AUTOPARTE_CODIGO)
LEFT JOIN GDD2020.BI_AUTOPARTE ap ON (ap.AUTO_PARTE_CODIGO = faxa.AUTO_PARTE_CODIGO)
LEFT JOIN GDD2020.FACTURA_AUTO fau ON (fau.FACTURA_NRO = fac.FACTURA_NRO)


GO

CREATE VIEW Ganancias_Automoviles_vendidos
AS
SELECT SUM(v.PRECIO_FACTURADO) - SUM(c.PRECIO_TOTAL) ganancia, c.SUCURSAL_CODIGO, MONTH(v.FACTURA_FECHA) mesFactura, YEAR(v.FACTURA_FECHA) anioFactura
FROM GDD2020.COMPRAS c
JOIN GDD2020.VENTAS v ON (c.AUTO_PATENTE = v.AUTO_PATENTE)
GROUP BY c.SUCURSAL_CODIGO,MONTH(v.FACTURA_FECHA), YEAR(v.FACTURA_FECHA)
-- Ganancias autoparte
GO

CREATE VIEW Ganancias_Autopartes_vendidas
AS
SELECT SUM(v.PRECIO_FACTURADO) - SUM(c.PRECIO_TOTAL) ganancia, c.SUCURSAL_CODIGO, MONTH(v.FACTURA_FECHA) mesFactura, YEAR(v.FACTURA_FECHA) anioFactura
FROM GDD2020.COMPRAS c
JOIN GDD2020.VENTAS v ON (v.AUTO_PARTE_CODIGO = c.AUTO_PARTE_CODIGO)
GROUP BY c.SUCURSAL_CODIGO,v.FACTURA_FECHA, MONTH(v.FACTURA_FECHA), YEAR(v.FACTURA_FECHA)
-- Precio promedio autoparte

GO

CREATE VIEW Precio_promedio_autoparte
AS
SELECT SUM(v.PRECIO_FACTURADO) / COUNT(v.FACTURA_NRO) precioPromedioVendido,AVG(c.PRECIO_TOTAL) precioPromedioComprado, c.AUTO_PARTE_CODIGO
FROM GDD2020.COMPRAS c
JOIN GDD2020.VENTAS v ON (v.AUTO_PARTE_CODIGO = c.AUTO_PARTE_CODIGO)
GROUP BY c.AUTO_PARTE_CODIGO

GO

CREATE VIEW Precio_promedio_auto
AS
SELECT SUM(v.PRECIO_FACTURADO) / COUNT(v.FACTURA_NRO) precioPromedioVendido, AVG(c.PRECIO_TOTAL) precioPromedioComprado, c.AUTO_PATENTE
FROM GDD2020.COMPRAS c
JOIN GDD2020.VENTAS v ON (v.AUTO_PATENTE = c.AUTO_PATENTE)
GROUP BY c.AUTO_PATENTE
GO

CREATE VIEW Automoviles_vendidos
AS
SELECT COUNT(c.COMPRA_NRO) cantidadCompra,COUNT(v.FACTURA_NRO) cantidadVendida,c.SUCURSAL_CODIGO,MONTH(v.FACTURA_FECHA) mes,YEAR(v.FACTURA_FECHA) anio
FROM GDD2020.COMPRAS c
JOIN GDD2020.VENTAS v ON (c.AUTO_PATENTE = v.AUTO_PATENTE)
GROUP BY c.SUCURSAL_CODIGO,MONTH(v.FACTURA_FECHA),YEAR(v.FACTURA_FECHA)
--M�xima cantidad de stock por cada sucursal

GO

CREATE VIEW Maximo_stock_por_sucursal
AS
SELECT MAX(CANT_COMPRADA) Max_Stock,s.SUCURSAL_CODIGO,SUCURSAL_DIRECCION,YEAR(COMPRA_FECHA) anio
FROM (SELECT COUNT(DISTINCT COMPRA_NRO) CANT_COMPRADA,SUCURSAL_CODIGO,COMPRA_FECHA FROM GDD2020.COMPRAS c GROUP BY SUCURSAL_CODIGO,COMPRA_FECHA) subq
JOIN GDD2020.BI_SUCURSAL s ON (s.SUCURSAL_CODIGO = subq.SUCURSAL_CODIGO)
GROUP BY s.SUCURSAL_CODIGO,SUCURSAL_DIRECCION,YEAR(COMPRA_FECHA)
