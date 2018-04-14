
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