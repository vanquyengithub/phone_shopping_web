USE [master]
GO
/****** Object:  Database [PhoneShoppingWeb]    Script Date: 3/17/2021 11:40:11 PM ******/
CREATE DATABASE [PhoneShoppingWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhoneShoppingWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PhoneShoppingWeb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PhoneShoppingWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\PhoneShoppingWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PhoneShoppingWeb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneShoppingWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneShoppingWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhoneShoppingWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhoneShoppingWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PhoneShoppingWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhoneShoppingWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PhoneShoppingWeb] SET  MULTI_USER 
GO
ALTER DATABASE [PhoneShoppingWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhoneShoppingWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhoneShoppingWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhoneShoppingWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PhoneShoppingWeb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PhoneShoppingWeb]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[memory] [nvarchar](50) NOT NULL,
	[ram] [nvarchar](50) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[image] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[categoryID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'1', N'Premium')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'2', N'Economic')
INSERT [dbo].[tblCategories] ([categoryID], [name]) VALUES (N'3', N'Basic')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD2021210458525891', N'OR202121045852589', N'1', 3, CAST(78900360 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD2021210458525892', N'OR202121045852589', N'2', 12, CAST(629042760 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD2021210458525893', N'OR202121045852589', N'4', 13, CAST(159965000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD2021210458525894', N'OR202121045852589', N'6', 2, CAST(15264000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202121104118791', N'OR20212110411879', N'3', 1, CAST(15032000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202121104118792', N'OR20212110411879', N'4', 1, CAST(12305000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202121104118793', N'OR20212110411879', N'5', 1, CAST(6230420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202121104118794', N'OR20212110411879', N'6', 4, CAST(30528000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126920494361', N'OR20212692049436', N'1', 1, CAST(26300120 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126920494362', N'OR20212692049436', N'2', 1, CAST(52420230 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126920494363', N'OR20212692049436', N'3', 1, CAST(15032000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126920494364', N'OR20212692049436', N'4', 1, CAST(12305000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126920494365', N'OR20212692049436', N'5', 1, CAST(6230420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD20212692421641', N'OR2021269242164', N'1', 1, CAST(26300120 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD20212692421642', N'OR2021269242164', N'2', 2, CAST(104840460 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD20212692421643', N'OR2021269242164', N'3', 1, CAST(15032000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD20212692421644', N'OR2021269242164', N'4', 2, CAST(24610000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD20212692421645', N'OR2021269242164', N'5', 1, CAST(6230420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126931533351', N'OR20212693153335', N'1', 2, CAST(52600240 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126931533352', N'OR20212693153335', N'4', 1, CAST(12305000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126931533353', N'OR20212693153335', N'5', 1, CAST(6230420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202126931533354', N'OR20212693153335', N'6', 1, CAST(7632000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512431', N'OR20212875551243', N'1', 1, CAST(26300120 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512432', N'OR20212875551243', N'2', 1, CAST(52420230 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512433', N'OR20212875551243', N'3', 1, CAST(15032000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512434', N'OR20212875551243', N'4', 1, CAST(12305000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512435', N'OR20212875551243', N'5', 1, CAST(6230420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'OD202128755512436', N'OR20212875551243', N'6', 4, CAST(30528000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121045852589', N'lethian', CAST(N'2021-03-10' AS Date), CAST(883172120 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR20212110411879', N'lehongmi', CAST(N'2021-03-11' AS Date), CAST(64095420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR20212111132935', N'lethian', CAST(N'2021-03-11' AS Date), CAST(41199420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121322924294', N'lebinht', CAST(N'2021-03-13' AS Date), CAST(28894420 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR2021214103216250', N'lebinht', CAST(N'2021-03-14' AS Date), CAST(98292650 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121623120245', N'lebinht', CAST(N'2021-03-16' AS Date), CAST(107094230 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121623257480', N'lebinht', CAST(N'2021-03-16' AS Date), CAST(157620710 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121682931947', N'lehongmi', CAST(N'2021-03-16' AS Date), CAST(176534770 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR2021216950717', N'ID20212169456111', CAST(N'2021-03-16' AS Date), CAST(97255770 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR202121695525939', N'ID202121695522645', CAST(N'2021-03-16' AS Date), CAST(127940350 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR20212692049436', N'lebinht', CAST(N'3921-03-06' AS Date), CAST(112287770 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR2021269242164', N'lebinht', CAST(N'2021-03-06' AS Date), CAST(177013000 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR20212693153335', N'lethian', CAST(N'2021-03-06' AS Date), CAST(78767660 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR20212875551243', N'lebinht', CAST(N'2021-03-08' AS Date), CAST(142815770 AS Decimal(18, 0)))
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'OR2021317112840986', N'ID202121711252749', CAST(N'2021-03-17' AS Date), CAST(130189120 AS Decimal(18, 0)))
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'1', N'Apple iPhone 12 Pro 5G Dual eSIM 512G 6GB RAM Pacific Blue', N'512G', N'6GB', N'Pacific Blue', N'Apple iPhone 12 Pro 5G Dual eSIM 512G 6GB RAM Pacific Blue.jpg', 152, CAST(26300120 AS Decimal(18, 0)), N'1')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'2', N'Samsung Galaxy Z Fold 2 5G Dual eSIM 256GB 12GB RAM SM-F916B Mystic Black', N'256GB', N'12GB', N'Mystic Black', N'Samsung Galaxy Z Fold 2 5G Dual eSIM 256GB 12GB RAM SM-F916B Mystic Black.jpg', 494, CAST(52420230 AS Decimal(18, 0)), N'1')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'3', N'Google Pixel 5 5G Dual eSIM 128GB 8GB RAM Black', N'128GB', N'8GB', N'Black', N'Google Pixel 5 5G Dual eSIM 128GB 8GB RAM Black.jpg', 395, CAST(15032000 AS Decimal(18, 0)), N'2')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'4', N'Xiaomi Mi 10T Pro 5G Dual SIM 128GB 8GB RAM Black', N'128GB', N'8GB', N'Black', N'Xiaomi Mi 10T Pro 5G Dual SIM 128GB 8GB RAM Black.jpg', 439, CAST(12305000 AS Decimal(18, 0)), N'2')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'5', N'Samsung Galaxy A50 Dual SIM 128GB 4GB RAM SM-A505F-DS Black', N'128GB', N'4GB', N'Black', N'Samsung Galaxy A50 Dual SIM 128GB 4GB RAM SM-A505F-DS Black.jpg', 615, CAST(6230420 AS Decimal(18, 0)), N'3')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'6', N'Realme 7 Dual SIM 64GB 6GB RAM Mist Blue', N'64GB', N'6GB', N'Mist Blue', N'Realme 7 Dual SIM 64GB 6GB RAM Mist Blue.jpg', 574, CAST(7632000 AS Decimal(18, 0)), N'3')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'7', N'Nokia 5.3 Dual SIM 64GB 3GB RAM Cyan Blue', N'64GB', N'3GB', N'Cyan Blue', N'Nokia 5.3 Dual SIM 64GB 3GB RAM Cyan Blue.jpg', 800, CAST(16483000 AS Decimal(18, 0)), N'2')
INSERT [dbo].[tblProducts] ([productID], [name], [memory], [ram], [color], [image], [quantity], [price], [categoryID]) VALUES (N'8', N'OnePlus Nord 5G Dual SIM 128GB 8GB RAM Blue', N'128GB', N'8GB', N'Blue', N'OnePlus Nord 5G Dual SIM 128GB 8GB RAM Blue.jpg', 750, CAST(4560000 AS Decimal(18, 0)), N'3')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([roleID], [name]) VALUES (N'US', N'user')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'ID202121695522645', N'Le Hong An', N'', N'21 Le Loi', N'0948321221', N'vanquyenwork2020@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'ID202121711252749', N'Hoang Long', N'', N'12 Le Loi', N'0984345321', N'vanquyenwork2020@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'lebinht', N'Le Binh T', N'654321', N'45 Nguyen Phuc Chu', N'0984625254', N'vanquyenwork2020@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'leminhtri', N'Le Minh Tri', N'123456', N'56 Le Linh', N'0831584486', N'leminhtri@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'lethian', N'Le Thi An', N'123456', N'112/7 Le Loi', N'0865312844', N'vanquyenwork2020@gmail.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'nguyenvanq', N'Nguyen Van Q', N'123456', N'12 Hong Bang', N'0986541933', N'dsf@sf.svd', N'AD')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [email], [roleID]) VALUES (N'tranchitai', N'Tran Chi Tai', N'123456', N'112 Tran Thanh Tong', N'0898313122', N'tranchitai@gmail.com', N'AD')
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 3/17/2021 11:40:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser] @userID nvarchar(50)
AS
BEGIN
  if(exists(select * from tblUsers where userID = @userID))
		begin
			--Bo cac rang buoc
			Alter table tblOrders nocheck constraint all
			--xoa du lieu trong bang KH
			delete from tblUsers
			where userID = @userID
			--Nap lai cac rang buoc
			Alter table tblOrders check constraint all
		end	
	else
		return
END

GO
USE [master]
GO
ALTER DATABASE [PhoneShoppingWeb] SET  READ_WRITE 
GO
