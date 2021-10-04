USE AdventureWorks;

--INNER JOIN (PRODUCTMODEL, PRODUCT)
--muestra los valores coincidentes en las tablas
SELECT
	p.Name, p.ProductNumber, pm.Name Modelo
FROM Production.Product p
INNER JOIN Production.ProductModel pm
ON p.ProductModelID = pm.ProductModelID;

--obtener los productos con las categorias y subcategorias
SELECT
	p.Name, ps.Name Subcategoria, pc.Name Categoria
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID;

--LEFT JOIN
--se obteienen los datos de la tabla a la izquierda
SELECT
	p.Name Producto, o.SalesOrderID ORDEN
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail o
ON p.ProductID = o.ProductID AND o.SalesOrderID=300
ORDER BY o.SalesOrderID DESC;



--RIGHT JOIN
--se obteienen los datos de la tabla a la derecha
SELECT
	o.SalesOrderID ORDEN, p.Name Producto
FROM Sales.SalesOrderDetail o
RIGHT JOIN Production.Product p
ON o.ProductID = p.ProductID
WHERE o.SalesOrderID IS NULL

--FULL JOIN
--se obteienen los datos de las tablas independiente si tiene o no coincidencias
SELECT
	od.SalesOrderID, p.Name, so.Description
FROM Production.Product p
FULL JOIN Sales.SalesOrderDetail od 
ON p.ProductID = od.ProductID
FULL JOIN Sales.SpecialOffer so
ON od.SpecialOfferID = so.SpecialOfferID;

--tablas: SalesOrderDetail, SpecialOffer, Product
--Product -> SalesOrderDetail  -> SpecialOffer
--      ProductID          SpecialOfferID


--CREACION DE VISTAS
CREATE VIEW ProductbyModel
AS
SELECT
	pm.Name Modelo, p.Name Producto
FROM Production.Product p
INNER JOIN Production.ProductModel pm
ON p.ProductModelID = pm.ProductModelID
GROUP BY pm.Name, p.Name;

--modificar vista
ALTER VIEW ProductbyModel
AS
SELECT
	pm.Name Modelo, p.Name Producto, p.ProductNumber Numero
FROM Production.Product p
INNER JOIN Production.ProductModel pm
ON p.ProductModelID = pm.ProductModelID
GROUP BY pm.Name, p.Name, p.ProductNumber;

--Borrar Vista
DROP VIEW ProductbyModel;

--consultar la vista
SELECT Modelo, Producto, Numero FROM ProductbyModel;