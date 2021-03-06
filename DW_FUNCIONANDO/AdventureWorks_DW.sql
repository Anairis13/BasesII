USE AdventureWorks_DW



CREATE TABLE [dbo].[CLIENTES](
	[CLIENTE_ID] [int] NOT NULL,
	[NOMBRE_CLIENTE] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CLIENTE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]




CREATE TABLE [dbo].[EMPLEADOS](
	[EMPLEADO_ID] [int] NOT NULL,
	[NOMBRE_EMPLEADO] [nvarchar](100) NOT NULL,
	[FECHA_CONTRATACION][nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[EMPLEADO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[FECHAS_VENTAS](
	[FECHA_ID] [int] NOT NULL ,
	[FECHA_VENTA] [date] NULL,
	[DIA_VENTA] [int] NOT NULL,
	[MES_VENTA] [int] NOT NULL,
	[ANIO_VENTA] [int] NOT NULL,
	[FECHA_ENVIO] [date] NULL,
	[DIA_ENVIO] [int] NOT NULL,
	[MES_ENVIO] [int] NOT NULL,
	[ANIO_ENVIO] [int] NOT NULL,


 CONSTRAINT [PK_fechas_compras] PRIMARY KEY CLUSTERED 
(
	[FECHA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



CREATE TABLE [dbo].[TERRITORIOS_VENTA](
	[TERRITORIO_ID] [int] NOT NULL,
	[NOMBRE_TERRITORIO] [nvarchar](100) NOT NULL,



 CONSTRAINT [PK_Territorios] PRIMARY KEY CLUSTERED 
(
	[TERRITORIO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



 CREATE TABLE [dbo].[METODOS_DE_ENVIO](
	[METODO_ENVIO_ID] [int] NOT NULL,
	[NOMBRE_METODO] [nvarchar](100) NOT NULL,
  CONSTRAINT [PK_metodos_envio] PRIMARY KEY CLUSTERED 
(
	[METODO_ENVIO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



 CREATE TABLE [dbo].[TIENDAS](
	[ID_TIENDA] [int] NOT NULL,
	[NOMBRE_TIENDA] [nvarchar](100) NOT NULL,
 
 CONSTRAINT [PK_tiendas] PRIMARY KEY CLUSTERED 
(
	[ID_TIENDA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]




  CREATE TABLE [dbo].[DETALLES_ORDEN_VENTA](
	[DETALLES_ORDEN_ID] [int] NOT NULL ,
 CONSTRAINT [PK_detalles] PRIMARY KEY CLUSTERED 
(
	[DETALLES_ORDEN_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]





CREATE TABLE [dbo].[Hechos_Ventas](
	[VENTA_ID] [int] NOT NULL ,
	[ID_TIENDA] [int] NOT NULL,
	[CLIENTE_ID] [int] NOT NULL,
	[EMPLEADO_ID] [int] NOT NULL ,
	[TERRITORIO_ID] [int] NOT NULL ,
	[METODO_ENVIO_ID] [int] NOT NULL,
	[FECHA_ID] [int] NOT NULL,
	[DETALLES_VENTA_ID] [int] NOT NULL,
	[total_venta] [float] NOT NULL, 
	[total_productos_vendidos] [float] NOT NULL,


 CONSTRAINT [PK_Hechos_Ventas] PRIMARY KEY CLUSTERED 
(
	[VENTA_ID] ASC,
	[ID_TIENDA] ASC,
	[CLIENTE_ID] ASC,
	[EMPLEADO_ID] ASC,
	[TERRITORIO_ID] ASC,
	[METODO_ENVIO_ID] ASC,
	[FECHA_ID] ASC,
	[DETALLES_VENTA_ID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX [EMPLEADO_ID] ON [dbo].[Hechos_Ventas] 
(
	[EMPLEADO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]



GO
CREATE NONCLUSTERED INDEX [ID_TIENDA] ON [dbo].[Hechos_Ventas] 
(
	[ID_TIENDA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


GO
CREATE NONCLUSTERED INDEX [CLIENTE_ID] ON [dbo].[Hechos_Ventas] 
(
	[CLIENTE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX [TERRITORIO_ID] ON [dbo].[Hechos_Ventas] 
(
	[TERRITORIO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]



GO
CREATE NONCLUSTERED INDEX [METODO_ENVIO_ID] ON [dbo].[Hechos_Ventas] 
(
	[METODO_ENVIO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX [FECHA_ID] ON [dbo].[Hechos_Ventas] 
(
	[FECHA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX [DETALLES_VENTA_ID] ON [dbo].[Hechos_Ventas] 
(
	[DETALLES_VENTA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([ID_TIENDA])
REFERENCES [dbo].[TIENDAS] ([ID_TIENDA])

GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([CLIENTE_ID])
REFERENCES [dbo].[CLIENTES] ([CLIENTE_ID])

GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([EMPLEADO_ID])
REFERENCES [dbo].[EMPLEADOS] ([EMPLEADO_ID])

GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([TERRITORIO_ID])
REFERENCES [dbo].[TERRITORIOS_VENTA] ([TERRITORIO_ID])
GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([METODO_ENVIO_ID])
REFERENCES [dbo].[METODOS_DE_ENVIO] ([METODO_ENVIO_ID])

GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([FECHA_ID])
REFERENCES [dbo].[FECHAS_VENTAS] ([FECHA_ID])

GO
ALTER TABLE [dbo].[Hechos_Ventas]  WITH CHECK ADD FOREIGN KEY([DETALLES_VENTA_ID])
REFERENCES [dbo].[DETALLES_ORDEN_VENTA] ([DETALLES_ORDEN_ID])
