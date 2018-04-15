


CREATE TABLE [dbo].[CLIENTES](
	[CLIENTE_ID] [int] NOT NULL PRIMARY KEY,
	[NOMBRE_CLIENTE] [varchar](50) NULL,
)


CREATE TABLE [dbo].[EMPLEADOS](
	[EMPLEADO_ID] [int] NOT NULL PRIMARY KEY,
	[NOMBRE_EMPLEADO] [varchar](50) NULL,
	[FECHA_CONTRATACION] [date] NULL,
)



CREATE TABLE [dbo].[FECHAS_COMPRAS](
	[FECHA_ID] [int] NOT NULL PRIMARY KEY,
	[FECHA_VENTA] [date] NULL,
	[DIA_VENTA] [int] NOT NULL,
	[MES_VENTA] [int] NOT NULL,
	[ANIO_VENTA] [int] NOT NULL,
	[FECHA_ENVIO] [date] NULL,
	[DIA_ENVIO] [int] NOT NULL,
	[MES_ENVIO] [int] NOT NULL,
	[ANIO_ENVIO] [int] NOT NULL,
)






 CREATE TABLE [dbo].[TERRITORIOS_VENTA](
	[TERRITORIO_ID] [int] NOT NULL PRIMARY KEY,
	[NOMBRE_TERRITORIO] [varchar](100) NOT NULL,
 )


 CREATE TABLE [dbo].[METODOS_DE_ENVIO](
	[METODO_ENVIO_ID] [int] NOT NULL PRIMARY KEY,
	[NOMBRE_METODO] [varchar](50) NOT NULL,
	[NOMBRE_COMPANIA] [varchar](50) NOT NULL,
 )

 CREATE TABLE [dbo].[TIENDAS](
	[ID_TIENDA] [int] NOT NULL PRIMARY KEY,
	[NOMBRE_TIENDA] [varchar](50) NOT NULL,
 )


CREATE TABLE [dbo].[Hechos_Ventas](
	[VENTA_ID] [int] NOT NULL PRIMARY KEY,
	[ID_TIENDA] [int] NOT NULL FOREIGN KEY references TIENDAS(ID_TIENDA),
	[CLIENTE_ID] [int] NOT NULL FOREIGN KEY references CLIENTES(CLIENTE_ID),
	[EMPLEADO_ID] [int] NOT NULL FOREIGN KEY references EMPLEADOS(EMPLEADO_ID),
	[TERRITORIO_ID] [int] NOT NULL FOREIGN KEY REFERENCES TERRITORIOS_VENTA(TERRITORIO_ID),
	[METODO_ENVIO_ID] [int] NOT NULL FOREIGN KEY REFERENCES METODOS_DE_ENVIO(METODO_ENVIO_ID) ,
	[FECHA_ID] [int] NOT NULL FOREIGN KEY references FECHAS_COMPRAS(FECHA_ID),
	[total_venta] [float] NOT NULL, 
	[total_productos_vendidos] [float] NOT NULL,

 )

 CREATE TABLE [dbo].[DETALLES_ORDEN_VENTA](
	[DETALLES_ORDEN_ID] [int] NOT NULL ,
	[VENTA_ID] [int] NOT NULL  ,
	[PRODUCTO_ID] [int] NOT NULL,
	[NOMBRE_PRODUCTO] [varchar](100) NOT NULL,
	[COLOR_PRODUCTO] [varchar](100) NOT NULL,
	[TALLA_PRODUCTO] [varchar](100) NOT NULL,
	[PRECIO_PRODUCTO] [money] NOT NULL,
	primary key(DETALLES_ORDEN_ID, VENTA_ID),
	CONSTRAINT fk_DETALLES_ORDEN_ID FOREIGN KEY (VENTA_ID) REFERENCES Hechos_Ventas(VENTA_ID)
	)