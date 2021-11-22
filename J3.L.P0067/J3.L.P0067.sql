/*
 Navicat Premium Data Transfer

 Source Server         : Microsoft SQL
 Source Server Type    : SQL Server
 Source Server Version : 15002080
 Source Host           : localhost:1433
 Source Catalog        : RestaurantP0067
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 15002080
 File Encoding         : 65001

 Date: 23/11/2021 01:07:38
*/


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

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'1', N'mon 1', N'5500000', N'1', N'1', N'ABCxyz', N'img7.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'2', N'mon 2', N'950000', N'1', N'1', N'Hello', N'img5.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'3', N'mon 3', N'2000000', N'1', N'2', N'uuu', N'img4.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'4', N'tom chien', N'2000000', N'1', N'2', N'asd', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'5', N'ga hap', N'1000000', N'1', N'2', N'sfhg', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'6', N'chim xao', N'800000', N'1', N'3', N'zdfgb', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'7', N'Món lạ12', N'900000', N'0', N'3', N'zfdhb', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'8', N'Món lạ3', N'123456', N'1', N'6', N'hhhhhhhh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'9', N'Bia', N'800000', N'1', N'4', N'VIP', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'10', N'Nước cam', N'464656', N'0', N'5', N'ghjhj', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'11', N'bo nuong bitter', N'12343', N'1', N'5', N'gdhgfhg', N'img3.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'12', N'Test1', N'67567', N'1', N'1', N'gfgjh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'13', N'Test', N'9999999', N'1', N'1', N'gfjghj', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'14', N'dgsgf', N'56457', N'1', N'1', N'fdhdfh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'15', N'xyzabc', N'10000000', N'1', N'1', N'dfhfgh', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'16', N'banana', N'120000', N'1', N'1', N'cá ngon', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'17', N'chicken', N'1500000', N'1', N'1', N'abcdef ga ngon', N'Dichvu.jpg')
GO

INSERT INTO [dbo].[service] ([id], [name], [price], [status], [type], [description], [image]) VALUES (N'1002', N'Mon an 1', N'2222222', N'1', N'2', N'mo ta mon an', N'img1.jpg')
GO

SET IDENTITY_INSERT [dbo].[service] OFF
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

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'1', N'Món chính')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'2', N'Khai vị')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'3', N'Đồ uống')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'4', N'Món tráng miệng')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'5', N'Món lẩu')
GO

INSERT INTO [dbo].[typeService] ([id], [name]) VALUES (N'6', N'Món nướng')
GO

SET IDENTITY_INSERT [dbo].[typeService] OFF
GO


-- ----------------------------
-- Auto increment value for service
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[service]', RESEED, 1002)
GO


-- ----------------------------
-- Primary Key structure for table service
-- ----------------------------
ALTER TABLE [dbo].[service] ADD CONSTRAINT [PK__service__3213E83F6E863088] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Auto increment value for typeService
-- ----------------------------
DBCC CHECKIDENT ('[dbo].[typeService]', RESEED, 1001)
GO


-- ----------------------------
-- Primary Key structure for table typeService
-- ----------------------------
ALTER TABLE [dbo].[typeService] ADD CONSTRAINT [PK__typeServ__3213E83FF564AA31] PRIMARY KEY CLUSTERED ([id])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO

