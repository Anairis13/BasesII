USE [master]
GO
/****** Object:  Database [AdventureWorks_DW]    Script Date: 12/04/2018 19:33:01 ******/
CREATE DATABASE [AdventureWorks_DW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureWorks_DW', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks_DW.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AdventureWorks_DW_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\AdventureWorks_DW_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AdventureWorks_DW] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdventureWorks_DW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdventureWorks_DW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdventureWorks_DW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdventureWorks_DW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdventureWorks_DW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET RECOVERY FULL 
GO
ALTER DATABASE [AdventureWorks_DW] SET  MULTI_USER 
GO
ALTER DATABASE [AdventureWorks_DW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdventureWorks_DW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdventureWorks_DW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdventureWorks_DW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AdventureWorks_DW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdventureWorks_DW', N'ON'
GO
USE [AdventureWorks_DW]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] NOT NULL,
	[nameCustomer] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FechasDeCompra]    Script Date: 12/04/2018 19:33:01 ******/
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
PRIMARY KEY CLUSTERED 
(
	[idfechaCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hechos_Sales]    Script Date: 12/04/2018 19:33:01 ******/
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
 CONSTRAINT [PK__Hechos_S__9A2B5DE433A54118] PRIMARY KEY CLUSTERED 
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
/****** Object:  Table [dbo].[SalesOrderDetails]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesOrderDetails](
	[SalesOrderDetailD] [int] NOT NULL,
	[nameSales] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesOrderDetailD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[BusinessEntityID] [int] NOT NULL,
	[nameSalesPerson] [varchar](50) NULL,
	[Anos_X_Empleado] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalesTerritory]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SalesTerritory](
	[TerritoryID] [int] NOT NULL,
	[NameTerritorio] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ShipMethod]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ShipMethod](
	[ShipMethodID] [int] NOT NULL,
	[NameMethod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 12/04/2018 19:33:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stores](
	[BusinessEntityID] [int] NOT NULL,
	[NameStore] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([BusinessEntityID])
REFERENCES [dbo].[Stores] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([idfechaCompra])
REFERENCES [dbo].[FechasDeCompra] ([idfechaCompra])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([SalesOrderDetailD])
REFERENCES [dbo].[SalesOrderDetails] ([SalesOrderDetailD])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([SalesPersonID])
REFERENCES [dbo].[SalesPerson] ([BusinessEntityID])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([ShipMethodID])
REFERENCES [dbo].[ShipMethod] ([ShipMethodID])
GO
ALTER TABLE [dbo].[Hechos_Sales]  WITH CHECK ADD FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[SalesTerritory] ([TerritoryID])
GO
USE [master]
GO
ALTER DATABASE [AdventureWorks_DW] SET  READ_WRITE 
GO
