
--CONSULTA PARA TABLA EMPLEADOS----------------------------------------------------------------------
SELECT A.BusinessEntityID,FirstName, B.LastName, C.HireDate FROM SALES.SalesPerson A
INNER JOIN Person.Person B
ON(A.BusinessEntityID=B.BusinessEntityID)
INNER JOIN HumanResources.Employee C
ON (A.BusinessEntityID=C.BusinessEntityID);

--CONSULTA PARA LOS CLIENTES------------------------------------------------------------------------
SELECT A.CustomerID,
	   B.FirstName,
	   B.LastName,
FROM Sales.Customer A
INNER JOIN Person.Person B
	ON A.PersonID = B.BusinessEntityID
ORDER BY A.CustomerID;

--CONSULTA PARA LOS TERRITORIOS------------------------------------------------------------------------
SELECT TerritoryID,
	   Name
FROM Sales.SalesTerritory ;

--CONSULTA DEL TIEMPO---------------------------------------------------------------------------
SELECT  SalesOrderID,
		CONVERT(DATE, OrderDate) OrderDate, DATEPART(DAY, OrderDate) DIA, 
		DATEPART(MONTH, OrderDate) MES, DATEPART(YEAR, OrderDate) AÑO,
		CONVERT(DATE, ShipDate) ShipDate,DATEPART(DAY, ShipDate) DIA, 
		DATEPART(MONTH, ShipDate) MES, DATEPART(YEAR, ShipDate) AÑO 
FROM SALES.SalesOrderHeader ;
--CONSULTA PARA DETALLES DE ORDEN DE VENTA------------------------------------------------------------------
SELECT  B.SalesOrderDetailID AS DETALLE_ORDEN_ID, 
		A.Name AS NOMBRE_PRODUCTO, 
		A.Color AS COLOR, 
		A.Size AS TALLA_PRODUCTO, 
		B.UnitPrice AS PRECIO
FROM Production.Product A
INNER JOIN Sales.SalesOrderDetail B
	ON A.ProductID = B.ProductID;
