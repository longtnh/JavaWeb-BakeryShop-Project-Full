USE [master]
GO
/****** Object:  Database [BakeryShop]    Script Date: 11/6/2019 10:08:13 AM ******/
CREATE DATABASE [BakeryShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BakeryShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BakeryShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BakeryShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BakeryShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BakeryShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BakeryShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BakeryShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BakeryShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BakeryShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BakeryShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BakeryShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [BakeryShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BakeryShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BakeryShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BakeryShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BakeryShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BakeryShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BakeryShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BakeryShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BakeryShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BakeryShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BakeryShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BakeryShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BakeryShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BakeryShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BakeryShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BakeryShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BakeryShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BakeryShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BakeryShop] SET  MULTI_USER 
GO
ALTER DATABASE [BakeryShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BakeryShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BakeryShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BakeryShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BakeryShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BakeryShop] SET QUERY_STORE = OFF
GO
USE [BakeryShop]
GO
/****** Object:  User [uyenhtnde130040]    Script Date: 11/6/2019 10:08:14 AM ******/
CREATE USER [uyenhtnde130040] FOR LOGIN [uyenhtnde130040] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/6/2019 10:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[C_id] [int] IDENTITY(1,1) NOT NULL,
	[C_username] [nvarchar](50) NOT NULL,
	[C_password] [nvarchar](50) NOT NULL,
	[C_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[age] [int] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[gender] [nvarchar](5) NOT NULL,
	[role] [int] NOT NULL,
	[status] [int] NOT NULL,
	[boom] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[C_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 11/6/2019 10:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[F_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[feedback] [nvarchar](500) NOT NULL,
	[star] [nvarchar](3) NOT NULL,
	[status] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/6/2019 10:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Or_id] [int] IDENTITY(1,1) NOT NULL,
	[C_id] [int] NOT NULL,
	[total] [int] NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[status] [int] NOT NULL,
	[date] [nvarchar](20) NOT NULL,
	[Staff] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Or_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pro_Order]    Script Date: 11/6/2019 10:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pro_Order](
	[Or_id] [int] NOT NULL,
	[P_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/6/2019 10:08:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_id] [int] IDENTITY(1,1) NOT NULL,
	[P_name] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[stock] [int] NOT NULL,
	[description] [nvarchar](2000) NOT NULL,
	[image] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([C_id], [C_username], [C_password], [C_name], [address], [age], [email], [phone], [gender], [role], [status], [boom]) VALUES (7, N'thaouyen', N'12345678', N'Thảo Uyên', N'Hà Huy Tập, Đà Nẵng', 21, N'thaouyen@gmail.com', N'0123456789', N'Nữ', 2, 0, 0)
INSERT [dbo].[Customer] ([C_id], [C_username], [C_password], [C_name], [address], [age], [email], [phone], [gender], [role], [status], [boom]) VALUES (9, N'huyvu', N'11111111', N'Huy Vũ', N'Điện Bàn, Quảng Nam', 21, N'huyvu@gmail.com', N'0112345678', N'Nam', 2, 1, 3)
INSERT [dbo].[Customer] ([C_id], [C_username], [C_password], [C_name], [address], [age], [email], [phone], [gender], [role], [status], [boom]) VALUES (10, N'hailong', N'12345678', N'Hải Long', N'Đà Nẵng', 21, N'hailong@gmail.com', N'0987654321', N'Nam', 1, 0, 0)
INSERT [dbo].[Customer] ([C_id], [C_username], [C_password], [C_name], [address], [age], [email], [phone], [gender], [role], [status], [boom]) VALUES (11, N'nhatuyen_72', N'12345678', N'Nhật Uyên', N'Quảng Nam', 21, N'nhatuyen@gmail.com', N'0968603458', N'Nữ', 1, 0, 0)
INSERT [dbo].[Customer] ([C_id], [C_username], [C_password], [C_name], [address], [age], [email], [phone], [gender], [role], [status], [boom]) VALUES (12, N'admin', N'admin', N'Admin', N'Chủ Shop', 22, N'admin@gmail.com', N'0789456123', N'Nữ', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([F_id], [first_name], [last_name], [email], [feedback], [star], [status]) VALUES (1, N'Long', N'Truong', N'longtruong@gmail.com', N'Ngon và sạch đó bạn êi', N'5', 1)
INSERT [dbo].[Feedback] ([F_id], [first_name], [last_name], [email], [feedback], [star], [status]) VALUES (2, N'Uyen', N'Huynh', N'uyen@gmail.com', N'Đồ ăn k đc ngon', N'2', 0)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Or_id], [C_id], [total], [phone], [address], [status], [date], [Staff]) VALUES (38, 9, 50, N'0234567890', N'123 ', 4, N'2019-11-06', 11)
INSERT [dbo].[Order] ([Or_id], [C_id], [total], [phone], [address], [status], [date], [Staff]) VALUES (39, 9, 15, N'0123456789', N'QN', 3, N'2019-11-06', 11)
INSERT [dbo].[Order] ([Or_id], [C_id], [total], [phone], [address], [status], [date], [Staff]) VALUES (40, 9, 150, N'0123456789', N'FPT', 4, N'2019-11-06', 11)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[Pro_Order] ([Or_id], [P_id], [quantity], [total]) VALUES (38, 4, 1, 50)
INSERT [dbo].[Pro_Order] ([Or_id], [P_id], [quantity], [total]) VALUES (39, 7, 1, 15)
INSERT [dbo].[Pro_Order] ([Or_id], [P_id], [quantity], [total]) VALUES (40, 5, 1, 150)
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (1, N'Matcha Cookie ', N'Cookie', 65, 7, N'Enjoy your afternoon tea with these buttery, crispy Green Tea Cookies with Matcha powder. The unique flavor of matcha in the cookies is surprisingly delightful!', N'image/MatchaCookies.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (2, N'Gingerbread', N'Cookie ', 40, 9, N'These Gingerbread Men Cookies are as cute as can be. If desired, decorate with raisins, currants or cinnamon red hot candies for eyes and buttons. Or, pipe untinted or colored icing onto cookies', N'image/gingerbread.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (3, N'Coconut Cookie', N'Cookie', 30, 2, N'Buttery, chewy Coconut Cookies! These cookies are made with flake coconut and (optional) caramel chips, then are dunked in dark chocolate and topped off with toasted coconut! These were such a hit with everyone who tried them — everyone was asking me for the recipe!', N'image/coconutcookie.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (4, N'Strawberry Cookie', N'Cookie', 50, 11, N' Jump to Recipe
Easy Strawberry Cookies made with Fresh Strawberries and baked in 15 minutes.  One  bowl, no beaters necessary, soft, delicious cookies. The perfect summertime cookie recipe. ', N'image/strawberrycookie.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (5, N'Tiramisu', N'Cake', 150, 6, N'Mascarpone custard layered with whipped cream and rum and coffee soaked ladyfingers.', N'image/tiramisu.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (6, N'Black Forest', N'Cake', 210, 0, N'This recipe delivers a classic version of the original Black Forest cake with whipped cream frosting and cherry toping', N'image/blackforest.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (7, N'Cappuccino', N'Drink', 15, 14, N'Outside of Italy, cappuccino is a coffee drink that today is typically composed of double espresso and hot milk, with the surface topped with foamed milk. Cappuccinos are most often prepared with an espresso machine.', N'image/capucchino.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (8, N'Milk Tea', N'Drink', 22, 19, N'Recipes contain tea of some kind, flavors of milk, and sugar (optional). Toppings, such as chewy tapioca balls (also known as pearls or boba), popping boba, fruit jelly, grass jelly, agar jelly, and puddings are often added', N'image/milktea5.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (9, N'Strawberry Cake', N'Cake', 180, 7, N'Strawberry Cake with a soft and moist crumb and bursting with fresh strawberry flavor! One of our all-time favorite strawberry recipes.', N'image/strawberrycake.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (10, N'Chocolate Cookie', N'Cookie', 45, 13, N'We named this recipe “Ultimate Chocolate Chip Cookies” because it’s got everything a cookie connoisseur possibly could ask for. With a texture that balances tender and crunchy, it’s a favorite recipe that’s been top-rated by hundreds of satisfied home cooks.', N'image/chocolateCookie.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (11, N'Cheese Cookie', N'Cookie', 60, 16, N'Cheesy and buttery with a little kick of spice – these Thyme and Cheddar Cheese Cookies are a uniquely delicious savory cookie that’s PERFECT as an appetizer, on your cheese board, or even as an edible gift!', N'image/cheeseCookie.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (13, N'Oreo Ice Blended', N'Drink', 40, 8, N'Blend OREO Cookies and ice cream together to make a delicious OREO Milkshake! Milk and chocolate syrup help our OREO Milkshake be extra creamy and tasty.', N'image/oreoIceBlended.jpg')
INSERT [dbo].[Product] ([P_id], [P_name], [type], [price], [stock], [description], [image]) VALUES (14, N'Opera Cake', N'Cake', 200, -1, N'Opera Cake is a rich French dessert, that uses one of the most loved flavor combinations, chocolate and coffee.', N'image/operaCake.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__10A1769D7398E899]    Script Date: 11/6/2019 10:08:14 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[C_username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__AB6E61643896F360]    Script Date: 11/6/2019 10:08:14 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__B43B145F22568973]    Script Date: 11/6/2019 10:08:14 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([C_id])
REFERENCES [dbo].[Customer] ([C_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Pro_Order]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Order_Order] FOREIGN KEY([Or_id])
REFERENCES [dbo].[Order] ([Or_id])
GO
ALTER TABLE [dbo].[Pro_Order] CHECK CONSTRAINT [FK_Pro_Order_Order]
GO
ALTER TABLE [dbo].[Pro_Order]  WITH CHECK ADD  CONSTRAINT [FK_Pro_Order_Product] FOREIGN KEY([P_id])
REFERENCES [dbo].[Product] ([P_id])
GO
ALTER TABLE [dbo].[Pro_Order] CHECK CONSTRAINT [FK_Pro_Order_Product]
GO
USE [master]
GO
ALTER DATABASE [BakeryShop] SET  READ_WRITE 
GO
