
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
SELECT  ROW_NUMBER() OVER(ORDER BY OrderDate ASC) tiempoId, SalesOrderID,
		CONVERT(DATE, OrderDate) OrderDate, DATEPART(YEAR, OrderDate) AÑO, 
		DATEPART(MONTH, OrderDate) MES, DATEPART(DAY, OrderDate) DIA,
		CONVERT(DATE, ShipDate) ShipDate,DATEPART(YEAR, ShipDate) AÑO, 
		DATEPART(MONTH, ShipDate) MES, DATEPART(DAY, ShipDate) DIA 
FROM SALES.SalesOrderHeader ;