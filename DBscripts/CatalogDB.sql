-- USE [catalog]
-- GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CatalogItemId] [int] NOT NULL,
	[BasketId] [int] NOT NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerId] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Baskets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[PictureUri] [nvarchar](max) NULL,
	[CatalogTypeId] [int] NOT NULL,
	[CatalogBrandId] [int] NOT NULL,
 CONSTRAINT [PK_Catalog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogBrands]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogBrands](
	[Id] [int] NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CatalogBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatalogTypes]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogTypes](
	[Id] [int] NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CatalogTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemOrdered_CatalogItemId] [int] NULL,
	[ItemOrdered_ProductName] [nvarchar](50) NULL,
	[ItemOrdered_PictureUri] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
	[Units] [int] NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08-06-2023 18:00:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuyerId] [nvarchar](256) NOT NULL,
	[OrderDate] [datetimeoffset](7) NOT NULL,
	[ShipToAddress_Street] [nvarchar](180) NOT NULL,
	[ShipToAddress_City] [nvarchar](100) NOT NULL,
	[ShipToAddress_State] [nvarchar](60) NULL,
	[ShipToAddress_Country] [nvarchar](90) NOT NULL,
	[ShipToAddress_ZipCode] [nvarchar](18) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (1, N'.NET Bot Black Sweatshirt', N'.NET Bot Black Sweatshirt', CAST(19.50 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/1.png', 2, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (2, N'.NET Black & White Mug', N'.NET Black & White Mug', CAST(8.50 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/2.png', 1, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (3, N'Prism White T-Shirt', N'Prism White T-Shirt', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/3.png', 2, 5)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (4, N'.NET Foundation Sweatshirt', N'.NET Foundation Sweatshirt', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/4.png', 2, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (5, N'Roslyn Red Sheet', N'Roslyn Red Sheet', CAST(8.50 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/5.png', 3, 5)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (6, N'.NET Blue Sweatshirt', N'.NET Blue Sweatshirt', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/6.png', 2, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (7, N'Roslyn Red T-Shirt', N'Roslyn Red T-Shirt', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/7.png', 2, 5)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (8, N'Kudu Purple Sweatshirt', N'Kudu Purple Sweatshirt', CAST(8.50 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/8.png', 2, 5)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (9, N'Cup<T> White Mug', N'Cup<T> White Mug', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/9.png', 1, 5)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (10, N'.NET Foundation Sheet', N'.NET Foundation Sheet', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/10.png', 3, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (11, N'Cup<T> Sheet', N'Cup<T> Sheet', CAST(8.50 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/11.png', 3, 2)
GO
INSERT [dbo].[Catalog] ([Id], [Name], [Description], [Price], [PictureUri], [CatalogTypeId], [CatalogBrandId]) VALUES (12, N'Prism White TShirt', N'Prism White TShirt', CAST(12.00 AS Decimal(18, 2)), N'http://catalogbaseurltobereplaced/images/products/12.png', 2, 5)
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (1, N'Azure')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (2, N'.NET')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (3, N'Visual Studio')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (4, N'SQL Server')
GO
INSERT [dbo].[CatalogBrands] ([Id], [Brand]) VALUES (5, N'Other')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (1, N'Mug')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (2, N'T-Shirt')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (3, N'Sheet')
GO
INSERT [dbo].[CatalogTypes] ([Id], [Type]) VALUES (4, N'USB Memory Stick')
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [BuyerId]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShipToAddress_Street]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShipToAddress_City]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShipToAddress_Country]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (N'') FOR [ShipToAddress_ZipCode]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Baskets_BasketId] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Baskets] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Baskets_BasketId]
GO
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_CatalogBrands_CatalogBrandId] FOREIGN KEY([CatalogBrandId])
REFERENCES [dbo].[CatalogBrands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_CatalogBrands_CatalogBrandId]
GO
ALTER TABLE [dbo].[Catalog]  WITH CHECK ADD  CONSTRAINT [FK_Catalog_CatalogTypes_CatalogTypeId] FOREIGN KEY([CatalogTypeId])
REFERENCES [dbo].[CatalogTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Catalog] CHECK CONSTRAINT [FK_Catalog_CatalogTypes_CatalogTypeId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
