--CREACION DE LA BD
USE MASTER
GO
CREATE DATABASE CODIGOSOBRERUEDAS
GO
USE CODIGOSOBRERUEDAS
GO

--CREACION DE TABLAS
--USER
CREATE TABLE US (
ID_USER CHAR(5) NOT NULL PRIMARY KEY,
FIRST_NAME VARCHAR(100) NOT NULL,
LAST_NAME VARCHAR(100) NOT NULL,
EMAIL VARCHAR(200) UNIQUE NOT NULL,
PASSWORD VARCHAR (20) NOT NULL,
DNI CHAR(7) UNIQUE NOT NULL,
--ID_LEVEL
)
GO
--LEVEL
CREATE TABLE LEVEL(
ID_LEVEL CHAR(5) NOT NULL PRIMARY KEY,
NAME_LEVEL VARCHAR(20) NOT NULL,
)
GO
--PROFESSOR
CREATE TABLE PROFESSOR (
ID_PROFESSOR CHAR(5) NOT NULL PRIMARY KEY,
CELL_PHONE_NUMBER CHAR(9) NOT NULL,

)