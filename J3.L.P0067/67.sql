create database Restaurant
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

CREATE TABLE [dbo].[typeService](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Món ngon số 1', 5500000, 1, 1, N'ABCxyz', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES (N'Món ngon số 2', 950000, 1, 1, N'Hello', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Món ngon số 3', 2000000, 1, 2, N'uuu', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Gà tần', 2000000, 1, 2, N'asd', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'CHuọt hấp', 1000000, 1, 2, N'sfhg', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Món lạ1', 800000, 1, 3, N'zdfgb', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Món lạ12', 900000, 0, 3, N'zfdhb', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Món lạ3', 123456, 1, 6, N'hhhhhhhh', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Bia', 800000, 1, 4, N'VIP', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Nước cam', 464656, 0, 5, N'ghjhj', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES (N'Món vớ vẩn', 1234, 1, 5, N'gdhgfhg', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Test1', 67567, 1, 1, N'gfgjh', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'Test', 9999999, 1, 1, N'gfjghj', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'dgsgf', 56457, 1, 1, N'fdhdfh', N'Dichvu.jpg')
INSERT [dbo].[service] ( [name], [price], [status], [type], [description], [image]) VALUES ( N'xyzabc', 10000000, 1, 1, N'dfhfgh', N'Dichvu.jpg')

GO

INSERT [dbo].[typeService] ( [name]) VALUES ( N'Món chính')
INSERT [dbo].[typeService] ( [name]) VALUES ( N'Khai vị')
INSERT [dbo].[typeService] ( [name]) VALUES ( N'Đồ uống')
INSERT [dbo].[typeService] ([name]) VALUES ( N'Món tráng miệng')
INSERT [dbo].[typeService] ( [name]) VALUES ( N'Món lẩu')
INSERT [dbo].[typeService] ([name]) VALUES ( N'Món nướng')