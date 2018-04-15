--------------------------CONSULTA CLIENTES--------------------------------------------------------

 SELECT A.CustomerID,
	   CONCAT(D.FirstName,' ',D.LastName) as NOMBRE_CLIENTE
FROM Sales.Customer A
INNER JOIN Sales.SalesTerritory B
	ON A.TerritoryID = B.TerritoryID
INNER JOIN Sales.Store C
	ON A.StoreID = C.BusinessEntityID
INNER JOIN Person.Person D
	ON A.PersonID = D.BusinessEntityID
ORDER BY A.CustomerID;



--------------------------CONSULTA EMPLEADOS--------------------------------------------------------

SELECT A.BusinessEntityID AS EMPLEADO_ID,CONCAT(FirstName,' ', B.LastName) AS NOMBRE_EMPLEADO, C.HireDate AS FECHA_CONTRATACION FROM SALES.SalesPerson A
INNER JOIN Person.Person B
ON(A.BusinessEntityID=B.BusinessEntityID)
INNER JOIN HumanResources.Employee C
ON (A.BusinessEntityID=C.BusinessEntityID);





------------------------------FECHAS_COMPRAS---------------------------------------------------------------
SELECT  SalesOrderID AS FECHA_ID,
		CONVERT(DATE, OrderDate) FECHA_VENTA, DATEPART(DAY, OrderDate) DIA_VENTA, 
		DATEPART(MONTH, OrderDate) MES_VENTA, DATEPART(YEAR, OrderDate) ANIO_VENTA,
		CONVERT(DATE, ShipDate) FECHA_ENVIO,DATEPART(DAY, ShipDate) DIA_ENVIO, 
		DATEPART(MONTH, ShipDate) MES_ENVIO, DATEPART(YEAR, ShipDate) AÑO_ENVIO
FROM SALES.SalesOrderHeader ;





----------------------------ORDEN_DETALLES_VENTAS------------------------------------------------------------

SELECT  B.SalesOrderDetailID AS DETALLE_ORDEN_ID,
		B.SalesOrderID AS VENTA_ID,
        a.ProductID AS PRODUCTO_ID,
		A.Name AS NOMBRE_PRODUCTO, 
		A.Color AS COLOR_PRODUCTO, 
		A.Size AS TALLA_PRODUCTO, 
		B.UnitPrice AS PRECIO_PRODUCTO
FROM Production.Product A
INNER JOIN Sales.SalesOrderDetail B
ON A.ProductID = B.ProductID;





------------------------------TERRITORIOS------------------------------------------------------------------------------------
SELECT TerritoryID AS TERRITORIO_ID,
	   Name AS NOMBRE_TERRITORIO
FROM Sales.SalesTerritory ;





-----------------------------METODOS_DE_ENVIO--------------------------------------------------------------------------------

select  C.ShipMethodID AS METODO_ID,  C.name AS NOMBRE_METODO, D.Name AS NOMBRE_COMPANIA from Purchasing.PurchaseOrderDetail A
  inner join Purchasing.PurchaseOrderHeader B
  on A.PurchaseOrderID = B.PurchaseOrderID
  inner join Purchasing.ShipMethod C
  on B.ShipMethodID = C.ShipMethodID 
  inner join Purchasing.Vendor D
  on D.BusinessEntityID = B.VendorID






  -------------------------------TIENDAS----------------------------------------------------------------------------------
select A.BusinessEntityID TIENDA_ID, A.Name AS NOMBRE_TIENDA from Sales.Store A








-------------------------------HECHOS_VENTAS---------------------------------------------------------------------------
WITH A AS (
		select B.SalesOrderID, A.TotalDue as TOTAL_VENTA,SUM(B.OrderQty) AS TOTAL_PRODUCTOS_VENDIDOS from 
		SALES.SalesOrderHeader a
		inner join SALES.SalesOrderDetail b
		on (b.SalesOrderID=a.SalesOrderID)
		GROUP BY B.SalesOrderID,A.TotalDue
),
 B AS
(
  SELECT A.SalesOrderID, A.CustomerID AS CLIENTE_ID,A.SalesPersonID AS EMPLEADO_ID, C.BusinessEntityID AS TIENDA_ID ,A.TerritoryID AS TERRITORIO_ID, A.ShipMethodID AS METODO_ENVIO_ID FROM 
  SALES.SalesOrderHeader A
  INNER JOIN SALES.Customer B
  ON (A.CustomerID=B.CustomerID)
  INNER JOIN SALES.STORE C
  ON (B.StoreID= C.BusinessEntityID)
)
SELECT A.SalesOrderID AS VENTA_ID,   B.TIENDA_ID, B.CLIENTE_ID, B.EMPLEADO_ID, B.TERRITORIO_ID, B.METODO_ENVIO_ID,  A.SalesOrderID as FECHA_ID, A.TOTAL_VENTA, A.TOTAL_PRODUCTOS_VENDIDOS
FROM A,B
WHERE A.SalesOrderID=B.SalesOrderID;
