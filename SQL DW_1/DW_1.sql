
CREATE TABLE [dbo].[Person](
	BusinessEntityID [int] NOT NULL PRIMARY KEY,
	[First Name] [varchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
 )

CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL PRIMARY KEY,
	[Person_ID] [int] NOT NULL FOREIGN KEY REFERENCES Person(BusinessEntityID),
)


CREATE TABLE [dbo].[Employees](
	[BusinessEntityID] [int] NOT NULL PRIMARY KEY REFERENCES Person(BusinessEntityID),
)

CREATE TABLE [dbo].[SalesPerson](
	[BusinessEntityID] [int] NOT NULL PRIMARY KEY REFERENCES Employees(BusinessEntityID),
)


CREATE TABLE [dbo].[FechasDeCompra](
	[idfechaCompra] [int] NOT NULL PRIMARY KEY,
	[Dia] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[Hora] [int] NOT NULL,
)


CREATE TABLE [dbo].[SalesOrderDetails](
	[SalesOrderDetailD] [int] NOT NULL PRIMARY KEY,
 )


 CREATE TABLE [dbo].[SalesTerritory](
	[TerritoryID] [int] NOT NULL PRIMARY KEY,
	[Name] [varchar](100) NOT NULL,
 )


 CREATE TABLE [dbo].[ShipMethod](
	[ShipMethodID] [int] NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
 )

 CREATE TABLE [dbo].[Stores](
	[BusinessEntityID] [int] NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NOT NULL,
 )


CREATE TABLE [dbo].[Hechos_Sales](
	[SalesOrdersID] [int] NOT NULL PRIMARY KEY,
	[SalesOrderDetailD] [int] NOT NULL FOREIGN KEY REFERENCES SalesOrderDetails(SalesOrderDetailD) ,
	[BusinessEntityID] [int] NOT NULL FOREIGN KEY references Stores(BusinessEntityID),
	[CustomerID] [int] NOT NULL FOREIGN KEY references Customer(CustomerID),
	[SalesPersonID] [int] NOT NULL FOREIGN KEY REFERENCES SalesPerson(BusinessEntityID),
	[TerritoryID] [int] NOT NULL FOREIGN KEY REFERENCES SalesTerritory(TerritoryID),
	[ShipMethodID] [int] NOT NULL FOREIGN KEY REFERENCES ShipMethod(ShipMethodID) ,
	[idfechaCompra] [int] NOT NULL FOREIGN KEY references FechasDeCompra(idfechaCompra),
	[total_venta] [float] NOT NULL, 
	[total_productos_vendidos] [float] NOT NULL,
 )








