USE [master]
GO
/****** Object:  Database [ÁdventureWorks_DW]    Script Date: 27/03/2018 22:11:27 ******/
CREATE DATABASE [ÁdventureWorks_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ÁdventureWorks_DW', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ÁdventureWorks_DW.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ÁdventureWorks_DW_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ÁdventureWorks_DW_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ÁdventureWorks_DW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ÁdventureWorks_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET  MULTI_USER 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ÁdventureWorks_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ÁdventureWorks_DW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ÁdventureWorks_DW', N'ON'
GO
USE [ÁdventureWorks_DW]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[BusinessEntityID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FechasDeCompra]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FechasDeCompra](
	[idfechaCompra] [int] NOT NULL,
	[Dia] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[Hora] [int] NOT NULL,
 CONSTRAINT [PK_FechasDeCompra] PRIMARY KEY CLUSTERED 
(
	[idfechaCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hechos_Sales]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hechos_Sales](
	[SalesOrdersID] [int] NOT NULL,
	[SalesOrderDetailD] [int] NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesPersonID] [int] NOT NULL,
	[TerritoryID] [int] NOT NULL,
	[ShipMethodID] [int] NOT NULL,
	[idfechaCompra] [int] NOT NULL,
	[total_venta] [float] NOT NULL,
	[total_productos_vendidos] [float] NOT NULL,
 CONSTRAINT [PK_Hechos_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesOrdersID] ASC,
	[SalesOrderDetailD] ASC,
	[BusinessEntityID] ASC,
	[CustomerID] ASC,
	[SalesPersonID] ASC,
	[TerritoryID] ASC,
	[ShipMethodID] ASC,
	[idfechaCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[BusinessEntityID
BusinessEntityID
BusinessEntityID
SalesOrdersID
SalesOrdersID]]] [int] NOT NULL,
	[First Name] [varchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID
BusinessEntityID
BusinessEntityID
SalesOrdersID
SalesOrdersID]]] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderDetails](
	[SalesOrderDetailD] [int] NOT NULL,
 CONSTRAINT [PK_SalesOrderDetails_1] PRIMARY KEY CLUSTERED 
(
	[SalesOrderDetailD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[SalesPersonID] [int] NOT NULL,
 CONSTRAINT [PK_SalesPerson] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesTerritory]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesTerritory](
	[TerritoryID] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SalesTerritory] PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipMethod]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipMethod](
	[ShipMethodID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ShipMethod] PRIMARY KEY CLUSTERED 
(
	[ShipMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 27/03/2018 22:11:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stores](
	[BusinessEntityID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_Customer]    Script Date: 27/03/2018 22:11:28 ******/
CREATE NONCLUSTERED INDEX [IX_Customer] ON [dbo].[Customer]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesOrderDetails]    Script Date: 27/03/2018 22:11:28 ******/
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetails] ON [dbo].[SalesOrderDetails]
(
	[SalesOrderDetailD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalesOrderDetails_1]    Script Date: 27/03/2018 22:11:28 ******/
CREATE NONCLUSTERED INDEX [IX_SalesOrderDetails_1] ON [dbo].[SalesOrderDetails]
(
	[SalesOrderDetailD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Person] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Person] ([BusinessEntityID
BusinessEntityID
BusinessEntityID
SalesOrdersID
SalesOrdersID]]])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Person]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_Customer]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_FechasDeCompra] FOREIGN KEY([idfechaCompra])
REFERENCES [dbo].[FechasDeCompra] ([idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_FechasDeCompra]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_Hechos_Sales1] FOREIGN KEY([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
REFERENCES [dbo].[Hechos_Sales] ([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_Hechos_Sales1]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_Hechos_Sales2] FOREIGN KEY([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
REFERENCES [dbo].[Hechos_Sales] ([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_Hechos_Sales2]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_Hechos_Sales3] FOREIGN KEY([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
REFERENCES [dbo].[Hechos_Sales] ([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_Hechos_Sales3]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_Hechos_Sales4] FOREIGN KEY([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
REFERENCES [dbo].[Hechos_Sales] ([SalesOrdersID], [SalesOrderDetailD], [BusinessEntityID], [CustomerID], [SalesPersonID], [TerritoryID], [ShipMethodID], [idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_Hechos_Sales4]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_SalesPerson] FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPerson] ([SalesPersonID])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_SalesPerson]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_SalesTerritory] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[SalesTerritory] ([TerritoryID])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_SalesTerritory]
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD  CONSTRAINT [FK_Hechos_Sales_ShipMethod] FOREIGN KEY([ShipMethodID])
REFERENCES [dbo].[ShipMethod] ([ShipMethodID])
GO
ALTER TABLE [dbo].[Hechos_Sales] CHECK CONSTRAINT [FK_Hechos_Sales_ShipMethod]
GO
ALTER TABLE [dbo].[SalesOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderDetails_SalesOrderDetails1] FOREIGN KEY([SalesOrderDetailD])
REFERENCES [dbo].[SalesOrderDetails] ([SalesOrderDetailD])
GO
ALTER TABLE [dbo].[SalesOrderDetails] CHECK CONSTRAINT [FK_SalesOrderDetails_SalesOrderDetails1]
GO
USE [master]
GO
ALTER DATABASE [ÁdventureWorks_DW] SET  READ_WRITE 
GO
