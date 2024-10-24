USE [master]
GO
/****** Object:  Database [eBay]    Script Date: 10/21/2024 3:57:08 PM ******/
CREATE DATABASE [eBay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eBay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\eBay.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eBay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\eBay_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [eBay] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eBay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eBay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eBay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eBay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eBay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eBay] SET ARITHABORT OFF 
GO
ALTER DATABASE [eBay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eBay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eBay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eBay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eBay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eBay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eBay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eBay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eBay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eBay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eBay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eBay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eBay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eBay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eBay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eBay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eBay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eBay] SET RECOVERY FULL 
GO
ALTER DATABASE [eBay] SET  MULTI_USER 
GO
ALTER DATABASE [eBay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eBay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eBay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eBay] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eBay] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eBay] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eBay', N'ON'
GO
ALTER DATABASE [eBay] SET QUERY_STORE = ON
GO
ALTER DATABASE [eBay] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [eBay]
GO
/****** Object:  Table [dbo].[Cart_Items]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart_Items](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[cart_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[order_status] [nvarchar](50) NULL,
	[order_date] [datetime] NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[payment_method] [nvarchar](50) NOT NULL,
	[payment_status] [nvarchar](50) NULL,
	[payment_date] [datetime] NULL,
	[amount] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock_quantity] [int] NULL,
	[image_url] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[review_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2024 3:57:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[role] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart_Items] ON 

INSERT [dbo].[Cart_Items] ([cart_item_id], [cart_id], [product_id], [quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Cart_Items] ([cart_item_id], [cart_id], [product_id], [quantity]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Cart_Items] ([cart_item_id], [cart_id], [product_id], [quantity]) VALUES (3, 2, 3, 2)
SET IDENTITY_INSERT [dbo].[Cart_Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([cart_id], [user_id], [created_at]) VALUES (1, 1, CAST(N'2024-10-21T15:53:04.630' AS DateTime))
INSERT [dbo].[Carts] ([cart_id], [user_id], [created_at]) VALUES (2, 2, CAST(N'2024-10-21T15:53:04.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (1, N'Electronics', N'Devices, gadgets, and home electronics')
INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (2, N'Fashion', N'Clothing, footwear, and accessories')
INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (3, N'Home & Garden', N'Furniture, appliances, and home decor')
INSERT [dbo].[Categories] ([category_id], [category_name], [description]) VALUES (4, N'Toys & Games', N'Toys, board games, and video games')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 1, CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[Order_Details] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (2, 2, 3, 1, CAST(89.99 AS Decimal(10, 2)))
INSERT [dbo].[Order_Details] ([order_detail_id], [order_id], [product_id], [quantity], [price]) VALUES (3, 3, 2, 1, CAST(1199.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [user_id], [order_status], [order_date], [total_amount]) VALUES (1, 1, N'shipped', CAST(N'2024-10-21T15:52:48.197' AS DateTime), CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_status], [order_date], [total_amount]) VALUES (2, 2, N'pending', CAST(N'2024-10-21T15:52:48.197' AS DateTime), CAST(89.99 AS Decimal(10, 2)))
INSERT [dbo].[Orders] ([order_id], [user_id], [order_status], [order_date], [total_amount]) VALUES (3, 1, N'delivered', CAST(N'2024-10-21T15:52:48.197' AS DateTime), CAST(1199.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([payment_id], [order_id], [payment_method], [payment_status], [payment_date], [amount]) VALUES (1, 1, N'credit_card', N'completed', CAST(N'2024-10-21T15:53:21.590' AS DateTime), CAST(699.99 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([payment_id], [order_id], [payment_method], [payment_status], [payment_date], [amount]) VALUES (2, 2, N'paypal', N'pending', CAST(N'2024-10-21T15:53:21.590' AS DateTime), CAST(89.99 AS Decimal(10, 2)))
INSERT [dbo].[Payments] ([payment_id], [order_id], [payment_method], [payment_status], [payment_date], [amount]) VALUES (3, 3, N'bank_transfer', N'completed', CAST(N'2024-10-21T15:53:21.590' AS DateTime), CAST(1199.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [description], [price], [stock_quantity], [image_url], [created_at], [updated_at]) VALUES (1, 1, N'Smartphone', N'Latest smartphone with 5G capability', CAST(699.99 AS Decimal(10, 2)), 50, N'https://via.placeholder.com/150', CAST(N'2024-10-21T15:52:41.363' AS DateTime), CAST(N'2024-10-21T15:52:41.363' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [description], [price], [stock_quantity], [image_url], [created_at], [updated_at]) VALUES (2, 1, N'Laptop', N'High performance laptop for work and gaming', CAST(1199.99 AS Decimal(10, 2)), 30, N'https://via.placeholder.com/150', CAST(N'2024-10-21T15:52:41.363' AS DateTime), CAST(N'2024-10-21T15:52:41.363' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [description], [price], [stock_quantity], [image_url], [created_at], [updated_at]) VALUES (3, 2, N'Sneakers', N'Comfortable sneakers for everyday use', CAST(89.99 AS Decimal(10, 2)), 100, N'https://via.placeholder.com/150', CAST(N'2024-10-21T15:52:41.363' AS DateTime), CAST(N'2024-10-21T15:52:41.363' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [description], [price], [stock_quantity], [image_url], [created_at], [updated_at]) VALUES (4, 3, N'Sofa', N'Comfortable 3-seater sofa', CAST(499.99 AS Decimal(10, 2)), 20, N'https://via.placeholder.com/150', CAST(N'2024-10-21T15:52:41.363' AS DateTime), CAST(N'2024-10-21T15:52:41.363' AS DateTime))
INSERT [dbo].[Products] ([product_id], [category_id], [product_name], [description], [price], [stock_quantity], [image_url], [created_at], [updated_at]) VALUES (5, 4, N'Action Figure', N'Collectible action figure', CAST(29.99 AS Decimal(10, 2)), 200, N'https://via.placeholder.com/150', CAST(N'2024-10-21T15:52:41.363' AS DateTime), CAST(N'2024-10-21T15:52:41.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date]) VALUES (1, 1, 1, 5, N'Amazing smartphone, highly recommend!', CAST(N'2024-10-21T15:53:28.157' AS DateTime))
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date]) VALUES (2, 2, 3, 4, N'Comfortable sneakers, great value!', CAST(N'2024-10-21T15:53:28.157' AS DateTime))
INSERT [dbo].[Reviews] ([review_id], [user_id], [product_id], [rating], [comment], [review_date]) VALUES (3, 1, 2, 5, N'Fantastic laptop, very powerful for gaming!', CAST(N'2024-10-21T15:53:28.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role], [created_at], [updated_at]) VALUES (1, N'john_doe', N'john@example.com', N'password123', N'customer', CAST(N'2024-10-21T15:52:14.363' AS DateTime), CAST(N'2024-10-21T15:52:14.363' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role], [created_at], [updated_at]) VALUES (2, N'jane_doe', N'jane@example.com', N'password456', N'customer', CAST(N'2024-10-21T15:52:14.363' AS DateTime), CAST(N'2024-10-21T15:52:14.363' AS DateTime))
INSERT [dbo].[Users] ([user_id], [username], [email], [password], [role], [created_at], [updated_at]) VALUES (3, N'admin_user', N'admin@example.com', N'adminpass', N'admin', CAST(N'2024-10-21T15:52:14.363' AS DateTime), CAST(N'2024-10-21T15:52:14.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__5189E2550D25FBA9]    Script Date: 10/21/2024 3:57:08 PM ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[category_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E6164AECCCE2E]    Script Date: 10/21/2024 3:57:08 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5721FB77687]    Script Date: 10/21/2024 3:57:08 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart_Items] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[Carts] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ('pending') FOR [order_status]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('pending') FOR [payment_status]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [stock_quantity]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [review_date]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('customer') FOR [role]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[Carts] ([cart_id])
GO
ALTER TABLE [dbo].[Cart_Items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([order_status]='canceled' OR [order_status]='delivered' OR [order_status]='shipped' OR [order_status]='pending'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([payment_method]='bank_transfer' OR [payment_method]='paypal' OR [payment_method]='credit_card'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([payment_status]='failed' OR [payment_status]='completed' OR [payment_status]='pending'))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([role]='admin' OR [role]='customer'))
GO
USE [master]
GO
ALTER DATABASE [eBay] SET  READ_WRITE 
GO
