--REALIZACION DEL DEMO3_SEM2
USE MASTER
GO
CREATE DATABASE DEMO3_SEM2
GO
USE DEMO3_SEM2
GO

CREATE TABLE CATEGORIA(
IDCAT CHAR(5) NOT NULL,
DESCAR VARCHAR(100) NOT NULL,
PRIMARY KEY (IDCAT)
)
GO

CREATE TABLE PROVEEDOR(
IDPROV CHAR(5) NOT NULL PRIMARY KEY,
NOMBREPROV VARCHAR(30) NOT NULL,
RUCPROV VARCHAR(11) NOT NULL DEFAULT('999999999'),
UNIQUE (NOMBREPROV),
CHECK (RUCPROV LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO
--RELACIONA MI TABLA CATEGORIA, PROVEEDOR Y PRODUCTO
CREATE TABLE PROCUTO(
IDPROD CHAR(5) NOT NULL PRIMARY KEY,
NOMPROD VARCHAR(40) NOT NULL,
MARCAPROD VARCHAR(40) UNIQUE,
IDCAT CHAR(5),
IDPROV CHAR(5),
PREUNI DECIMAL NOT NULL,
STOCK INT NOT NULL,
FOREIGN KEY (IDCAT) REFERENCES CATEGORIA,
FOREIGN KEY (IDPROV) REFERENCES PROVEEDOR,
CHECK(PREUNI>=5),
CHECK (STOCK BETWEEN 1 AND 500)
)

--INDICE
--RESTRICCIONES TIENE 210 A 230 PAG (BUWCA TAL PAGIN)
/*
SINTAXIS
UNIQUE - CLUSTERED - NONCLUSTERED (BUSQUEDAS)
CREATE INDEX ON TABLE (VISTA-ASC-DESC)
INCLUDE-
WITH
	FILLFACTOR
	ON SCHEMA_PARTICION()COLUNAS(TB) - FILEGROUP
*/

/*
INDICE CLUSTER: ORDENA Y ALMACENA
INDICE UNICO: CONTIENE CLAVE (UNIQUE)
INDICES NO CLUSTER: DEFINIR CAMPOS PARA TIPO TABLA RELACION

*/
--NOTA: ANTES DE LLENAR DATOS SE DEBE CREAR LOS INDICES
--GENERAR UN INDICE QUE BUSCA POR RUCPROV Y SU NOMBRE DEL PROV
CREATE INDEX IDX_RUCPROV ON [dbo].[PROVEEDOR] ([RUCPROV],[NOMBREPROV])

--CREAR INDICE QUE BUSCA POR PRECIO UNIARIO, INCLUYA CODIGO PRODUCTO, NOMBRE Y MARCA
CREATE INDEX IDX_PRENOMMAR ON [dbo].[PROCUTO]([NOMPROD])
INCLUDE ([IDPROD],[MARCAPROD])

CREATE INDEX IDX_PRECIOUNI ON [dbo].[PROCUTO]([PREUNI]) 
INCLUDE ([IDPROD],[NOMPROD],[MARCAPROD])

--INDICE QUE BUSCA POR MARCA DEL PRODUCTO, DONDE EL PORCENTAJE SEA A 70
CREATE INDEX IDX_MARCA ON [dbo].[PROCUTO]([MARCAPROD]) WITH (FILLFACTOR=70)

--INDICE QUE DEFINA AL RUC EL CODIGO DEL PROVEEDOR
CREATE NONCLUSTERED INDEX IDX_PROVEEDOR ON [dbo].[PROVEEDOR]([RUCPROV])
INCLUDE ([IDPROV])

--VISUALIZAR LOS INDICES
SELECT * FROM SYS.indexes WHERE NAME LIKE 'IDX%'

--ingresar registros
select * from CATEGORIA
select * from PROCUTO
select * from PROVEEDOR

INSERT INTO CATEGORIA VALUES (12345, 'EDUCACION')
INSERT INTO CATEGORIA VALUES (6789, 'TELECOMUNICACIONES')

INSERT INTO PROVEEDOR (IDPROV,NOMBREPROV,RUCPROV) VALUES ('SIUNI','SISTEMAS UNI',12345678911)
INSERT INTO PROVEEDOR (IDPROV,NOMBREPROV,RUCPROV) VALUES ('EN167','ENTEL',90654312260)

INSERT INTO PROCUTO VALUES ('LINEA','INTERNET','ENTEL PERU',6789,'EN167',74.9,10)
INSERT INTO PROCUTO VALUES ('CUR21','CURSO','UNI',12345,'SIUNI',300,20)