USE [master]
GO
/****** Object:  Database [CINEMARK2]    Script Date: 29/04/2020 22:08:13 ******/
CREATE DATABASE [CINEMARK2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINEMARK2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CINEMARK2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CINEMARK2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CINEMARK2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CINEMARK2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINEMARK2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINEMARK2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINEMARK2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINEMARK2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINEMARK2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINEMARK2] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINEMARK2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CINEMARK2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINEMARK2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINEMARK2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINEMARK2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINEMARK2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINEMARK2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINEMARK2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINEMARK2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINEMARK2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CINEMARK2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINEMARK2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINEMARK2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINEMARK2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINEMARK2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINEMARK2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINEMARK2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINEMARK2] SET RECOVERY FULL 
GO
ALTER DATABASE [CINEMARK2] SET  MULTI_USER 
GO
ALTER DATABASE [CINEMARK2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINEMARK2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINEMARK2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINEMARK2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CINEMARK2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CINEMARK2', N'ON'
GO
ALTER DATABASE [CINEMARK2] SET QUERY_STORE = OFF
GO
USE [CINEMARK2]
GO
/****** Object:  Table [dbo].[ACTIVO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVO](
	[CODIGO_EMPLEADO] [int] NOT NULL,
	[CODIGO_CINE] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
 CONSTRAINT [PK_ACTIVO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_EMPLEADO] ASC,
	[CODIGO_CINE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ACTOR]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTOR](
	[NOMBRE_ARTISTICO] [nvarchar](50) NOT NULL,
	[NACIONALIDAD] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ACTOR] PRIMARY KEY CLUSTERED 
(
	[NOMBRE_ARTISTICO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOLETO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOLETO](
	[CODIGO_PRODUCTO] [int] NOT NULL,
	[NUMERO_BOLETO] [int] IDENTITY(1,1) NOT NULL,
	[NUMERO_SALA] [int] NOT NULL,
	[CODIGO_CINE] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
	[HORA] [time](0) NOT NULL,
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[PRECIO] [numeric](5, 2) NOT NULL,
 CONSTRAINT [PK_BOLETO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PRODUCTO] ASC,
	[NUMERO_BOLETO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARTELERA]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARTELERA](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CARTELERA] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CINE]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CINE](
	[CODIGO_CINE] [int] NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[TELEFONO] [nvarchar](8) NOT NULL,
	[DIRECCION] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CINE] PRIMARY KEY CLUSTERED 
(
	[CODIGO_CINE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CULTURALES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CULTURALES](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[LUGAR_GRABACION] [nvarchar](50) NOT NULL,
	[NOMBRE_COMPOSITOR] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CULTURALES] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPORTES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPORTES](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[TIPO_DEPORTE] [nvarchar](50) NOT NULL,
	[LUGAR_ORIGEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DEPORTES] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE](
	[NUMERO_DETALLE] [int] NOT NULL,
	[CODIGO_PRODUCTO] [int] NOT NULL,
	[NUMERO_FACTURA] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
 CONSTRAINT [PK_DETALLE] PRIMARY KEY CLUSTERED 
(
	[NUMERO_DETALLE] ASC,
	[CODIGO_PRODUCTO] ASC,
	[NUMERO_FACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DULCES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DULCES](
	[CODIGO_PRODUCTO] [int] NOT NULL,
 CONSTRAINT [PK_DULCES] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLEADO](
	[CODIGO_EMPLEADO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [nvarchar](50) NOT NULL,
	[APELLIDO] [nvarchar](50) NOT NULL,
	[SALARIO] [money] NOT NULL,
	[FECHA_NACIMIENTO] [date] NOT NULL,
 CONSTRAINT [PK_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_EMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESPECIALES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESPECIALES](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ESPECIALES] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENTO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENTO](
	[CODIGO_CINE] [int] NOT NULL,
	[NUMERO_SALA] [int] NOT NULL,
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[HORA] [time](0) NOT NULL,
	[FECHA] [date] NOT NULL,
 CONSTRAINT [PK_EVENTO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_CINE] ASC,
	[NUMERO_SALA] ASC,
	[CODIGO_PELICULA] ASC,
	[HORA] ASC,
	[FECHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURA]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACTURA](
	[NUMERO_FACTURA] [int] IDENTITY(1,1) NOT NULL,
	[NIT] [nvarchar](8) NOT NULL,
	[NOMBRE_CLIENTE] [nvarchar](50) NOT NULL,
	[DIRECCION] [nvarchar](max) NOT NULL,
	[COD_CINE] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
 CONSTRAINT [PK_FACTURA] PRIMARY KEY CLUSTERED 
(
	[NUMERO_FACTURA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INACTIVO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INACTIVO](
	[CODIGO_EMPLEADO] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
	[MOTIVO] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_INACTIVO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_EMPLEADO] ASC,
	[FECHA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPINIONES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPINIONES](
	[NUMERO_COMENTARIO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[CALIFICACION] [nvarchar](50) NOT NULL,
	[FECHA] [date] NOT NULL,
	[NOMBRE_PERSONA] [nvarchar](50) NOT NULL,
	[COMENTARIO] [nvarchar](max) NOT NULL,
	[EDAD] [int] NOT NULL,
 CONSTRAINT [PK_OPINIONES] PRIMARY KEY CLUSTERED 
(
	[NUMERO_COMENTARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PELICULA]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PELICULA](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[AÑO] [nvarchar](4) NOT NULL,
	[DISTRIBUIDOR] [nvarchar](50) NOT NULL,
	[DESCRIPCION] [nvarchar](max) NOT NULL,
	[DIRECTOR] [nvarchar](50) NOT NULL,
	[PAIS_PRODUCCION] [nvarchar](50) NOT NULL,
	[TIPO_EMISION] [nvarchar](50) NOT NULL,
	[DURACION] [int] NOT NULL,
	[TITULO] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PELICULA] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[CODIGO_PRODUCTO] [int] NOT NULL,
 CONSTRAINT [PK_PRODUCTO] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PRODUCTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGISTRO_HISTORICO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGISTRO_HISTORICO](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[FECHA_ESTRENO] [date] NOT NULL,
	[FECHA_DEJA_CARTELERA] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGULARES]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGULARES](
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_REGULARES] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PELICULA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPARTO]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPARTO](
	[NUMERO_REPARTO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO_PELICULA] [nvarchar](50) NOT NULL,
	[NOMBRE_ARTISTICO] [nvarchar](50) NOT NULL,
	[PERSONAJE] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_REPARTO] PRIMARY KEY CLUSTERED 
(
	[NUMERO_REPARTO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SALA]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SALA](
	[CODIGO_CINE] [int] NOT NULL,
	[NUMERO_SALA] [int] IDENTITY(1,1) NOT NULL,
	[CAPACIDAD] [int] NOT NULL,
	[HORA_APERTURA] [time](0) NOT NULL,
	[TIPO_SOPORTE_DISPONIBLE] [nvarchar](50) NOT NULL,
	[TIEMPO_ENTRE_FUNCIONES] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SALA] PRIMARY KEY CLUSTERED 
(
	[CODIGO_CINE] ASC,
	[NUMERO_SALA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tamaño]    Script Date: 29/04/2020 22:08:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tamaño](
	[PRECIO] [numeric](5, 2) NOT NULL,
	[CODIGO_PRODUCTO] [int] NOT NULL,
	[TAMAÑO] [nvarchar](7) NOT NULL,
	[DESCRIPCION] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tamaño] PRIMARY KEY CLUSTERED 
(
	[CODIGO_PRODUCTO] ASC,
	[TAMAÑO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVO]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVO_CINE] FOREIGN KEY([CODIGO_CINE])
REFERENCES [dbo].[CINE] ([CODIGO_CINE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACTIVO] CHECK CONSTRAINT [FK_ACTIVO_CINE]
GO
ALTER TABLE [dbo].[ACTIVO]  WITH CHECK ADD  CONSTRAINT [FK_ACTIVO_EMPLEADO] FOREIGN KEY([CODIGO_EMPLEADO])
REFERENCES [dbo].[EMPLEADO] ([CODIGO_EMPLEADO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ACTIVO] CHECK CONSTRAINT [FK_ACTIVO_EMPLEADO]
GO
ALTER TABLE [dbo].[BOLETO]  WITH CHECK ADD  CONSTRAINT [FK_BOLETO_EVENTO] FOREIGN KEY([CODIGO_CINE], [NUMERO_SALA], [CODIGO_PELICULA], [HORA], [FECHA])
REFERENCES [dbo].[EVENTO] ([CODIGO_CINE], [NUMERO_SALA], [CODIGO_PELICULA], [HORA], [FECHA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOLETO] CHECK CONSTRAINT [FK_BOLETO_EVENTO]
GO
ALTER TABLE [dbo].[BOLETO]  WITH CHECK ADD  CONSTRAINT [FK_BOLETO_PRODUCTO] FOREIGN KEY([CODIGO_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([CODIGO_PRODUCTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BOLETO] CHECK CONSTRAINT [FK_BOLETO_PRODUCTO]
GO
ALTER TABLE [dbo].[CULTURALES]  WITH CHECK ADD  CONSTRAINT [FK_CULTURALES_ESPECIALES] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[ESPECIALES] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CULTURALES] CHECK CONSTRAINT [FK_CULTURALES_ESPECIALES]
GO
ALTER TABLE [dbo].[DEPORTES]  WITH CHECK ADD  CONSTRAINT [FK_DEPORTES_ESPECIALES] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[ESPECIALES] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DEPORTES] CHECK CONSTRAINT [FK_DEPORTES_ESPECIALES]
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_FACTURA] FOREIGN KEY([NUMERO_FACTURA])
REFERENCES [dbo].[FACTURA] ([NUMERO_FACTURA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DETALLE] CHECK CONSTRAINT [FK_DETALLE_FACTURA]
GO
ALTER TABLE [dbo].[DETALLE]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_PRODUCTO] FOREIGN KEY([CODIGO_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([CODIGO_PRODUCTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DETALLE] CHECK CONSTRAINT [FK_DETALLE_PRODUCTO]
GO
ALTER TABLE [dbo].[DULCES]  WITH CHECK ADD  CONSTRAINT [FK_DULCES_PRODUCTO] FOREIGN KEY([CODIGO_PRODUCTO])
REFERENCES [dbo].[PRODUCTO] ([CODIGO_PRODUCTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DULCES] CHECK CONSTRAINT [FK_DULCES_PRODUCTO]
GO
ALTER TABLE [dbo].[ESPECIALES]  WITH CHECK ADD  CONSTRAINT [FK_ESPECIALES_PELICULA] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[PELICULA] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ESPECIALES] CHECK CONSTRAINT [FK_ESPECIALES_PELICULA]
GO
ALTER TABLE [dbo].[EVENTO]  WITH CHECK ADD  CONSTRAINT [FK_EVENTO_CARTELERA] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[CARTELERA] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENTO] CHECK CONSTRAINT [FK_EVENTO_CARTELERA]
GO
ALTER TABLE [dbo].[EVENTO]  WITH CHECK ADD  CONSTRAINT [FK_EVENTO_SALA] FOREIGN KEY([CODIGO_CINE], [NUMERO_SALA])
REFERENCES [dbo].[SALA] ([CODIGO_CINE], [NUMERO_SALA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENTO] CHECK CONSTRAINT [FK_EVENTO_SALA]
GO
ALTER TABLE [dbo].[FACTURA]  WITH CHECK ADD  CONSTRAINT [FK_FACTURA_CINE] FOREIGN KEY([COD_CINE])
REFERENCES [dbo].[CINE] ([CODIGO_CINE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FACTURA] CHECK CONSTRAINT [FK_FACTURA_CINE]
GO
ALTER TABLE [dbo].[INACTIVO]  WITH CHECK ADD  CONSTRAINT [FK_INACTIVO_EMPLEADO] FOREIGN KEY([CODIGO_EMPLEADO])
REFERENCES [dbo].[EMPLEADO] ([CODIGO_EMPLEADO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[INACTIVO] CHECK CONSTRAINT [FK_INACTIVO_EMPLEADO]
GO
ALTER TABLE [dbo].[OPINIONES]  WITH CHECK ADD  CONSTRAINT [FK_OPINIONES_CARTELERA] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[CARTELERA] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OPINIONES] CHECK CONSTRAINT [FK_OPINIONES_CARTELERA]
GO
ALTER TABLE [dbo].[REGISTRO_HISTORICO]  WITH CHECK ADD  CONSTRAINT [FK_REGISTRO_HISTORICO_PELICULA] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[PELICULA] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REGISTRO_HISTORICO] CHECK CONSTRAINT [FK_REGISTRO_HISTORICO_PELICULA]
GO
ALTER TABLE [dbo].[REGULARES]  WITH CHECK ADD  CONSTRAINT [FK_REGULARES_PELICULA] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[PELICULA] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REGULARES] CHECK CONSTRAINT [FK_REGULARES_PELICULA]
GO
ALTER TABLE [dbo].[REPARTO]  WITH CHECK ADD  CONSTRAINT [FK_REPARTO_ACTOR] FOREIGN KEY([NOMBRE_ARTISTICO])
REFERENCES [dbo].[ACTOR] ([NOMBRE_ARTISTICO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPARTO] CHECK CONSTRAINT [FK_REPARTO_ACTOR]
GO
ALTER TABLE [dbo].[REPARTO]  WITH CHECK ADD  CONSTRAINT [FK_REPARTO_REGULARES] FOREIGN KEY([CODIGO_PELICULA])
REFERENCES [dbo].[REGULARES] ([CODIGO_PELICULA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REPARTO] CHECK CONSTRAINT [FK_REPARTO_REGULARES]
GO
ALTER TABLE [dbo].[SALA]  WITH CHECK ADD  CONSTRAINT [FK_SALA_CINE] FOREIGN KEY([CODIGO_CINE])
REFERENCES [dbo].[CINE] ([CODIGO_CINE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SALA] CHECK CONSTRAINT [FK_SALA_CINE]
GO
ALTER TABLE [dbo].[Tamaño]  WITH CHECK ADD  CONSTRAINT [FK_Tamaño_DULCES1] FOREIGN KEY([CODIGO_PRODUCTO])
REFERENCES [dbo].[DULCES] ([CODIGO_PRODUCTO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tamaño] CHECK CONSTRAINT [FK_Tamaño_DULCES1]
GO
USE [master]
GO
ALTER DATABASE [CINEMARK2] SET  READ_WRITE 
GO
