USE [master]
GO
/****** Object:  Database [CountryCityManagementDB]    Script Date: 12/30/2015 1:11:01 PM ******/
CREATE DATABASE [CountryCityManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityManagementDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityManagementDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityManagementDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityManagementDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityManagementDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryCityManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityManagementDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityManagementDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 12/30/2015 1:11:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[About] [varchar](2500) NULL,
	[Dwellers] [int] NULL,
	[Location] [varchar](500) NULL,
	[Weather] [varchar](500) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 12/30/2015 1:11:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[About] [varchar](2500) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CountryView]    Script Date: 12/30/2015 1:11:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountryView] AS
SELECT DISTINCT
  cn.Name,
  cn.About,
  t.TotalCity, 
  t.TotalDwellers
FROM City AS ct
INNER JOIN Country AS cn ON ct.CountryId= cn.Id
INNER JOIN
(
   SELECT
	City.CountryId,
     COUNT(City.Name) AS TotalCity,
	 SUM(City.Dwellers) AS TotalDwellers
   FROM City 
   GROUP BY City.CountryId
) AS t ON cn.Id = t.CountryId

GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (1, N'Dhaka', N'Dhaka, set beside the Buriganga River, is the capital of Bangladesh. It’s a hub for trade and culture, with a long history as a seat of government. In the 17th century, it was the Mughal capital of Bengal, and many palaces and mosques from that period remain. American architect Louis Kahn''s National Parliament House complex typifies this fast-growing modern metropolis.', 40000000, N'Capital City of Bangladesh', N'70°F (21°C), Wind NE at 0 mph (0 km/h), 78% Humidity', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (2, N'Rajshahi', N'Rajshahi is a metropolitan city in Bangladesh and a major urban and industrial centre of North Bengal. It is the administrative seat of Rajshahi District and Rajshahi Division.', 448087, N'North Bengal', N' 69°F (21°C), Wind S at 1 mph (2 km/h), 62% Humidity', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (3, N'Chittagong', N'Chittagong /t??t?g??/ is a major coastal seaport city and financial centre in southeastern Bangladesh.', 2000582, N'South Bengal', N'69°F (21°C), Wind N at 1 mph (2 km/h), 68% Humidity', 1)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (4, N'Mumbai', N'Mumbai, formerly called Bombay, is a sprawling, densely populated city on India’s west coast. On the Mumbai Harbour waterfront stands the iconic Gateway of India stone arch, built by the British Raj in 1924. Offshore, nearby Elephanta Island holds ancient cave temples dedicated to Shiva. The city is also famous as the heart of the Hindi-language Bollywood film industry.', 11980000, N'Lorem Ipsum', N'82°F (28°C), Wind E at 7 mph (11 km/h), 37% Humidity', 2)
INSERT [dbo].[City] ([Id], [Name], [About], [Dwellers], [Location], [Weather], [CountryId]) VALUES (6, N'Delhi', N'Delhi, officially the National Capital Territory of Delhi, is the capital territory of India. Delhi is historically and culturally connected to both the Upper Doab of the Yamuna-Ganges river system and the Punjab region.', 9800000, N'Lorem Ipsum', N'Lorem Ipsum', 2)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (1, N'Bangladeh', N'<p><span style="color: #000000;">Bangladesh, east of India on the Bay of Bengal, is South Asian country of lush greenery and many waterways. Its Padma (Ganges), Meghna and Jamuna rivers create fertile alluvial plains, and travel by boat is common. On the southern coast, the Sundarbans, an enormous mangrove forest shared with India, are home to the Royal Bengal tiger.</span></p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (2, N'India', N'<p>India is a vast South Asian country with diverse terrain &ndash; from Himalayan peaks to Indian Ocean coastline &ndash; and history reaching back 5 millennia. In the north, Mughal Empire landmarks include Delhi&rsquo;s Red Fort complex, massive Jama Masjid mosque and Agra&rsquo;s iconic Taj Mahal mausoleum. Pilgrims bathe in the Ganges in Varanasi, and Rishikesh is a yoga center and base for Himalayan trekking.</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (3, N'Pakistan', N'<p>Pakistan, officially the Islamic Republic of Pakistan, is a sovereign country in South Asia. With a population exceeding 199 million people, it is the sixth most populous country and with an area covering</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (4, N'Malaysia', N'<p>Malaysia is a Southeast Asian country occupying the Malaysian Peninsula and part of the island of Borneo. Its known for its beaches, rainforests and mix of Malay, Chinese, Indian and European influences. The sprawling capital, Kuala Lumpur, is home to colonial buildings, busy shopping districts such as Bukit Bintang and skyscrapers including the iconic, 451m-tall Petronas Twin Towers.</p>')
INSERT [dbo].[Country] ([Id], [Name], [About]) VALUES (5, N'Indonesia', N'<p><img style="display: block; margin-left: auto; margin-right: auto;" src="https://upload.wikimedia.org/wikipedia/commons/9/9f/Flag_of_Indonesia.svg" alt="" width="237" height="158" /></p>
<p>Indonesia, a Southeast Asian nation made up of thousands of volcanic islands, is home to hundreds of ethnic groups speaking many different languages. Its is known for its beaches, volcanoes and jungles sheltering elephants, tigers and Komodo dragons. On the island of Java lies Indonesias vibrant, sprawling capital, Jakarta, and the city of Yogyakarta, known for gamelan music and traditional puppetry.</p>')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_City]    Script Date: 12/30/2015 1:11:01 PM ******/
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [IX_City] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Country]    Script Date: 12/30/2015 1:11:01 PM ******/
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [IX_Country] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
USE [master]
GO
ALTER DATABASE [CountryCityManagementDB] SET  READ_WRITE 
GO
