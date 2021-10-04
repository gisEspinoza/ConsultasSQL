USE Northwind;


SELECT City FROM Customers;
SELECT DISTINCT City, Country FROM Customers ORDER BY City, Country;

--CLAUSULA WHERE
SELECT * FROM Products;

SELECT ProductName, CategoryID, SupplierID
FROM Products
WHERE CategoryID=1 OR SupplierID=1  ORDER BY ProductName DESC;

--muestra el nombre del producto donde UnitsInStock es mayor a 5
SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock > 5;

--definiendo filtro con valores especificos
SELECT ProductName, CategoryID
FROM Products
WHERE CategoryID IN (1,3,7) ORDER BY CategoryID;


--between
SELECT ProductName,UnitsInStock  FROM Products WHERE UnitsInStock BETWEEN 1 AND 5 ORDER BY UnitsInStock DESC; 

--EJERCICIO: mostrar el CompanyName en orden descendente donde la City sea London de la tabla Customers
SELECT CompanyName,City FROM Customers WHERE City='London' ORDER BY CompanyName DESC;

--mostrar la cantidad de pedidos realizados por cliente por año
SELECT CustomerID, YEAR(OrderDate) OrderDate, COUNT(OrderID)
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate)
ORDER BY CustomerID;

SELECT CustomerID, OrderDate FROM Orders WHERE CustomerID='ALFKI' AND YEAR(OrderDate)='1997';

--EJERCICIO: Mostrar el CustomerID, ContactName de Customers agrupado por ciudad
--modificar el ejercicio anterior de tal manera que muestra la cantidad de clientes por ciudad
SELECT CustomerID, ContactName, City, COUNT(CustomerID) 'Clientes por Ciudad'
FROM Customers
GROUP BY CustomerID,ContactName, City;

--IS NOT NULL, se utiliza para que no muestre los datos cuyos valores sean NULOS
SELECT Region, COUNT(CustomerID) FROM Customers WHERE Region IS NOT NULL GROUP BY Region;
SELECT Region, COUNT(CustomerID) FROM Customers WHERE Region IS NULL GROUP BY Region;

--LIKE para manejo de strings
SELECT ContactName 
FROM Customers
WHERE ContactName LIKE 'A%'; --los nombres que inician con la letra A

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE '%no'; --los nombres que finalicen con no

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE 'A%o'; --los nombres que inicien con A y finalicen con o

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE 'A_e%'; --los nombres cuya primera letra sea A tercera letra sea e

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE '%es%'; --nombres cuyas letras centrales sean es

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE '[AE]%'; --nombres que inicien con letra A y E

SELECT ContactName 
FROM Customers
WHERE ContactName LIKE '[A-C]%' ORDER BY ContactName DESC; --nombres que inician con A hasta B