
--CONSULTA PARA TABLA EMPLEADOS----------------------------------------------------------------------
SELECT A.BusinessEntityID,FirstName, B.LastName, C.HireDate FROM SALES.SalesPerson A
INNER JOIN Person.Person B
ON(A.BusinessEntityID=B.BusinessEntityID)
INNER JOIN HumanResources.Employee C
ON (A.BusinessEntityID=C.BusinessEntityID);