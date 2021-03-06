SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Articulo](
	[ArticuloId] [int] IDENTITY(1,1) NOT NULL,
	[ArticuloNombre] [varchar](50) NOT NULL,
	[ArticuloDescripcion] [varchar](1) NULL,
	[ArticuloValor] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArticuloId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/27/2018 2:20:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteCedula] [int] NOT NULL,
	[ClienteNombre] [varchar](50) NOT NULL,
	[ClienteDireccion] [varchar](100) NOT NULL,
	[ClienteTelefono] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Factura_Detalle]    Script Date: 11/27/2018 2:20:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Detalle](
	[Factura_DetalleId] [int] IDENTITY(1,1) NOT NULL,
	[Factura_EncabezadoId] [int] NOT NULL,
	[Factura_DetalleCantidad] [int] NOT NULL,
	[ArticuloId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Factura_DetalleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura_Encabezado]    Script Date: 11/27/2018 2:20:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura_Encabezado](
	[Factura_EncabezadoId] [int] IDENTITY(1,1) NOT NULL,
	[Factura_EncabezadoFecha] [date] NOT NULL,
	[ClienteId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Factura_EncabezadoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Factura_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Factura_Detalle] FOREIGN KEY([ArticuloId])
REFERENCES [dbo].[Articulo] ([ArticuloId])
GO
ALTER TABLE [dbo].[Factura_Detalle] CHECK CONSTRAINT [FK_Articulo_Factura_Detalle]
GO
ALTER TABLE [dbo].[Factura_Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Encabezado_Factura_Detalle] FOREIGN KEY([Factura_EncabezadoId])
REFERENCES [dbo].[Factura_Encabezado] ([Factura_EncabezadoId])
GO
ALTER TABLE [dbo].[Factura_Detalle] CHECK CONSTRAINT [FK_Factura_Encabezado_Factura_Detalle]
GO
ALTER TABLE [dbo].[Factura_Encabezado]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Factura] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[Factura_Encabezado] CHECK CONSTRAINT [FK_Cliente_Factura]
GO
