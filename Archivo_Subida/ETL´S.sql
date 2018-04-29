--------------------------CONSULTA CLIENTES--------------------------------------------------------

SELECT A.CustomerID AS CLIENTE_ID,
	   CONCAT(D.FirstName,' ',D.LastName) AS NOMBRE_CLIENTE
FROM Sales.Customer A
INNER JOIN Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID
INNER JOIN Sales.Store C
	ON A.StoreID = C.BusinessEntityID
INNER JOIN Person.Person D
	ON A.PersonID = D.BusinessEntityID
ORDER BY A.CustomerID;


--------------------------CONSULTA EMPLEADOS--------------------------------------------------------

SELECT A.BusinessEntityID AS EMPLEADO_ID,CONCAT(FirstName,' ', B.LastName) AS NOMBRE_EMPLEADO, 
       C.HireDate AS FECHA_CONTRATACION 
FROM SALES.SalesPerson A
INNER JOIN Person.Person B
	ON(A.BusinessEntityID = B.BusinessEntityID)
INNER JOIN HumanResources.Employee C
	ON (A.BusinessEntityID = C.BusinessEntityID);


-------------------------------------------------CONSUTA VENTAS_ORDENES_DETALLES-----------------------------------
SELECT 
	SalesOrderID AS DETALLE_ORDEN_ID
FROM Sales.SalesOrderHeader
WHERE CustomerID != '' AND SalesPersonID != '';


------------------------------FECHAS_COMPRAS---------------------------------------------------------------
SELECT  SalesOrderID AS FECHA_ID,
		CONVERT(DATE, OrderDate) FECHA_VENTA, DATEPART(DAY, OrderDate) DIA_VENTA, 
		DATEPART(MONTH, OrderDate) MES_VENTA, DATEPART(YEAR, OrderDate) ANIO_VENTA,
		CONVERT(DATE, ShipDate) FECHA_ENVIO,DATEPART(DAY, ShipDate) DIA_ENVIO, 
		DATEPART(MONTH, ShipDate) MES_ENVIO, DATEPART(YEAR, ShipDate) AÑO_ENVIO
FROM SALES.SalesOrderHeader 
WHERE CustomerID != '' AND SalesPersonID != '';


------------------------------TERRITORIOS------------------------------------------------------------------------------------
SELECT TerritoryID AS TERRITORIO_ID,
	   Name AS NOMBRE_TERRITORIO
FROM Sales.SalesTerritory ;


-----------------------------METODOS_DE_ENVIO--------------------------------------------------------------------------------

SELECT C.ShipMethodID AS METODO_ID,  
	   C.name AS NOMBRE_METODO 
FROM Purchasing.PurchaseOrderDetail A
INNER JOIN Purchasing.PurchaseOrderHeader B
	ON A.PurchaseOrderID = B.PurchaseOrderID
INNER JOIN Purchasing.ShipMethod C
	ON B.ShipMethodID = C.ShipMethodID 
GROUP BY C.ShipMethodID, C.name;


  -------------------------------TIENDAS----------------------------------------------------------------------------------
SELECT A.BusinessEntityID TIENDA_ID, 
	   A.Name AS NOMBRE_TIENDA
FROM Sales.Store A;


-------------------------------HECHOS_VENTAS---------------------------------------------------------------------------
WITH A AS (
			SELECT B.SalesOrderID, A.TotalDue AS TOTAL_VENTA,SUM(B.OrderQty) AS TOTAL_PRODUCTOS_VENDIDOS 
			FROM SALES.SalesOrderHeader A
			INNER JOIN SALES.SalesOrderDetail B
			ON (B.SalesOrderID = A.SalesOrderID)
			GROUP BY B.SalesOrderID, A.TotalDue
			),
 	 B AS (
  			SELECT A.SalesOrderID, A.CustomerID AS CLIENTE_ID,
  					 A.SalesPersonID AS EMPLEADO_ID, 
  					 C.BusinessEntityID AS TIENDA_ID,
  					 A.TerritoryID AS TERRITORIO_ID, 
  					 A.ShipMethodID AS METODO_ENVIO_ID 
  			FROM SALES.SalesOrderHeader A
  			INNER JOIN SALES.Customer B
  				ON (A.CustomerID = B.CustomerID)
  			INNER JOIN SALES.STORE C
  				ON (B.StoreID = C.BusinessEntityID)
			)
SELECT A.SalesOrderID AS VENTA_ID,
	   B.TIENDA_ID, 
	   B.CLIENTE_ID, 
	   B.EMPLEADO_ID, 
	   B.TERRITORIO_ID, 
	   B.METODO_ENVIO_ID,  
	   A.SalesOrderID AS FECHA_ID, 
	   A.SalesOrderID AS DETALLES_VENTA_ID, 
	   A.TOTAL_VENTA, 
	   A.TOTAL_PRODUCTOS_VENDIDOS
FROM A,B
WHERE A.SalesOrderID = B.SalesOrderID;
