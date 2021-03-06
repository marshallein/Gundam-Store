USE [master]
GO
/****** Object:  Database [gunplaStore]    Script Date: 4/2/2021 5:15:42 PM ******/
CREATE DATABASE [gunplaStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gunplaStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gunplaStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gunplaStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\gunplaStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [gunplaStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gunplaStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gunplaStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gunplaStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gunplaStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gunplaStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gunplaStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [gunplaStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gunplaStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gunplaStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gunplaStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gunplaStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gunplaStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gunplaStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gunplaStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gunplaStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gunplaStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gunplaStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gunplaStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gunplaStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gunplaStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gunplaStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gunplaStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gunplaStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gunplaStore] SET RECOVERY FULL 
GO
ALTER DATABASE [gunplaStore] SET  MULTI_USER 
GO
ALTER DATABASE [gunplaStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gunplaStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gunplaStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gunplaStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gunplaStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gunplaStore', N'ON'
GO
ALTER DATABASE [gunplaStore] SET QUERY_STORE = OFF
GO
USE [gunplaStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/2/2021 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[isSell] [int] NOT NULL,
	[isAdmin] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/2/2021 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](max) NOT NULL,
	[cateDescription] [nvarchar](max) NOT NULL,
	[cateURL] [nvarchar](max) NULL,
	[cateImageURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/2/2021 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[accID] [int] NOT NULL,
	[listOfOrder] [nvarchar](max) NOT NULL,
	[totalMoney] [int] NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[Phone] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
	[customer] [nvarchar](max) NOT NULL,
	[date] [nvarchar](max) NOT NULL,
	[status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/2/2021 5:15:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pname] [nvarchar](max) NOT NULL,
	[price] [int] NOT NULL,
	[imageURL] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[sellID] [int] NOT NULL,
	[cateID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (1, N'Antran', N'1234', 1, 1)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (2, N'Sellman', N'1234', 1, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (3, N'Adminman', N'1234', 0, 1)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (4, N'Buyerman', N'1234', 0, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (5, N'Buyerman2', N'1234', 0, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (16, N'Anasabuyer', N'1234', 0, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (17, N'hanhngu', N'1234', 0, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (18, N'Nguyen Tran Hoang', N'19102001', 0, 0)
INSERT [dbo].[Account] ([accID], [username], [password], [isSell], [isAdmin]) VALUES (19, N'antran2', N'123456', 0, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cateID], [cateName], [cateDescription], [cateURL], [cateImageURL]) VALUES (1, N'MG 1/100', N'Master Grade (MG) (マスターグレード) is a line of 1/100 scale Gunpla kits of the Mobile Suits in the Gundam meta series. The series was first produced in 1995 as part of the Gundam 15th Anniversary project.

Master Grade kits differ from other 1/100 scale Gunpla, with their level of detail, articulation, and proportions being second only to the Perfect Grade line. A majority of MG kits feature a skeletal inner frame with working hydraulics, some also accommodate Gunpla LED Units for light-up gimmicks. To give viewers a perspective of the Mobile Suit''s size, many MG kits come with 1/100 scale figurines of the pilots or key characters of their respective series. In addition, some kits include 1/20 scale character figures.', N'https://gundam.fandom.com/wiki/Master_Grade', N'MGlogo.jpg')
INSERT [dbo].[Category] ([cateID], [cateName], [cateDescription], [cateURL], [cateImageURL]) VALUES (2, N'HG 1/144', N'The highly anticipated HG Universal Century series, commonly called the HGUC series, was released in May 1999. Created in an easy to collect 1:144 scale, it represented a chance to release versions of many Mobile Suits for the first time in kit form using refined designs and modern injection moulding technology. The high quality of the HGUC series makes it the rightful heir of the HG series released in the 1990s. New designs, with new mechanical improvements, continue to be introduced in the series even today. Furthermore, all modern 1/144 HG models, such as the Gundam SEED line, are built to the same quality of early HGUC models. Starting in 2010 the HGUC line incorporated mobile suits from the alternate timelines that had not received an HG release. In 2013 Bandai launched the "All Gundam Project" in conjunction with the release of Gundam Build Fighters to release all lead Gundams with the universal joint technology in the High Grade line.', N'https://gundam.fandom.com/wiki/High_Grade', N'HGlogo.jpg')
INSERT [dbo].[Category] ([cateID], [cateName], [cateDescription], [cateURL], [cateImageURL]) VALUES (3, N'RG 1/144', N'Real Grade (RG) (リアルグレード) is a line of Gunpla kits by Bandai that was introduced in 2010 as part of the Gundam 30th Anniversary commemoration project. These consist of Mobile Suits from both the Universal Century and the Alternate Centuries. The RG line combines the best aspects of the other three Gunpla lines: The small size and affordable prices of the High Grade, the advanced inner frame technology of the Master Grade and the massive parts count and details of the Perfect Grade. The tagline for the RG line is "Excitement Embodied". Also, the RG line reflects what a mobile suit would look like if it were built in the present day.', N'https://gundam.fandom.com/wiki/Real_Grade', N'RGlogo.jpg')
INSERT [dbo].[Category] ([cateID], [cateName], [cateDescription], [cateURL], [cateImageURL]) VALUES (4, N'PG 1/60', N'Perfect Grade (PG) (パーフェクトグレード) is a series of 1/60 scale Gunpla kits created by Bandai. The PG line originated with the release of the Perfect Grade Evangelion EVA-01 in 1997. The line was later transferred to the Gundam franchise in 1998 and was exclusive to Gundam until 2017, when Bandai announced the Perfect Grade 1/72 scale Millennium Falcon for the Star Wars franchise. The PG line has significant external and internal details plus light up gimmicks with LEDs. The PGs are some of the most expensive Gunpla produced and have often been used to develop Master Grade and Real Grade technology.[1]', N'https://gundam.fandom.com/wiki/Perfect_Grade', N'PGLogo.jpg')
INSERT [dbo].[Category] ([cateID], [cateName], [cateDescription], [cateURL], [cateImageURL]) VALUES (5, N'Tools', N'Tools is a essentials aspect of building a gunpla kit, with percision and skills can develop your nature talent on your gunpla kits', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (6, 16, N'product[1,amount = 1],product[2,amount = 1],product[3,amount = 1],', 73, N'FU hoa lac', 828895842, N'ship nhanh len ', N'Louis Tran', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (7, 4, N'product[2,amount = 1],', 24, N'Thanh xuÃ¢n', 1234567890, N'', N'Tráº§n Táº¥t Äáº¡t', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (8, 17, N'product[1,amount = 1],', 25, N'Thanh xuÃ¢n', 1234567890, N'', N'Tráº§n Táº¥t Äáº¡t', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (9, 17, N'product[1,amount = 1],', 25, N'hanhngu', 123456, N'hanh ngu', N'hanh ngu', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (10, 17, N'product[1,amount = 1],product[2,amount = 1],', 49, N'Thạch thất', 1234, N'', N'Hạnh ngu', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (11, 17, N'product[1,amount = 1],', 25, N'FU hoa lac', 828895842, N'', N'Louis Tran', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (12, 17, N'product[2,amount = 1],product[3,amount = 1],', 48, N'Thanh xuân', 1234567890, N'', N'Trần Tất Đạt', N'cant find', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (13, 4, N'product[1,amount = 1],product[2,amount = 1],product[3,amount = 1],', 73, N'FU hoa lac', 828895242, N'ship den cong truong', N'Trần nguyễn thái an', N'2021/03/30 12:31:48', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (14, 4, N'product[46,amount = 1],product[11,amount = 1],', 97, N'FU hoa lac', 828895842, N'dkm may ship nhanh nlen', N'Louis Tran', N'2021/03/31 09:23:05', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (15, 19, N'product[6,amount = 2],product[7,amount = 1],', 65, N'Fu HoaLAc', 987654321, N'', N'Nguyễn Văn Công', N'2021/03/31 09:28:49', N'Done')
INSERT [dbo].[Order] ([orderID], [accID], [listOfOrder], [totalMoney], [address], [Phone], [note], [customer], [date], [status]) VALUES (16, 4, N'product[1,amount = 2],product[10,amount = 1],', 95, N'FU hoa lac', 828895842, N'ship nhanh len', N'Louis Tran', N'2021/04/02 10:15:22', N'Preparing')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (2, N'1/144 Gundam HG UC Narrative C-Packs', 24, N'HG/cpack.png', N'The RX-9/C Narrative Gundam C-Packs is a mobile suit appearing in Mobile Suit Gundam Narrative and is piloted by Jona Basta.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (3, N'1/144 Infinity Justice Gundam', 24, N'HG/infinity.jpg', N'The ZGMF-X19A ∞ Justice Gundam (aka Infinite Justice, Justice) is a mobile suit and the successor to the ZGMF-X09A Justice Gundam. It appears in Mobile Suit Gundam SEED Destiny and is piloted by Athrun Zala.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (4, N'1/144 Moon Gundam', 30, N'HG/moon.jpg', N'The AMS-123X-X Moon Gundam is the titular mobile suit of Mobile Suit Moon Gundam. It is piloted by Jutta Qasim.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (5, N'1/144 RX-78-2 Gundam Revive', 20, N'HG/rx78.jpg', N'The RX-78-2 Gundam is the titular mobile suit of Mobile Suit Gundam television series. Part of the RX-78 Gundam series, it was built in secret on Side 7. The Gundam would turn the tide of war in favor of the Earth Federation during the One Year War against the Principality of Zeon. It was primarily piloted by Amuro Ray.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (6, N'1/144 MS-06S ZAKU II (HGUC)', 20, N'HG/zaku2.jpg', N'-Gunpla 40th Anniversary! From [Mobile Suit Gundam], Char''s Zaku II appears in the HG series with new modeling!

-Revive proportions in [Mobile Suit Gundam] with the latest technology.
-The mono-eye can be moved by moving the operation rib on the back of the head.
-The arm also rotates the forearm in addition to the upper arm, ensuring a large range of motion.
-Includes soft material parts that further extend the range of motion of the waist. It is a selection type of plastic parts and soft material parts.
-Three weapons can be attached to the waist.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (7, N'1/144 Uraven Gundam (HGBD:R)', 25, N'HG/unraven.jpg', N'Copyright Sotsu / Sunrize


-New protagonist [Euraven Gundam] appears from [Gundam Build Divers Re: RISE] 2nd Season scheduled to be distributed on Gundam Channel from April 9, 2020!

-Core Gundam II can be transformed into a core flyer by itself.
-You can also enjoy customizing with existing armor with co-adding custom support!', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (8, N'1/144 MSZ-010 ZZ Gundam (HGUC)', 20, N'HG/zz.jpg', N'- HGUC ZZ Gundam, finally productized in the year of Gundam Plastic Model 30 Year
  Anniversary!
- Pursued proportion and quality by the use of development plan sketches by Hajime Katoki.
- Includes a large beam for the beam saber
- Also comes with a stand base that makes balanced display possible.
- The opening gimmick for Missile Launcher reproduced.
- Also reproduced the MS and each transformation modes. Swapping gimmick concentrating
  on the form.
  (Core Fighter, Core Base, Core Top, G Fortress)', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (9, N'1/144 GN-001 Gundam Exia (HG)', 9, N'HG/exia.jpg', N'The GN-001 Gundam Exia (aka Exia, Gundam Seven Swords) is a mobile suit featured in season one of Mobile Suit Gundam 00 and is piloted by Setsuna F. Seiei.', 1, 2)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (10, N'1/100
 
00 Gundam Seven Sword/G', 45, N'MG/7s.jpg', N'- From Mobile Suit Gundam 00V: the variant of the Gundam 00- the 00 Gundam Seven Sword!
- Includes an arsenal of weaponry.
- Both the Suit and weapons are packed with gimmicks!
- Includes new kneecap parts unique to the Seven Sword!
- Includes all Seven Swords and the GN Sword II Blaster!
- GN effect parts are reproduced using clear parts, and fixed joint are installed for easy weapon manipulation. GN Sword II Blaster features an expandable hilt, and can be mounted onto the binder.
- Both Shield and Sword mode mode of GN Buster Sword II can be reproduced!
- LED unit (sold separately) can be installed for a more accurate look!
- Also includes GN Sword II Long and Short (both featuring gimmicks), and GN Katars can be connected to shift to shield form!', 1, 1)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (11, N'1/100 Freedom Gundam Ver.2.0', 37, N'MG/freedom.jpg', N'- Alight sword - appeared in MG Ver.2.0 that evolved of Freedom Gundam ultimate!

- Propotion [proportion]
Frame, exterior both revamped proportions in the new shape completely. Detail has followed the SEED Ver.RM system.

- Movable [moveable]
Designed to achieve a natural moving close to human. Fully reproduce the heroic poses of Freedom Gundam.
, Arms stretch movable elbow joints. Delicate movement can also be realized.
· Thigh armor to the slide mechanism, and adopt a double joint specification of the toe
- Warp, crouched, twisting and flexibly abdomen moving.

- Gimmick [gimmick]
In order to reproduce the full burst mode, the wing portion, and a movable mechanism of the beam gun, and the like.

- Option [option]
Various weapons and pedestal, the pedestal joint parts, such as hand parts included. Saber is drama intermediate street can be connected.', 1, 1)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (12, N'1/100 Justice Gundam (MG)', 39, N'MG/justice.jpg', N'- [Justice (Justice) the name of the backpack City, SEED one of the strongest aircraft, Justice Gundam long-awaited first MG of!

- POINT 1: STYLE
Three-dimensional added to the same taste arrangements of SEED-based MG
Arrangements were added to meet the SEED system MS of the sale, reproduce the setting of the same ZAFT made MS in MG taste by using some common frame.

- POINT 2: PHATOM-00-GIMMICK-
Anime set production by Fatumu -00 full gimmick
- The moveable beam gun base of Fatumu -00, can be deployed to the flight form with no removable parts.

- POINT 3: PHATOM-00-RIDE ON-
Fatumu -00 adopted deployment gimmick! Boarding to pose is possible!
· Fatumu -00 comes with a display base for boarding.
· MS riding section slides deployed, Fatumu -00 is large in size at the time of boarding, recreate the atmosphere of the play.

- POINT 4: WEAPON
Armed accessory to be used in the play
· Rakeruta-saber is possible reproduce the dual wield and halberd!

- POINT 5: DETAILS
With more detail of the MG SEED Series Common become amount of information, reproduce the Justice Gundam
· Leg reproduce the fine detail, such as thrusters.
Cockpit of the opening and closing gimmick and pilot figure also included.
· The drawer gimmick of the neck joint, can pose of space-time combat.', 1, 1)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (13, N'1/100 GN-003 Gundam Kyrios', 41, N'MG/kyrios.jpg', N'-From [Mobile Suit Gundam OO] [Gundam Curious] to MG based on the latest draft by Mr. Takayuki Yanase!

-In accordance with the original setting, a frame common to MG 1/100 Gundam Dunames is adopted.
-Reproduce the transformation to MA form by frame structure!
-Locked shoulder armor and backpack nose in MA form to enhance form retention and provide a stable display.
-The hand parts reproduce the same deformation mechanism as animation. Hand parts can be bent inward while holding the wireless grip in MA mode.
-The GN beam submachine gun connected to the arm joint is replaceable.
-Wireless grip can be attached to two weapons as set.
-GN shield can be deployed. Furthermore, various poses are possible by rotating the connection.
-GN hand missile unit can be equipped on the arm.', 1, 1)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (14, N'1/100 00 GN-0000+GNR-010 00 Raiser (MG) ', 53, N'MG/raiser.jpg', N'- MG Raiser, go!
- Internal frame structure based partly off original Gundam 00 and partly off the Raiser.
- Utilize the Gunpla LEDs to showcase GN particle emissions in the head, GN Drives, and particle storage tanks.
* This product has five LED-enabled locations, and includes a single LED unit. Four additional Gunpla LED units required for full effect..
- Cockpit block features opening hatch.
- Raiser binder is equipped with opening gimmick.
- Thanks to new molds, weapons such as Raiser Sword can be recreated.', 1, 1)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (15, N'1/60 00 Gundam Seven Sword/G (PG)', 201, N'PG/pg7s.JPG', N'- It flees to the battlefield with Setsuna, F · Seiyi who was awakened by the innovator as an aircraft equipped with seven swords and guns. In addition to arming, new modeling parts are also added to the main body. Aircraft that played an active part in [Mobile Suit Gundam 00V Senki] are kitized with PG!

[Sophisticated proportions, redesigned coloring and texture representation]
- Adjust the proportions of each part such as legs, head, shoulder and so on. By new modeling parts, make it more refined impression.
- Adopt molding material that emphasizes texture. Under the supervision of Ebi Ekawa Kanitake, the molding color is completely renewed.

[Armored parts cover variable light gimmicks]
- GN Bustor Sword II reproduces light emitting gimmick by LED.
Newly developing trend-oriented parts of the new organization by understanding the setting shape and conducting detailed guiding analysis / design (patent pending)
- Large Armed GN Sword II Blaster is reproduced in a large size of about 340 mm in total length.
- GN Qatar can reproduce various variations such as mounting on the leg part alone, connected state and so on.
- GN sword II long / short form can be reproduced by replacement, long is grip development in rifle state, short can be reproduced with lead wire using injection type.', 1, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (16, N'1/60 Gundam Exia (PG)', 157, N'PG/pgexia.jpg', N'- PERFECT GRADE [Evolution (20th year) Evolution]
The ultimate form to be reached with the latest technology, [PG 1/60 Gundam Exia], appears here.

- Focusing on the solar furnace [GN Drive] which is the biggest feature under supervision of Mechanical Designer Ebi Okawa Kanitake. A thorough explanation of the mechanism by which [GN particle] transmits from the driving force [GN Drive] to the whole body. It embodies the design arrangement and the internal frame structure led from it.

- Feel energy transmission ''Armor · Frame structure''
Considering the transmission structure of [GN particle], the internal frame where the cable is exposed from various parts of the aircraft. Expansion of external armor More emphasize its presence by gimmick.

[Detailed detail and gimmick guided by thorough consideration]
- Improve the mechanical impression by frames and mechanical details removed from the gap.
- A hatch open gimmick that allows the whole body exterior to move, so that it can also enjoy internal details.
- Laminated structure and reproduced texture by special seal [GN Drive]
- With a wide range of motion and the attached dedicated pedestal, aerial action full of dynamism is possible.
- Accessories are enriched, such as abundant wrist parts and abundant armed weapon with gimmick.
- The regular version adopts a metallic seal and expresses the light emitting part by reflection of light.
', 1, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (17, N'1/60 00 Raiser (PG)', 207, N'PG/pgraiser.jpg', N'- 5 years since the release of the last Perfect Grade comes the long-awaited PG 00 Raiser!
- The very first Perfect Grade release from the anime Mobile Suit Gundam 00!
- Equipped with a clutch mechanism to steady the Suit''s joints, allowing it to hold dynamic poses with ease!
- Anime-accurate GN Drive included, featuring lights and spinning action. Of course, the head lights up as well.
- More equipment than has you''ll ever need!
- High level of detail creates a truly realistic fighting machine.', 1, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (18, N'1/60 RX-78-2 Gundam (PG)', 99, N'PG/pgrx78.jpg', N'- Precision models of large size! ! Bigger grand daddy gundam comes with perfect grade size!', 1, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (19, N'1/60 RX-0 Unicorn Gundam (PG)', 157, N'PG/pgunicorn.jpg', N'- (Including the deployment of face guard) full reproduction of Destroy Mode to the `` transformation from Unicorn mode
- `Achieve third form`
- Psycho red frame systemic Adopt Special Collections light resin
- `Blade antenna that opens and closes at the moving makeover` is, beautifully expresses the one horned unicorn mode to insert a magnet. The inner surface of the antenna which is exposed to the Destroy mode painted in gold.
- Without compromising the appearance of the impression, to pursue extreme range of motion of the elbow, knee
- Erma ment unit of the knee around link movable form for each mode
- Various marking adopted transparent thin film seal (Tetron seal)
- Psycho frame UV emission by incorporating a dedicated LED unit (sold separately)', 1, 4)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (20, N'1/144 RG Multipurpose Humanoid Decisive Weapon, Artificial Human Evangelion Unit-01 (RG)', 37, N'RG/rgeva.jpg', N'-The first Evangelion machine is now available in the RG series!
-Pursuing to reproduce Evangelion''s action pose as an Android as RG.

-Thorough pursuit of precise coloring expression by molding color. It can be expressed simply by assembling colorful colors.
-Chest, abdomen, and back parts are interlocked with multiple armor when leaning forward or looking up. In particular, a large range of motion is secured by the large movement of the chest parts.
-Reduced armor interference when bending your knees. Succeeded in expressing joints like a human by sinking back knee parts like real muscles.
-Internal parts interlock when the neck is movable. Natural posing and expression can be reproduced.
-Interlocking of the internal frames enables the expression of joints with shoulders and twisting arms. Impressive crouching poses can be reproduced without breaking down in a form close to nature.
-When the legs are opened, the internal parts that look like muscles work together to create a natural standing.
-Entry plug is included as a separate part.
-Comes with abundant optional parts such as 2 progressive knives, 1 pallet rifle, 6 left and right hand parts, and umbilical cable.', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (21, N'1/144 RG GNT-0000 00 QAN[T] (RG)', 20, N'RG/quanta.jpg', N'- Appeared finally to RG is Quanta hugely popular!


- CONCEPT
Pursuing a structure that feel [realistic] from the assembly stage.
Exia, followed the history that has been developed in light of the Double O, while utilizing the Advance de MS joint of the same type, reproduce the aircraft characteristics of Quanta. By renew the joint structure and mechanical gimmick, to achieve a high mobile performance and the amount of information.

- RG ever largest action of
Such as the Sword by renewed movable shaft position and the movable angle of the arm joints protrude horizontally, it improved posing performance.
Greatly extend the range of motion of the leg by renewed moving method of waist armor. Achieve a more dynamic action poses.

- Realistic gimmick that created from historical research based on real technology
Renewed the GN drive attaching and detaching mechanism, fully reproduce the mechanical removable gimmick by adopting a mounting gimmick that also serves as fixing of the back pack.
By providing the moving point of up to seven, realizing a flexible arm moving.
GN shield deployment by the arm is to renew the movable shaft, achieve a high range of motion!

- GN capacitor mounted frame
While utilizing the Advanced MS joint of RG Exia the same type, the arm is completely new parts reproduction. The reproducibility capacitor disposed systemically.

- Bit recombinant gimmick GN Sword V
Characteristic weapon of double oak Anta - bit recombination gimmick also complete reproduction. Grip is equipped with a slide deployment mechanism. GN Sword bit can be attached to the shield.', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (23, N'1/44 RG ZGMF-X20A Strike Freedom Gundam (RG)', 25, N'RG/freesdomstrike.jpg', N'- The 14th in the RG Series - the Strike Freedom Gundam!
- From Mobile Suit Gundam SEED, which brought us the Aile Strike Gundam, Freedom Gundam and Justice Gundam as Real Grade kits, we finally get the Strike Freedom Gundam!
- Heavily researched, the RG Strike Freedom is the most realistic depiction so far.
- Advanced MS Joint allows for a huge range of motion and quicker assembly.
- Reproduce the look of the metal joints using realistic decals.
- Gold Advanced MS Joint
Designed to replicate the Strike Freedoms characteristic gold inner frame, this is the first RG kit to have a gold-colored inner frame!
- Expandable Super DRAGOON Weapon Wing System!
The largest element of the Strike Freedom, the Super DRAGOON system has been reproduced in exact detail according to research done for this Suit, and the interior frame has been molded in gold for an accurate build.
- Beam Shield
Beam Shield reproduced with clear parts.
- High-Energy Beam Rifles
High-Energy Beam Rifles can combine to form Long-Range Beam Rifle.
- Xiphias 3 Rail Cannons
Waist-mounted Rail Cannons are equipped with deployment gimmick.', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (25, N'1/144 RG Nu Gundam (RG)', 34, N'RG/rgnu.jpg', N'ラ イ ン ナ ッ プ Amuro lay boarding aircraft appeared in [Shizua of Mobile Suit Gundam counterattack] lineup in RG!

-Various gimmicks to reproduce the setting mechanism and the poses in the play, and the original gimmicks based on real machine test results are condensed to 1/144 scale.
-With precise parts configuration, it creates both 1 / 1s image and enjoys both fun and decorating.
-特 徴 Gundam''s distinctive coloring is reproduced in molded color. The white body uses three light gray molded colors to increase information density.
-Joints are built into the shoulders and abdomen, and can move flexibly. It enables twisting and shoulder extrusion, resulting in more dynamic posing.
-Armor on the shoulder has a built-in mechanism that expands in tandem with the internal joint. By expanding the range of motion of the shoulder, reduce the interference between parts that occur in posing etc. holding an arm.
-The lumbar joint moves finely for each block, expanding the movable range of the leg. The knee can be pushed forward widely, and a powerful pose with a wide stance can be produced even at 1/144 scale.
-The legs are equipped with [Multilink Gimmick] where the armor slides in conjunction with the movement of each joint. Poses with large knees are also reproduced naturally.

[accessories]
・ Beam ・ rifle × 1
・ Fin ・ Funnel × 6
・ New hyper bazooka × 1
・ Shield (Beam · Canon) × 1
・ Beam saber (backpack part, arm part) x 1 each
・ Missile × 1 type

[Item content]
· Molded articles × 13
・ Realistic decal × 1
・ Instruction manual × 1', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (26, N'1/144 RG Sazabi (RG)', 37, N'RG/rgsazabi.jpg', N'Experience the RG Sazabi with the largest gimmick of 1/144 scale history.

- Red comet [Chia · Aznable] dedicated machine appearing in [Mobile Suit Gundam Char''s Counter Attack] is made into RG.
- Various movable gimmicks that can reproduce the posing in the play as well as the mechanism on the airframe setting, and condensed on the 1/144 scale up to the original gimmick by a real machine verification unique to RG!
- Faithfully reproduce the aircraft, such as arms of arms, funnels etc., based on the sense of setting in the play.
- Pursue more realism by actual machine verification. A deployment mechanism is installed in the propulsion section of verniers and backpacks.
- In addition to abundant hand parts, arming that symbolizes Sotheby is attached. Due to various hand parts and high range of motion, both hand holding poses etc. can be reproduced.

[accessories]
· Beam shot · Rifle × 1
· Beam · Tomahawk × 1
· Beam · saber × 2
· Shield × 1
Funnel x 6
· Missile × 1

[Product content]
· Molded article × 17
· Realistic decal × 1
· Instruction manual × 1', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (27, N'1/144 RG GN-0000+GNR-010 00 Raiser (RG)', 24, N'RG/rgraiser.jpg', N' GW large items following the Exia! Exist beyond the Gundam [Raiser] appeared in the RG!  - The three-dimensional the Raiser of Real grade unique incorporate a new interpretation, while based on the actual historical research!  - 1: deep the aircraft characteristics from modern technology Is a characteristic of the aircraft [GN DRIVE] is interpreted as a propulsion engine energy transfer institution. The design of real technology and promotion agencies and high-voltage power transmission line of exploration satellite captured in design. GN DRIVE is fitted with click-type arm of. Can be freely angle adjustment. It is also possible to make the particle storage tank type that appeared in the movie version in the selection formula.  - 2: Proportion of considering the setting Double O adopted the same Advance de MS joint and Exia is in a high-end models of Exia. While reproduce the successor machine design line in a common joint, and reproduce the distinctive form that is expressed in more Massive.  - 3: Precision', 1, 3)
INSERT [dbo].[Product] ([id], [pname], [price], [imageURL], [description], [sellID], [cateID]) VALUES (29, N'RG XXXG-00W0 Wing Gundam Zero EW (RG)', 20, N'RG/rgwing.jpg', N'0.0_ An accurate, realistic take on a classic Mobile Suit, Mobile Suit Gundam Wing: Endless Waltz''s angelic Wing Gundam Zero fills the next slot in the prestigious Real Grade line!  0.5_With an incredible amount of unique detail drawn from much-researched realistic technology, this Real Grade model is the closest to the real thing so far.  1.0_Derived from modern aircraft designs, the Wing Zero''s armor and wing surface feature advanced panelling. Internal wing details take into consideration the necessary components for defense and atmosphere re-entry heat, and are recreated in the Wing Zero''s signature feather-like armor structure.  2.0_Based on cutting edge thrust control technology, this three-dimensional model''s wings feature an aerodynamic sweeping design. Taking into account the thrust needed to propel a massive Suit like this in atmo, the massive wingspan is closer to the curved, bladelike wings of a bird than any other in the Wing Gundam line.  3.0_Utilizing an all-new Advanced MS Joint, this Suit fea', 1, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([accID])
REFERENCES [dbo].[Account] ([accID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([sellID])
REFERENCES [dbo].[Account] ([accID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cateID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [gunplaStore] SET  READ_WRITE 
GO
