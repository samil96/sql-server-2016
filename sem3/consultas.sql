/*
SELECT / ALL / DISTINCT / TOP (EXPRESION)
(PERCENT) WITH TIES[LISTA DE SELCCION]
INTO FROM TABLA_ASOCIADA
WHERE [CONDICION]
GROUP BY
HAVING / ORDER BY AND / OR
*/
--ALIAS: GENERA UN NUEVO ENCABEZADO
--DE NOMBRE AL CAMPO DE LA TB
SELECT idCliente AS 'CODIGO ' , NombreContacto AS 'CLIENTE' FROM clientes

--ordenar
select * from clientes order by NombreContacto
SELECT NombreContacto FROM clientes ORDER BY NombreContacto

--predicados
--all: devuelve todos los campos de la tabla

select all * from clientes
select all * from detallesdepedidos

--top: devuelve cierto numero de registros
select top 500 * from detallesdepedidos

--top percent : muestra por porcentajes
select top 10 percent * from Empleados

--distinct: omite registros que contienen datos duplicados
select distinct PAIS from clientes

/*
operadores de comparacion:
>,>=,<=, =, <>
*/
--listar todos los registros de pais cuyo nobre pertenece a venezuela
select * from clientes where Pais='venezuela'

select * from productos where precioUnidad>30 and nombreProducto='pez espada'

--intervalos
-- campo [not] between valor 1 and valor 2
select * from productos where precioUnidad between 70 and 250 

select * from clientes where Pais in ('venezuela', 'argentina')

select * from clientes where Pais not in ('venezuela', 'argentina')

--coincidencia de patron
/*
%
-
[]
[]
*/

select IdEmpleado,Nombre, Apellidos from Empleados where Nombre like 'N%'

select IdEmpleado,Nombre, Apellidos from Empleados where Apellidos like '[A-G]%'

--funciones
--funcion replace: reemplaza las cadenas de texto 1 por la cadena texto 2
-- sintaxis: replace (string1, atring2, string3)

select replace ('all function', 'all','sql')

--funcion stuff: elimina una longitud de caracteres e inserta una cadena de indice
--sintaxis: stuff(string1, startindex, length, string2)

select stuff('sql tutotial',4,6,'function')

--funcion left reorna la parte de ado izquierdo
--sintaxis : left(string,integer)
select left('sistemasuni',3)

select right('sistemasuni',3)
--funcion replicate repiteuna cadena de texto
--sintaxis replicate(string,integer)
select replicate('uni'+space(1),10)

--funcion substring: reorna de una cadena de texto
--sintaxis: substring(string,starindex, integer)

select SUBSTRING('sqlserver',4,3)

--len: retorna el numero de caracteres de una cadena
--sintaxtis len(string)
select len('sistemasuni')

--reverse: convierte una cadena invertida
--sintaxis: reverse(string)
select reverse('sistemasuni')

--funcion lower: conviert una cadena a miniscula
--sintaxis: lower(STRING)
select lower('SISTEMAS')
select upper('uni')

--funcion ltrim: retorna una cadena despues de deliminar espacios
--sintaxis: ltrim(string), lado izquiedo, rtrim de lado derecho
select LTRIM('     base de datos')

--funcion fechas
--dateadd: agregar la suma de un intervalo a la fecha especificada
--ingresa una fecha especificada y que suma 30 años
declare @datenew datetime
set @datenew = '01-23-1970'
select DATEADD(YEAR,30,@datenew) as "nuevodato"

--datepart: devuelve la parte que pertenece una fecha

select datepart(year,'2021-03-06') as [año]

select idproducto, nombreProducto, precioUnidad from productos where 
precioUnidad >15 and precioUnidad <40

select idproducto, nombreProducto, precioUnidad from productos where 
idproducto in (1,2,3,4)

select idproducto, nombreProducto, precioUnidad from productos where 
idproducto not in (1,2,3,4)

select top 5 idproducto, nombreProducto, precioUnidad from productos
where idCategoria=1

--mostrar la ciudad del pais eeuu en la tb clientes

--mostrar el nombre y apellido de los empleados en sola columna
select Nombre + space(2) + Apellidos as datos from Empleados

--mosrar nombre producto, precio y unidads en existencia de los productos.
--cuyos precios sean menores a 50 oredneado por nombre
select nombreProducto, precioUnidad from productos
where precioUnidad < 50 order by 1 asc

select Nombre "PERSONAL", FechaContratacion "FECHA", 
YEAR(GETDATE()) - YEAR(FechaNacimiento) "EDAD"  from Empleados
where MONTH(FechaNacimiento)%2
<> 0 order by 2 asc

--modificar el nombre del producto
select * from productos update productos set nombreProducto='cerveza pilsen'
where idproducto=2

select * from productos

--aumetar en 10% los precios de los productos pertencen a categoria 1
update productos set precioUnidad=precioUnidad*1.10
where idCategoria=1
--mostrar una funcion de todos los pedidos
create function fn_pedidos()
	returns table
		as
			return(select * from Pedidos)
go


--suma 2 numeros
declare @num1 int, @num2 int, @s int
set @num1=10478
set @num2=15890
set @s=@num1+@num2
print @s

--funciones sql : lef, max, min, rand, y funciones de usuario begin 