--funciones de agregación
--retornan uno o mas valores, se utiliza 
--normalmente con Group By, Having
--avg, count, max, min, sum...etc

USE Northwind;

--AVG(), precio promedio del precio unitario de productos
SELECT
AVG(UnitPrice) PrecioPromedio
FROM
 Products;

 --redondear el valor promedio
 --CAST() convertir el resultao a decimal
 --ROUND() permite redondear un numero
SELECT
  CAST(ROUND(AVG(UnitPrice),2) AS DEC(10,2))
  PrecioPromedio
FROM
 Products;

 --COUNT()
SELECT
	COUNT(*) CantidadProductos
FROM
	Products
WHERE UnitPrice > 15;

--MAX() MIN()
SELECT
	MAX(UnitPrice) PrecioMaximo
FROM
	Products;

SELECT
	MIN(UnitPrice) PrecioMinimo
FROM
	Products;

--SUM()
SELECT
	ProductID,
	SUM(Quantity) Cantidad
FROM
	[Order Details]
GROUP BY
	ProductID
ORDER BY 
	Cantidad DESC;


--EJERCICIO 1: MOSTRAR LA CANTIDAD DE EMPLEADOS POR CIUDAD
--EJERCICIO 2: MOSTRAR EL NOMBRE DEL PRODUCTO CON EL PRECIO MAS BAJO
 SELECT
	ProductID, ProductName, UnitPrice
FROM
	Products
WHERE 
	UnitPrice=(SELECT MIN(UnitPrice) FROM Products);


--FUNCIONES DE FECHA
SELECT
	MONTH(OrderDate) mes, OrderID
FROM
	Orders
WHERE
	YEAR(OrderDate) = 1997
GROUP BY
	MONTH(OrderDate), OrderID;

--DATEDIFF() obtener la diferencia entre rangos de fecha
SELECT
	OrderID, CustomerID, DATEDIFF(day, OrderDate, ShippedDate) Dias
FROM Orders;

--CALCULAR LA EDAD DEL EMPLEADO A PARTIR DE LA FECHA NACIMIENTO
SELECT
	EmployeeID, FirstName, YEAR(BirthDate) "Año de Nacimiento",
	DATEDIFF(year, BirthDate, GETDATE()) Edad
FROM Employees;

--CURRENT_TIMESTAMP--devolver el tiempo actual del SO del servidor
SELECT CURRENT_TIMESTAMP AS "Tiempo actual";

--tabla ejemplo, con valor predeterminado de fecha
CREATE TABLE log
(
	id INT IDENTITY,
	mensaje VARCHAR(100) NOT NULL,
	fechaCreacion DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP
	PRIMARY KEY(ID)
);

INSERT INTO log(mensaje) VALUES ('Segundo mensaje');
SELECT * FROM log;

--DATEADD()
SELECT 
	DATEADD(day, 1, GETDATE()) resultado;

--EJERCICIO mostrar la fecha estimada de entrega de una orden
--con 2 dias despues de realizada la orden para las ordenes
--cuyo ShippedDate sea NULL
SELECT
	OrderID, CustomerID, OrderDate,
	DATEADD(day,2, OrderDate) "Fecha estimada de entrega"
FROM
	Orders
WHERE
	ShippedDate IS NULL;

--DATEPART()-extrae las partes de un campo fecha
SELECT
	DATEPART(year,OrderDate) año,
	DATEPART(month,OrderDate) mes,
	DATEPART(day,OrderDate) dia
FROM
Orders

--FUNCIONES PARA MANEJO DE STRINGS
--CONCAT()--para unir dos o mas cadenas
SELECT 'Carmen' + ' ' + 'Flores' AS nombreCompleto;

SELECT
	EmployeeID, CONCAT(FirstName, ' ', LastName) NombreCompleto
FROM
	Employees;


SELECT
	EmployeeID, CONCAT_WS(', ',FirstName, LastName) NombreCompleto
FROM
	Employees;

SELECT
	EmployeeID, UPPER(CONCAT(FirstName, ' ', LastName)) NombreCompleto
FROM
	Employees;

--LEFT--extrea un numero determinado de caracteres del lado izquierdo
--de una cadena
SELECT LEFT('Admon de Bases de Datos I', 5);

--EJERCICIO: extraer las primeros 5 caracteres del nombre del producto
--EJERCICIO: mostrar la cantidad de productos que inician
-- con las letras del alfabeto... A -5 , B-3

SELECT
	LEFT(ProductName,1),
	COUNT(ProductName) Cantidad
FROM
	Products
GROUP BY
	LEFT(ProductName,1);


--LEN, obteiene la cantidad de caracteres de una cadena
SELECT
	LOWER(ProductName), LEN(ProductName) Tamaño
FROM
	Products
ORDER BY  LEN(ProductName) DESC;

