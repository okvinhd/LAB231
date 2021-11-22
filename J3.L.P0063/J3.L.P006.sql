/*
 Navicat Premium Data Transfer

 Source Server         : Microsoft SQL
 Source Server Type    : SQL Server
 Source Server Version : 15002080
 Source Host           : localhost:1433
 Source Catalog        : Restaurant
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002080
 File Encoding         : 65001

 Date: 23/11/2021 01:06:30
*/


-- ----------------------------
-- Table structure for city
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[city]') AND type IN ('U'))
	DROP TABLE [dbo].[city]
GO

CREATE TABLE [dbo].[city] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[city] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of city
-- ----------------------------
SET IDENTITY_INSERT [dbo].[city] ON
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'1', N'Thành phố Hà Nội')
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'2', N'Thành phố HCM')
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'3', N'Tỉnh Thanh Hoá')
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'4', N'Tỉnh Bắc Giang')
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'5', N'Tỉnh Hưng Yên')
GO

INSERT INTO [dbo].[city] ([id], [name]) VALUES (N'6', N'Thành phố Hải Phòng')
GO

SET IDENTITY_INSERT [dbo].[city] OFF
GO


-- ----------------------------
-- Table structure for comboFood
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[comboFood]') AND type IN ('U'))
	DROP TABLE [dbo].[comboFood]
GO

CREATE TABLE [dbo].[comboFood] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nameComboFood] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [price] int  NULL
)
GO

ALTER TABLE [dbo].[comboFood] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of comboFood
-- ----------------------------
SET IDENTITY_INSERT [dbo].[comboFood] ON
GO

INSERT INTO [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (N'1', N'Thực đơn combo 1', N'100000')
GO

INSERT INTO [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (N'2', N'Thực đơn combo 2', N'200000')
GO

INSERT INTO [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (N'3', N'Thực đơn combo 3', N'300000')
GO

INSERT INTO [dbo].[comboFood] ([id], [nameComboFood], [price]) VALUES (N'4', N'Thực đơn combo 4', N'400000')
GO

SET IDENTITY_INSERT [dbo].[comboFood] OFF
GO


-- ----------------------------
-- Table structure for comboFoodOrderd
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[comboFoodOrderd]') AND type IN ('U'))
	DROP TABLE [dbo].[comboFoodOrderd]
GO

CREATE TABLE [dbo].[comboFoodOrderd] (
  [idOrder] int  NULL,
  [idComboFood] int  NULL,
  [quantity] int  NULL
)
GO

ALTER TABLE [dbo].[comboFoodOrderd] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of comboFoodOrderd
-- ----------------------------
INSERT INTO [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (N'15', N'1', N'10')
GO

INSERT INTO [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (N'15', N'2', N'30')
GO

INSERT INTO [dbo].[comboFoodOrderd] ([idOrder], [idComboFood], [quantity]) VALUES (N'15', N'3', N'100')
GO


-- ----------------------------
-- Table structure for feedback
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[feedback]') AND type IN ('U'))
	DROP TABLE [dbo].[feedback]
GO

CREATE TABLE [dbo].[feedback] (
  [nameUser] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [idRestaurant] int  NULL,
  [star] int  NULL,
  [content] nvarchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [time] datetime  NULL
)
GO

ALTER TABLE [dbo].[feedback] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'5', N'test feedback', N'2021-08-25 17:30:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'2', N'abc', N'2021-08-25 17:31:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'2', N'ok', N'2021-08-26 17:33:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'5', N'2', N'không đẹp', N'2021-08-26 17:22:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'5', N'1', N'xấu', N'2021-08-26 17:23:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'5', N'5', N'Đẹp', N'2021-08-26 17:56:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'6', N'3', N'tôi không thích', N'2021-08-27 08:51:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'2', N'1', N'2021-08-24 21:21:54.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'4', N'abc', N'2021-08-24 21:24:17.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'1', N'aaaaaaaaaa', N'2021-08-24 21:30:47.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'6', N'1', N'hmm', N'2021-08-27 08:51:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'5', N'hmm', N'2021-08-24 21:55:48.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'4', N'ok', N'2021-08-24 21:55:59.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'fhdhdggfh', N'2021-08-24 22:00:24.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'ok', N'2021-08-27 09:51:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'abc', N'2021-08-27 10:24:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', N'2021-08-27 10:26:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'hdthghh', N'2021-08-27 11:08:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'1', N'fghf', N'2021-08-24 21:24:29.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'3', N'3', N'hmmm', N'2021-08-24 21:34:20.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'1', N'abc', N'2021-08-24 21:40:25.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'1', N'4', N'xyz', N'2021-08-24 22:06:00.000')
GO

INSERT INTO [dbo].[feedback] ([nameUser], [idRestaurant], [star], [content], [time]) VALUES (N'User Test', N'4', N'3', N'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', N'2021-08-27 10:12:00.000')
GO


-- ----------------------------
-- Table structure for Food
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Food]') AND type IN ('U'))
	DROP TABLE [dbo].[Food]
GO

CREATE TABLE [dbo].[Food] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [nameFood] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [price] int  NULL
)
GO

ALTER TABLE [dbo].[Food] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Food
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Food] ON
GO

INSERT INTO [dbo].[Food] ([id], [nameFood], [price]) VALUES (N'1', N'món ăn 1', N'10000')
GO

INSERT INTO [dbo].[Food] ([id], [nameFood], [price]) VALUES (N'2', N'món ăn 2', N'20000')
GO

INSERT INTO [dbo].[Food] ([id], [nameFood], [price]) VALUES (N'3', N'món ăn 3', N'30000')
GO

INSERT INTO [dbo].[Food] ([id], [nameFood], [price]) VALUES (N'4', N'món ăn 4', N'40000')
GO

INSERT INTO [dbo].[Food] ([id], [nameFood], [price]) VALUES (N'5', N'món ăn 5', N'50000')
GO

SET IDENTITY_INSERT [dbo].[Food] OFF
GO


-- ----------------------------
-- Table structure for foodOrderd
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[foodOrderd]') AND type IN ('U'))
	DROP TABLE [dbo].[foodOrderd]
GO

CREATE TABLE [dbo].[foodOrderd] (
  [idOrder] int  NULL,
  [idFood] int  NULL,
  [quantity] int  NULL
)
GO

ALTER TABLE [dbo].[foodOrderd] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of foodOrderd
-- ----------------------------
INSERT INTO [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (N'15', N'1', N'100')
GO

INSERT INTO [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (N'15', N'2', N'200')
GO

INSERT INTO [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (N'15', N'3', N'50')
GO

INSERT INTO [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (N'16', N'1', N'20')
GO

INSERT INTO [dbo].[foodOrderd] ([idOrder], [idFood], [quantity]) VALUES (N'16', N'2', N'50')
GO


-- ----------------------------
-- Table structure for imageDetail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[imageDetail]') AND type IN ('U'))
	DROP TABLE [dbo].[imageDetail]
GO

CREATE TABLE [dbo].[imageDetail] (
  [id] int  NULL,
  [url] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[imageDetail] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of imageDetail
-- ----------------------------
INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'1', N'img1.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'1', N'img2.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'1', N'img3.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'1', N'img4.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'3', N'img2.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'3', N'img4.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img3.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img4.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img5.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img6.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img7.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img8.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img9.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img10.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'4', N'img11.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img4.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img5.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img6.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img7.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img8.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img9.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img10.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img11.jpg')
GO

INSERT INTO [dbo].[imageDetail] ([id], [url]) VALUES (N'5', N'img12.jpg')
GO


-- ----------------------------
-- Table structure for listOrder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[listOrder]') AND type IN ('U'))
	DROP TABLE [dbo].[listOrder]
GO

CREATE TABLE [dbo].[listOrder] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [typeTable] int  NULL,
  [numberGuest] int  NULL,
  [dateOrder] date  NULL,
  [beginDate] date  NULL,
  [note] nvarchar(1000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [when] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [status] int  NULL
)
GO

ALTER TABLE [dbo].[listOrder] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of listOrder
-- ----------------------------
SET IDENTITY_INSERT [dbo].[listOrder] ON
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'15', N'8', N'400', N'2021-01-01', N'2021-01-02', NULL, N'Sáng', N'4')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'16', N'1', N'100', N'2021-02-02', N'2021-02-05', N'abcxyz', N'Chiều', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'17', N'2', N'50', N'2021-03-04', N'2021-03-05', NULL, N'Tối', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'18', N'3', N'200', N'2021-01-03', N'2021-01-05', NULL, N'Trưa', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'19', N'4', N'100', N'2021-01-03', N'2021-01-05', NULL, N'Sáng', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'20', N'2', N'100', N'2021-01-01', N'2021-01-02', NULL, N'Chiều', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'21', N'2', N'100', N'2021-01-01', N'2021-01-02', NULL, N'Trưa', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'22', N'2', N'100', N'2021-01-03', N'2021-01-05', N'xyz', N'Chiều', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'23', N'2', N'100', N'2021-01-03', N'2021-01-05', N'xyz', N'Trưa', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'24', N'2', N'100', N'2021-01-03', N'2021-01-05', NULL, N'Tối', N'1')
GO

INSERT INTO [dbo].[listOrder] ([id], [typeTable], [numberGuest], [dateOrder], [beginDate], [note], [when], [status]) VALUES (N'25', N'2', N'100', N'2021-01-03', N'2021-01-05', NULL, N'Tối', N'1')
GO

SET IDENTITY_INSERT [dbo].[listOrder] OFF
GO


-- ----------------------------
-- Table structure for Promotion
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[Promotion]') AND type IN ('U'))
	DROP TABLE [dbo].[Promotion]
GO

CREATE TABLE [dbo].[Promotion] (
  [ID] int  IDENTITY(1,1) NOT NULL,
  [image] varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [name] nvarchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [start_date] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [end_date] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [value] int  NULL,
  [description] nvarchar(3000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [state] int  NULL
)
GO

ALTER TABLE [dbo].[Promotion] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of Promotion
-- ----------------------------
SET IDENTITY_INSERT [dbo].[Promotion] ON
GO

INSERT INTO [dbo].[Promotion] ([ID], [image], [name], [start_date], [end_date], [value], [description], [state]) VALUES (N'1', N'Dichvu.jpg', N'khách mới', N'2021-11-01', N'2021-11-10', N'5', N'siêu khuyến mãi', N'1')
GO

INSERT INTO [dbo].[Promotion] ([ID], [image], [name], [start_date], [end_date], [value], [description], [state]) VALUES (N'2', N'Dichvu.jpg', N'khách mới2', N'2021-11-01', N'2021-11-10', N'6', N'siêu khuyến mãi', N'2')
GO

INSERT INTO [dbo].[Promotion] ([ID], [image], [name], [start_date], [end_date], [value], [description], [state]) VALUES (N'3', N'Dichvu.jpg', N'khách cũ', N'2021-11-01', N'2021-11-10', N'7', N'siêu khuyến mãi', N'3')
GO

INSERT INTO [dbo].[Promotion] ([ID], [image], [name], [start_date], [end_date], [value], [description], [state]) VALUES (N'4', N'Dichvu.jpg', N'khách tiềm năng', N'2021-11-01', N'2021-11-10', N'8', N'siêu khuyến mãi', N'3')
GO

INSERT INTO [dbo].[Promotion] ([ID], [image], [name], [start_date], [end_date], [value], [description], [state]) VALUES (N'5', N'Dichvu.jpg', N'khách vớ vẩn', N'2021-11-01', N'2021-11-10', N'9', N'siêu khuyến mãi', N'3')
GO

SET IDENTITY_INSERT [dbo].[Promotion] OFF
GO


-- ----------------------------
-- Table structure for restaurantDetail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[restaurantDetail]') AND type IN ('U'))
	DROP TABLE [dbo].[restaurantDetail]
GO

CREATE TABLE [dbo].[restaurantDetail] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [tower] int  NULL,
  [quantity] int  NULL,
  [imageMain] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [typeParty] bit  NULL,
  [type] int  NULL
)
GO

ALTER TABLE [dbo].[restaurantDetail] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of restaurantDetail
-- ----------------------------
SET IDENTITY_INSERT [dbo].[restaurantDetail] ON
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'1', N'Nhà hàng Trống Đồng', N'1', N'4000', N'img1.jpg', N'0', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'3', N'Cưới hỏi Thái Hiền', N'4', N'800', N'img2.jpg', N'1', N'2')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'4', N'Tiệc lưu động Sen Thanh', N'7', N'800', N'img3.jpg', N'1', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'5', N'Khách sạn 1', N'2', N'100', N'img4.jpg', N'0', N'3')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'6', N'Khách sạn 2', N'3', N'100', N'img5.jpg', N'0', N'3')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'7', N'Nhà hàng tiệc cưới Hà Nội - Sapphire', N'2', N'1500', N'img6.jpg', N'0', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'8', N'Vạn Hoa Thái Thịnh', N'3', N'3700', N'img7.jpg', N'1', N'2')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'9', N'Trung tâm Hội Nghị - Tiệc Cưới Vườn Cau', N'18', N'2500', N'img8.jpg', N'0', N'2')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'10', N'Nhà hàng tiệc cưới Callary', N'17', N'3000', N'img9.jpg', N'1', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'11', N'Nhà hàng Yến Anh', N'16', N'200', N'img10.jpg', N'0', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'12', N'Nhà hàng tiệc cưới Ái Huê', N'15', N'2000', N'img11.jpg', N'1', N'1')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'13', N'Trung tâm tiệc cưới Xanh Plaza', N'14', N'3000', N'img12.jpg', N'1', N'2')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'14', N'Trung Tâm Tiệc Cưới Quốc Thanh', N'13', N'500', N'img13.jpg', N'0', N'2')
GO

INSERT INTO [dbo].[restaurantDetail] ([id], [name], [tower], [quantity], [imageMain], [typeParty], [type]) VALUES (N'15', N'Hanoi Daewoo Hotel', N'12', N'3000', N'img1.jpg', N'0', N'3')
GO

SET IDENTITY_INSERT [dbo].[restaurantDetail] OFF
GO


-- ----------------------------
-- Table structure for service
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[service]') AND type IN ('U'))
	DROP TABLE [dbo].[service]
GO

CREATE TABLE [dbo].[service] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [price] int  NULL,
  [status] bit  NULL,
  [type] int  NULL,
  [description] nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [image] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[service] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of service
-- ----------------------------
SET IDENTITY_INSERT [dbo].[service] ON
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'1', N'Combo 1', N'5500000', N'1', N'1', N'ABCxyzssssss', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'2', N'Combo trang trí bàn Gallery 2', N'950000', N'1', N'1', N'Hello', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'3', N'Ban nhạc điện tử 2.0', N'2000000', N'1', N'2', N'uuu', N'img2.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'4', N'Ban nhạc acoustic', N'2000000', N'1', N'2', N'asd', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'5', N'Vũ đoàn', N'1000000', N'1', N'2', N'sfhg', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'6', N'ca si 5', N'800000', N'1', N'3', N'zdfgb', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'7', N'ca si 1', N'900000', N'0', N'3', N'zfdhb', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'10', N'Test', N'123456', N'1', N'6', N'hhhhhhhh', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'12', N'MC tập sự', N'800000', N'1', N'4', N'VIP', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'13', N'Chụp ảnh cưới giá rẻ', N'464656', N'0', N'5', N'ghjhj', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'14', N'Quay phim rrrr', N'12345', N'1', N'5', N'gdhgfhg', N'img4.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'16', N'Test 2', N'67567', N'1', N'1', N'gfgjh', N'img7.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'23', N'Test', N'9999999', N'1', N'1', N'gfjghjggghh', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'24', N'dgsgf', N'56457', N'1', N'1', N'fdhdfh', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'25', N'xyzabc', N'10000000', N'1', N'1', N'dfhfgh', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'26', N'xyz', N'636456', N'1', N'1', N'gjfjf', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'27', N'ca si 4', N'46365', N'1', N'3', N'fhgdh', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'28', N'Một hai ba', N'34566', N'0', N'1', N'gfjfhjg', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'29', N'hhhhhh', N'4444444', N'0', N'1', N'gggggggggggg', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'30', N'gggggggggggggggggggggggggggggggggghhhhhhhhhhhhhhhh', N'747', N'1', N'1', N'kjkkkkkkkkkkkkkkkk', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'31', N'test...test', N'6666666', N'0', N'1', N'ghhhhhhhhhhhh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'32', N'fdhgfhhhgfjgfhj', N'5747', N'0', N'5', N'dghghfg', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'33', N'test123', N'1234', N'1', N'1', N'ghfgfgh', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'34', N'i987', N'2365275', N'1', N'1', N'abcxyz', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'35', N'i456', N'12345', N'1', N'1', N'fgdhdhgd', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'36', N'i476576', N'76476', N'1', N'1', N'hfghgfh', N'test.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'37', N'i1242342', N'1234556', N'1', N'5', N'sfgfgdf', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'38', N'ffffffffffffffffffffffffffffffffffffffffffffffffff', N'1236545', N'1', N'1', N'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffai', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'39', N'Home', N'1233333', N'1', N'1', N'sssss', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'40', N'test vinhdiep', N'12222', N'1', N'1', N'11111', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'41', N'sssss', N'112222', N'1', N'2', N'sssss', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'42', N'test 1', N'122222', N'1', N'2', N'33333', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'43', N'mot', N'122222', N'1', N'1', N'2dđ', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'44', N'Món ngon số 1', N'5500000', N'1', N'1', N'ABCxyz', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'45', N'Món ngon số 2', N'950000', N'1', N'1', N'Hello', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'46', N'Món ngon số 3', N'2000000', N'1', N'2', N'uuu', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'47', N'Gà tần', N'2000000', N'1', N'2', N'asd', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'48', N'CHuọt hấp', N'1000000', N'1', N'2', N'sfhg', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'49', N'ca si 2', N'800000', N'1', N'3', N'zdfgb', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'50', N'ca si 3', N'900000', N'0', N'3', N'zfdhb', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'51', N'Món lạ3', N'123456', N'1', N'6', N'hhhhhhhh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'52', N'Bia', N'800000', N'1', N'4', N'VIP', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'53', N'Nước cam', N'464656', N'0', N'5', N'ghjhj', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'54', N'Món vớ vẩn', N'1234', N'1', N'5', N'gdhgfhg', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'55', N'Test1', N'67567', N'1', N'1', N'gfgjh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'56', N'Test', N'9999999', N'1', N'1', N'gfjghj', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'57', N'dgsgf', N'56457', N'1', N'1', N'fdhdfh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'58', N'xyzabc', N'10000000', N'1', N'1', N'dfhfgh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'59', N'dich vu 1', N'1222222', N'1', N'1', N'dich vu 1 ddddd', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'60', N'ca si', N'1200000', N'1', N'3', N'ca sĩ hát hay', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'61', N'test 1', N'1234444', N'1', N'1', N'sssss', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'62', N'dich vu 1', N'123000', N'1', N'2', N'ca si hat ahy', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'63', N'dich vu 2', N'122222', N'0', N'2', N'33323', N'logo.png')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'64', N'dich vu hat ho', N'200000', N'1', N'1', N'hahaa', N'img7.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'65', N'DIch vu them', N'3200000', N'1', N'1', N'sssssss', N'img4.jpg')
GO

SET IDENTITY_INSERT [dbo].[service] OFF
GO


-- ----------------------------
-- Table structure for serviceOrderd
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[serviceOrderd]') AND type IN ('U'))
	DROP TABLE [dbo].[serviceOrderd]
GO

CREATE TABLE [dbo].[serviceOrderd] (
  [idOrder] int  NULL,
  [idService] int  NULL,
  [quantity] int  NULL
)
GO

ALTER TABLE [dbo].[serviceOrderd] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of serviceOrderd
-- ----------------------------
INSERT INTO [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (N'15', N'1', N'1')
GO

INSERT INTO [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (N'15', N'2', N'3')
GO

INSERT INTO [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (N'16', N'3', N'1')
GO

INSERT INTO [dbo].[serviceOrderd] ([idOrder], [idService], [quantity]) VALUES (N'16', N'4', N'1')
GO


-- ----------------------------
-- Table structure for statusOrder
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[statusOrder]') AND type IN ('U'))
	DROP TABLE [dbo].[statusOrder]
GO

CREATE TABLE [dbo].[statusOrder] (
  [id] int  NOT NULL,
  [status] nvarchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[statusOrder] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of statusOrder
-- ----------------------------
INSERT INTO [dbo].[statusOrder] ([id], [status]) VALUES (N'1', N'Đang chờ duyệt')
GO

INSERT INTO [dbo].[statusOrder] ([id], [status]) VALUES (N'3', N'Đã đặt')
GO

INSERT INTO [dbo].[statusOrder] ([id], [status]) VALUES (N'4', N'Đã huỷ')
GO

INSERT INTO [dbo].[statusOrder] ([id], [status]) VALUES (N'5', N'Đã hoàn thành')
GO


-- ----------------------------
-- Table structure for tower
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[tower]') AND type IN ('U'))
	DROP TABLE [dbo].[tower]
GO

CREATE TABLE [dbo].[tower] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL,
  [ofCity] int  NULL
)
GO

ALTER TABLE [dbo].[tower] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of tower
-- ----------------------------
SET IDENTITY_INSERT [dbo].[tower] ON
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'1', N'Quận A', N'1')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'2', N'Quận B', N'1')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'3', N'Quận C', N'1')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'4', N'Quận 1', N'2')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'5', N'Quận 2', N'2')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'6', N'Quận 3', N'2')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'7', N'Quận X', N'3')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'8', N'Quận Y', N'3')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'9', N'Quận Z', N'3')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'10', N'Huyện A', N'4')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'11', N'Huyện B', N'4')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'12', N'Huyện C', N'4')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'13', N'Huyện 1', N'5')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'14', N'Huyện 2', N'5')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'15', N'Huyện 3', N'5')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'16', N'Huyện X', N'6')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'17', N'Huyện Y', N'6')
GO

INSERT INTO [dbo].[tower] ([id], [name], [ofCity]) VALUES (N'18', N'Huyện Z', N'6')
GO

SET IDENTITY_INSERT [dbo].[tower] OFF
GO


-- ----------------------------
-- Table structure for typeRestaurant
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[typeRestaurant]') AND type IN ('U'))
	DROP TABLE [dbo].[typeRestaurant]
GO

CREATE TABLE [dbo].[typeRestaurant] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[typeRestaurant] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of typeRestaurant
-- ----------------------------
SET IDENTITY_INSERT [dbo].[typeRestaurant] ON
GO

INSERT INTO [dbo].[typeRestaurant] ([id], [name]) VALUES (N'1', N'Nhà hàng')
GO

INSERT INTO [dbo].[typeRestaurant] ([id], [name]) VALUES (N'2', N'Trung tâm')
GO

INSERT INTO [dbo].[typeRestaurant] ([id], [name]) VALUES (N'3', N'Khách sạn')
GO

SET IDENTITY_INSERT [dbo].[typeRestaurant] OFF
GO


-- ----------------------------
-- Table structure for typeService
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[typeService]') AND type IN ('U'))
	DROP TABLE [dbo].[typeService]
GO

CREATE TABLE [dbo].[typeService] (
  [id] int  IDENTITY(1,1) NOT NULL,
  [name] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL
)
GO

ALTER TABLE [dbo].[typeService] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Records of typeService
-- ----------------------------
SET IDENTITY_INSERT [dbo].[typeService] ON
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'1', N'Trang trí')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'2', N'Vũ đoàn')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'3', N'Ca sĩ')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'4', N'MC')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'5', N'Quay phim - chụp ảnh')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'6', N'Xe cưới')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'7', N'Món chính')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'8', N'Khai vị')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'9', N'Đồ uống')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'10', N'Món tráng miệng')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'11', N'Món lẩu')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'12', N'Món nướng')
GO

SET IDENTITY_INSERT [dbo].[typeService] OFF
GO


-- ----------------------------
-- Auto increment value for city
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[city]', RESEED, 6)
GO


-- ----------------------------
-- Primary Key structure for table city
-- ----------------------------
ALTER TABLE [dbo].[city] ADD CONSTRAINT [PK__city__3213E83F23666623] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for comboFood
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[comboFood]', RESEED, 4)
GO


-- ----------------------------
-- Primary Key structure for table comboFood
-- ----------------------------
ALTER TABLE [dbo].[comboFood] ADD CONSTRAINT [PK__comboFoo__3213E83F6C648FE5] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Food
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Food]', RESEED, 5)
GO


-- ----------------------------
-- Primary Key structure for table Food
-- ----------------------------
ALTER TABLE [dbo].[Food] ADD CONSTRAINT [PK__Food__3213E83FF588CA01] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for listOrder
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[listOrder]', RESEED, 25)
GO


-- ----------------------------
-- Primary Key structure for table listOrder
-- ----------------------------
ALTER TABLE [dbo].[listOrder] ADD CONSTRAINT [PK__listOrde__3213E83F6F8FBF40] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for Promotion
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[Promotion]', RESEED, 7)
GO


-- ----------------------------
-- Uniques structure for table Promotion
-- ----------------------------
ALTER TABLE [dbo].[Promotion] ADD CONSTRAINT [UQ__Promotio__72E12F1B988F2EC9] UNIQUE NONCLUSTERED ([name] ASC)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table Promotion
-- ----------------------------
ALTER TABLE [dbo].[Promotion] ADD CONSTRAINT [PK__Promotio__3214EC27C359D9D0] PRIMARY KEY CLUSTERED ([ID])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for restaurantDetail
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[restaurantDetail]', RESEED, 15)
GO


-- ----------------------------
-- Primary Key structure for table restaurantDetail
-- ----------------------------
ALTER TABLE [dbo].[restaurantDetail] ADD CONSTRAINT [PK__restaura__3213E83F6C563019] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for service
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[service]', RESEED, 65)
GO


-- ----------------------------
-- Primary Key structure for table service
-- ----------------------------
ALTER TABLE [dbo].[service] ADD CONSTRAINT [PK__service__3213E83FD9D96088] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table statusOrder
-- ----------------------------
ALTER TABLE [dbo].[statusOrder] ADD CONSTRAINT [PK__statusOr__3213E83F2E06B916] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for tower
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[tower]', RESEED, 18)
GO


-- ----------------------------
-- Primary Key structure for table tower
-- ----------------------------
ALTER TABLE [dbo].[tower] ADD CONSTRAINT [PK__tower__3213E83FA7F277C8] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for typeRestaurant
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[typeRestaurant]', RESEED, 3)
GO


-- ----------------------------
-- Primary Key structure for table typeRestaurant
-- ----------------------------
ALTER TABLE [dbo].[typeRestaurant] ADD CONSTRAINT [PK_typeRestaurant] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for typeService
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[typeService]', RESEED, 12)
GO


-- ----------------------------
-- Primary Key structure for table typeService
-- ----------------------------
ALTER TABLE [dbo].[typeService] ADD CONSTRAINT [PK__typeServ__3213E83F4F287B32] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table comboFoodOrderd
-- ----------------------------
ALTER TABLE [dbo].[comboFoodOrderd] ADD CONSTRAINT [FK__comboFood__idCom__3A81B327] FOREIGN KEY ([idComboFood]) REFERENCES [dbo].[comboFood] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table feedback
-- ----------------------------
ALTER TABLE [dbo].[feedback] ADD CONSTRAINT [FK__feedback__idRest__3B75D760] FOREIGN KEY ([idRestaurant]) REFERENCES [dbo].[restaurantDetail] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table foodOrderd
-- ----------------------------
ALTER TABLE [dbo].[foodOrderd] ADD CONSTRAINT [FK__foodOrder__idFoo__3C69FB99] FOREIGN KEY ([idFood]) REFERENCES [dbo].[Food] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table imageDetail
-- ----------------------------
ALTER TABLE [dbo].[imageDetail] ADD CONSTRAINT [FK__imageDetail__id__3D5E1FD2] FOREIGN KEY ([id]) REFERENCES [dbo].[restaurantDetail] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table listOrder
-- ----------------------------
ALTER TABLE [dbo].[listOrder] ADD CONSTRAINT [FK__listOrder__statu__3E52440B] FOREIGN KEY ([status]) REFERENCES [dbo].[statusOrder] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table restaurantDetail
-- ----------------------------
ALTER TABLE [dbo].[restaurantDetail] ADD CONSTRAINT [FK__restauran__tower__3F466844] FOREIGN KEY ([tower]) REFERENCES [dbo].[tower] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

ALTER TABLE [dbo].[restaurantDetail] ADD CONSTRAINT [FK_restaurantDetail_typeRestaurant] FOREIGN KEY ([type]) REFERENCES [dbo].[typeRestaurant] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table service
-- ----------------------------
ALTER TABLE [dbo].[service] ADD CONSTRAINT [FK_service_typeService] FOREIGN KEY ([type]) REFERENCES [dbo].[typeService] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table serviceOrderd
-- ----------------------------
ALTER TABLE [dbo].[serviceOrderd] ADD CONSTRAINT [FK__serviceOr__idSer__4222D4EF] FOREIGN KEY ([idService]) REFERENCES [dbo].[service] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO


-- ----------------------------
-- Foreign Keys structure for table tower
-- ----------------------------
ALTER TABLE [dbo].[tower] ADD CONSTRAINT [FK__tower__ofCity__4316F928] FOREIGN KEY ([ofCity]) REFERENCES [dbo].[city] ([id]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

