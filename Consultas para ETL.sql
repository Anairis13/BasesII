
--CONSULTA PARA TABLA EMPLEADOS----------------------------------------------------------------------
SELECT A.BusinessEntityID,FirstName, B.LastName, C.HireDate FROM SALES.SalesPerson A
INNER JOIN Person.Person B
ON(A.BusinessEntityID=B.BusinessEntityID)
INNER JOIN HumanResources.Employee C
ON (A.BusinessEntityID=C.BusinessEntityID);

--CONSULTA PARA LOS CLIENTES------------------------------------------------------------------------
SELECT A.CustomerID,
	   D.FirstName,
	   D.LastName,
	   D.Title,
	   C.Name as Store,
	   B.Name as Territory,
	   A.AccountNumber 
FROM Sales.Customer A
INNER JOIN Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID
INNER JOIN Sales.Store C
	ON A.StoreID = C.BusinessEntityID
INNER JOIN Person.Person D
	ON A.PersonID = D.BusinessEntityID
ORDER BY A.CustomerID;