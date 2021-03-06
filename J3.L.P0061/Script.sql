USE [master]
GO
/****** Object:  Database [Restaurant]    Script Date: 9/6/2021 9:40:50 AM ******/
CREATE DATABASE [Restaurant]
 
GO
ALTER DATABASE [Restaurant] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restaurant].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restaurant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restaurant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restaurant] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restaurant] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Restaurant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restaurant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restaurant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restaurant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restaurant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restaurant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restaurant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restaurant] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Restaurant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restaurant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restaurant] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restaurant] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restaurant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restaurant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restaurant] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restaurant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restaurant] SET  MULTI_USER 
GO
ALTER DATABASE [Restaurant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restaurant] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restaurant] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restaurant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Restaurant] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Restaurant] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Restaurant] SET QUERY_STORE = OFF
GO
USE [Restaurant]
GO
/****** Object:  User [quy]    Script Date: 9/6/2021 9:40:50 AM ******/
CREATE USER [quy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[city]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comboFood]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comboFood](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameComboFood] [nvarchar](50) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comboFoodOrderd]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comboFoodOrderd](
	[idOrder] [int] NULL,
	[idComboFood] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback](
	[nameUser] [nvarchar](50) NULL,
	[idRestaurant] [int] NULL,
	[star] [int] NULL,
	[content] [nvarchar](200) NULL,
	[time] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameFood] [nvarchar](50) NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[foodOrderd]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foodOrderd](
	[idOrder] [int] NULL,
	[idFood] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imageDetail]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imageDetail](
	[id] [int] NULL,
	[url] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listOrder]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeTable] [int] NULL,
	[numberGuest] [int] NULL,
	[dateOrder] [date] NULL,
	[beginDate] [date] NULL,
	[note] [nvarchar](1000) NULL,
	[when] [nvarchar](50) NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurantDetail]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurantDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[tower] [int] NULL,
	[quantity] [int] NULL,
	[imageMain] [varchar](200) NULL,
	[typeParty] [bit] NULL,
	[type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[service]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [int] NULL,
	[status] [bit] NULL,
	[type] [int] NULL,
	[description] [nvarchar](4000) NULL,
	[image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[serviceOrderd]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[serviceOrderd](
	[idOrder] [int] NULL,
	[idService] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[statusOrder]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[statusOrder](
	[id] [int] NOT NULL,
	[status] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tower]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tower](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
	[ofCity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeRestaurant]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeRestaurant](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_typeRestaurant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[typeService]    Script Date: 9/6/2021 9:40:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[typeService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [name]) VALUES (1, N'Thành phố Hà Nội')
INSERT [dbo].[city] ([id], [name]) VALUES (2, N'Thành phố HCM')
INSERT [dbo].[city] ([id], [name]) VALUES (3, N'Tỉnh Thanh Hoá')
INSERT [dbo].[city] ([id], [name]) VALUES (4, N'Tỉnh Bắc Giang')
INSERT [dbo].[city] ([id], [name]) VALUES (5, N'Tỉnh Hưng Yên')
INSERT [dbo].[city] ([id], [name]) VALUES (6, N'Thành phố Hải Phòng')
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[comboFood] ON 

INSERT [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (1, N'Thực đơn combo 1', 100000)
INSERT [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (2, N'Thực đơn combo 2', 200000)
INSERT [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (3, N'Thực đơn combo 3', 300000)
INSERT [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (4, N'Thực đơn combo 4', 400000)
SET IDENTITY_INSERT [dbo].[comboFood] OFF
GO
INSERT [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (15, 1, 10)
INSERT [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (15, 2, 30)
INSERT [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (15, 3, 100)
GO
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 5, N'test feedback', CAST(N'2021-08-25T17:30:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 2, N'abc', CAST(N'2021-08-25T17:31:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 2, N'ok', CAST(N'2021-08-26T17:33:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 5, 2, N'không đẹp', CAST(N'2021-08-26T17:22:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 5, 1, N'xấu', CAST(N'2021-08-26T17:23:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 5, 5, N'Đẹp', CAST(N'2021-08-26T17:56:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 6, 3, N'tôi không thích', CAST(N'2021-08-27T08:51:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 2, N'1', CAST(N'2021-08-24T21:21:54.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 4, N'abc', CAST(N'2021-08-24T21:24:17.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 1, N'aaaaaaaaaa', CAST(N'2021-08-24T21:30:47.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 6, 1, N'hmm', CAST(N'2021-08-27T08:51:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 5, N'hmm', CAST(N'2021-08-24T21:55:48.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 4, N'ok', CAST(N'2021-08-24T21:55:59.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'fhdhdggfh', CAST(N'2021-08-24T22:00:24.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'ok', CAST(N'2021-08-27T09:51:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'abc', CAST(N'2021-08-27T10:24:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2021-08-27T10:26:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'hdthghh', CAST(N'2021-08-27T11:08:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 1, N'fghf', CAST(N'2021-08-24T21:24:29.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 3, 3, N'hmmm', CAST(N'2021-08-24T21:34:20.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 1, N'abc', CAST(N'2021-08-24T21:40:25.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 1, 4, N'xyz', CAST(N'2021-08-24T22:06:00.000' AS DateTime))
INSERT [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', 4, 3, N'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', CAST(N'2021-08-27T10:12:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [nameFood], [price]) VALUES (1, N'món ăn 1', 10000)
INSERT [dbo].[Food] ([id], [nameFood], [price]) VALUES (2, N'món ăn 2', 20000)
INSERT [dbo].[Food] ([id], [nameFood], [price]) VALUES (3, N'món ăn 3', 30000)
INSERT [dbo].[Food] ([id], [nameFood], [price]) VALUES (4, N'món ăn 4', 40000)
INSERT [dbo].[Food] ([id], [nameFood], [price]) VALUES (5, N'món ăn 5', 50000)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
INSERT [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (15, 1, 100)
INSERT [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (15, 2, 200)
INSERT [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (15, 3, 50)
INSERT [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (16, 1, 20)
INSERT [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (16, 2, 50)
GO
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (1, N'img1.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (1, N'img2.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (1, N'img3.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (1, N'img4.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (3, N'img2.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (3, N'img4.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img3.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img4.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img5.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img6.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img7.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img8.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img9.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img10.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (4, N'img11.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img4.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img5.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img6.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img7.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img8.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img9.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img10.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img11.jpg')
INSERT [dbo].[imageDetail] ([id], [url]) VALUES (5, N'img12.jpg')
GO
SET IDENTITY_INSERT [dbo].[listOrder] ON 

INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (15, 8, 400, CAST(N'2021-01-01' AS Date), CAST(N'2021-01-02' AS Date), NULL, N'Sáng', 4)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (16, 1, 100, CAST(N'2021-02-02' AS Date), CAST(N'2021-02-05' AS Date), N'abcxyz', N'Chiều', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (17, 2, 50, CAST(N'2021-03-04' AS Date), CAST(N'2021-03-05' AS Date), NULL, N'Tối', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (18, 3, 200, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), NULL, N'Trưa', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (19, 4, 100, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), NULL, N'Sáng', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (20, 2, 100, CAST(N'2021-01-01' AS Date), CAST(N'2021-01-02' AS Date), NULL, N'Chiều', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (21, 2, 100, CAST(N'2021-01-01' AS Date), CAST(N'2021-01-02' AS Date), NULL, N'Trưa', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (22, 2, 100, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), N'xyz', N'Chiều', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (23, 2, 100, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), N'xyz', N'Trưa', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (24, 2, 100, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), NULL, N'Tối', 1)
INSERT [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (25, 2, 100, CAST(N'2021-01-03' AS Date), CAST(N'2021-01-05' AS Date), NULL, N'Tối', 1)
SET IDENTITY_INSERT [dbo].[listOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[restaurantDetail] ON 

INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (1, N'Nhà hàng Trống Đồng', 1, 4000, N'img1.jpg', 0, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (3, N'Cưới hỏi Thái Hiền', 4, 800, N'img2.jpg', 1, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (4, N'Tiệc lưu động Sen Thanh', 7, 800, N'img3.jpg', 1, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (5, N'Khách sạn 1', 2, 100, N'img4.jpg', 0, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (6, N'Khách sạn 2', 3, 100, N'img5.jpg', 0, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (7, N'Nhà hàng tiệc cưới Hà Nội - Sapphire', 2, 1500, N'img6.jpg', 0, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (8, N'Vạn Hoa Thái Thịnh', 3, 3700, N'img7.jpg', 1, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (9, N'Trung tâm Hội Nghị - Tiệc Cưới Vườn Cau', 18, 2500, N'img8.jpg', 0, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (10, N'Nhà hàng tiệc cưới Callary', 17, 3000, N'img9.jpg', 1, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (11, N'Nhà hàng Yến Anh', 16, 200, N'img10.jpg', 0, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (12, N'Nhà hàng tiệc cưới Ái Huê', 15, 2000, N'img11.jpg', 1, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (13, N'Trung tâm tiệc cưới Xanh Plaza', 14, 3000, N'img12.jpg', 1, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (14, N'Trung Tâm Tiệc Cưới Quốc Thanh', 13, 500, N'img13.jpg', 0, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (15, N'Hanoi Daewoo Hotel', 12, 3000, N'img1.jpg', 0, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (16, N'Nhà hàng 1', 11, 100, N'img2.jpg', 1, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (17, N'Nhà hàng 2', 10, 200, N'img3.jpg', 0, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (18, N'Nhà hàng 3', 9, 300, N'img4.jpg', 1, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (19, N'Nhà hàng 4', 8, 400, N'img5.jpg', 0, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (20, N'Nhà hàng 5', 7, 500, N'img6.jpg', 1, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (21, N'Nhà hàng 6', 6, 600, N'img7.jpg', 0, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (22, N'Nhà hàng 7', 5, 700, N'img8.jpg', 1, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (23, N'Nhà hàng 8', 4, 800, N'img9.jpg', 0, 1)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (24, N'Nhà hàng 9', 3, 900, N'img10.jpg', 1, 2)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (25, N'Nhà hàng 10', 2, 1000, N'img11.jpg', 0, 3)
INSERT [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (26, N'Nhà hàng 11', 1, 1100, N'img12.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[restaurantDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (1, N'Combo trang trí bàn Gallery 3', 5500000, 1, 1, N'ABCxyz', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (2, N'Combo trang trí bàn Gallery 2', 950000, 1, 1, N'Hello', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (3, N'Ban nhạc điện tử 2.0', 2000000, 1, 2, N'uuu', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (4, N'Ban nhạc acoustic', 2000000, 1, 2, N'asd', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (5, N'Vũ đoàn', 1000000, 1, 2, N'sfhg', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (6, N'Ca sĩ phổ thông', 800000, 1, 3, N'zdfgb', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (7, N'Ca sĩ phèn', 900000, 0, 3, N'zfdhb', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (10, N'Test', 123456, 1, 6, N'hhhhhhhh', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (12, N'MC tập sự', 800000, 1, 4, N'VIP', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (13, N'Chụp ảnh cưới giá rẻ', 464656, 0, 5, N'ghjhj', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (14, N'Quay phim giá đắt', 1234, 1, 5, N'gdhgfhg', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (16, N'Test1', 67567, 1, 1, N'gfgjh', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (23, N'Test', 9999999, 1, 1, N'gfjghj', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (24, N'dgsgf', 56457, 1, 1, N'fdhdfh', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (25, N'xyzabc', 10000000, 1, 1, N'dfhfgh', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (26, N'xyz', 636456, 1, 1, N'gjfjf', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (27, N'okko', 46365, 1, 3, N'fhgdh', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (28, N'gjghjgjhj', 34566, 0, 1, N'gfjfhjg', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (29, N'hhhhhh', 4444444, 0, 1, N'gggggggggggg', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (30, N'gggggggggggggggggggggggggggggggggghhhhhhhhhhhhhhhh', 747, 1, 1, N'kjkkkkkkkkkkkkkkkk', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (31, N'test...test', 6666666, 0, 1, N'ghhhhhhhhhhhh', N'logo.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (32, N'fdhgfhhhgfjgfhj', 5747, 0, 5, N'dghghfg', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (33, N'test123', 1234, 1, 1, N'ghfgfgh', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (34, N'i987', 2365275, 1, 1, N'abcxyz', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (35, N'i456', 12345, 1, 1, N'fgdhdhgd', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (36, N'i476576', 76476, 1, 1, N'hfghgfh', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (37, N'i1242342', 1234556, 1, 5, N'sfgfgdf', N'test.png')
INSERT [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (38, N'ffffffffffffffffffffffffffffffffffffffffffffffffff', 1236545, 1, 1, N'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffai', N'test.png')
SET IDENTITY_INSERT [dbo].[service] OFF
GO
INSERT [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (15, 1, 1)
INSERT [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (15, 2, 3)
INSERT [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (16, 3, 1)
INSERT [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (16, 4, 1)
GO
INSERT [dbo].[statusOrder] ([id], [status]) VALUES (1, N'Đang chờ duyệt')
INSERT [dbo].[statusOrder] ([id], [status]) VALUES (3, N'Đã đặt')
INSERT [dbo].[statusOrder] ([id], [status]) VALUES (4, N'Đã huỷ')
INSERT [dbo].[statusOrder] ([id], [status]) VALUES (5, N'Đã hoàn thành')
GO
SET IDENTITY_INSERT [dbo].[tower] ON 

INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (1, N'Quận A', 1)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (2, N'Quận B', 1)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (3, N'Quận C', 1)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (4, N'Quận 1', 2)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (5, N'Quận 2', 2)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (6, N'Quận 3', 2)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (7, N'Quận X', 3)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (8, N'Quận Y', 3)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (9, N'Quận Z', 3)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (10, N'Huyện A', 4)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (11, N'Huyện B', 4)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (12, N'Huyện C', 4)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (13, N'Huyện 1', 5)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (14, N'Huyện 2', 5)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (15, N'Huyện 3', 5)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (16, N'Huyện X', 6)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (17, N'Huyện Y', 6)
INSERT [dbo].[tower] ([id], [name], [ofCity]) VALUES (18, N'Huyện Z', 6)
SET IDENTITY_INSERT [dbo].[tower] OFF
GO
SET IDENTITY_INSERT [dbo].[typeRestaurant] ON 

INSERT [dbo].[typeRestaurant] ([id], [name]) VALUES (1, N'Nhà hàng')
INSERT [dbo].[typeRestaurant] ([id], [name]) VALUES (2, N'Trung tâm')
INSERT [dbo].[typeRestaurant] ([id], [name]) VALUES (3, N'Khách sạn')
SET IDENTITY_INSERT [dbo].[typeRestaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[typeService] ON 

INSERT [dbo].[typeService] ([id], [name]) VALUES (1, N'Trang trí')
INSERT [dbo].[typeService] ([id], [name]) VALUES (2, N'Vũ đoàn')
INSERT [dbo].[typeService] ([id], [name]) VALUES (3, N'Ca sĩ')
INSERT [dbo].[typeService] ([id], [name]) VALUES (4, N'MC')
INSERT [dbo].[typeService] ([id], [name]) VALUES (5, N'Quay phim - chụp ảnh')
INSERT [dbo].[typeService] ([id], [name]) VALUES (6, N'Xe cưới')
SET IDENTITY_INSERT [dbo].[typeService] OFF
GO
ALTER TABLE [dbo].[comboFoodOrderd]  WITH CHECK ADD FOREIGN KEY([idComboFood])
REFERENCES [dbo].[comboFood] ([id])
GO
ALTER TABLE [dbo].[feedback]  WITH CHECK ADD FOREIGN KEY([idRestaurant])
REFERENCES [dbo].[restaurantDetail] ([id])
GO
ALTER TABLE [dbo].[foodOrderd]  WITH CHECK ADD FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([id])
GO
ALTER TABLE [dbo].[imageDetail]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[restaurantDetail] ([id])
GO
ALTER TABLE [dbo].[listOrder]  WITH CHECK ADD FOREIGN KEY([status])
REFERENCES [dbo].[statusOrder] ([id])
GO
ALTER TABLE [dbo].[restaurantDetail]  WITH CHECK ADD FOREIGN KEY([tower])
REFERENCES [dbo].[tower] ([id])
GO
ALTER TABLE [dbo].[restaurantDetail]  WITH CHECK ADD  CONSTRAINT [FK_restaurantDetail_typeRestaurant] FOREIGN KEY([type])
REFERENCES [dbo].[typeRestaurant] ([id])
GO
ALTER TABLE [dbo].[restaurantDetail] CHECK CONSTRAINT [FK_restaurantDetail_typeRestaurant]
GO
ALTER TABLE [dbo].[service]  WITH CHECK ADD  CONSTRAINT [FK_service_typeService] FOREIGN KEY([type])
REFERENCES [dbo].[typeService] ([id])
GO
ALTER TABLE [dbo].[service] CHECK CONSTRAINT [FK_service_typeService]
GO
ALTER TABLE [dbo].[serviceOrderd]  WITH CHECK ADD FOREIGN KEY([idService])
REFERENCES [dbo].[service] ([id])
GO
ALTER TABLE [dbo].[tower]  WITH CHECK ADD FOREIGN KEY([ofCity])
REFERENCES [dbo].[city] ([id])
GO
USE [master]
GO
ALTER DATABASE [Restaurant] SET  READ_WRITE 
GO
