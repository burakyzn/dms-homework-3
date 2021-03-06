USE [master]
GO
/****** Object:  Database [kutuphaneDB]    Script Date: 12/15/2019 12:58:53 AM ******/
CREATE DATABASE [kutuphaneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kutuphaneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kutuphaneDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kutuphaneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\kutuphaneDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kutuphaneDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kutuphaneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kutuphaneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kutuphaneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kutuphaneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kutuphaneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kutuphaneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [kutuphaneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kutuphaneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kutuphaneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kutuphaneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kutuphaneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kutuphaneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kutuphaneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kutuphaneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kutuphaneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kutuphaneDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [kutuphaneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kutuphaneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kutuphaneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kutuphaneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kutuphaneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kutuphaneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kutuphaneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kutuphaneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [kutuphaneDB] SET  MULTI_USER 
GO
ALTER DATABASE [kutuphaneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kutuphaneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kutuphaneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kutuphaneDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kutuphaneDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'kutuphaneDB', N'ON'
GO
ALTER DATABASE [kutuphaneDB] SET QUERY_STORE = OFF
GO
USE [kutuphaneDB]
GO
USE [kutuphaneDB]
GO
/****** Object:  Sequence [dbo].[SQ_memberNo]    Script Date: 12/15/2019 12:58:54 AM ******/
CREATE SEQUENCE [dbo].[SQ_memberNo] 
 AS [bigint]
 START WITH 0
 INCREMENT BY 1
 MINVALUE 0
 MAXVALUE 999999
 CACHE 
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorNo] [int] IDENTITY(1,1) NOT NULL,
	[AuthorName] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[BANo] [int] IDENTITY(1,1) NOT NULL,
	[BookNo] [int] NOT NULL,
	[AuthorNo] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[BANo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookNo] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [nvarchar](17) NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[PublisherNo] [int] NOT NULL,
	[CategoryNo] [int] NOT NULL,
	[BookPageCount] [int] NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[LangNo] [int] NOT NULL,
	[ResMemberNo] [int] NULL,
	[ResDate] [date] NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowedBooks]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowedBooks](
	[BBNo] [int] IDENTITY(1,1) NOT NULL,
	[BookNo] [int] NOT NULL,
	[MemberNo] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_BorrowedBooks] PRIMARY KEY CLUSTERED 
(
	[BBNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryNo] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonatedBooks]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonatedBooks](
	[DBNo] [int] IDENTITY(1,1) NOT NULL,
	[MemberNo] [int] NOT NULL,
	[BookNo] [int] NOT NULL,
 CONSTRAINT [PK_DonatedBooks] PRIMARY KEY CLUSTERED 
(
	[DBNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LangNo] [int] IDENTITY(1,1) NOT NULL,
	[LangName] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[LangNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibraryInformation]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryInformation](
	[infoNo] [int] IDENTITY(1,1) NOT NULL,
	[BookCount] [int] NOT NULL,
	[DonatedBookCount] [int] NOT NULL,
	[PublisherCount] [int] NULL,
	[CategoryCount] [int] NOT NULL,
	[LanguageCount] [int] NOT NULL,
	[MemberCount] [int] NOT NULL,
	[NeededBookCount] [int] NOT NULL,
	[AuthorCount] [int] NOT NULL,
 CONSTRAINT [PK_Informations] PRIMARY KEY CLUSTERED 
(
	[infoNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[memberNo] [int] NOT NULL,
	[nickName] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](50) NOT NULL,
	[lastName] [nvarchar](50) NOT NULL,
	[_password] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[memberNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NeededBooks]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeededBooks](
	[RequestNo] [int] IDENTITY(1,1) NOT NULL,
	[BookName] [nvarchar](50) NOT NULL,
	[memberNo] [int] NOT NULL,
 CONSTRAINT [PK_NeededBooks] PRIMARY KEY CLUSTERED 
(
	[RequestNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[PublisherNo] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[PublisherAddress] [text] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[WebURL] [text] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[PublisherNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterTypes]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterTypes](
	[registerTypeNo] [int] IDENTITY(1,1) NOT NULL,
	[registerTypeDesc] [varchar](50) NOT NULL,
 CONSTRAINT [PK_registerTypes] PRIMARY KEY CLUSTERED 
(
	[registerTypeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[memberNo] [int] NOT NULL,
	[departmentDesc] [nchar](20) NULL,
	[titleDesc] [nchar](20) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[memberNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[memberNo] [int] NOT NULL,
	[registerTypeNo] [int] NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[memberNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (1, N'Burak Yazan', N'123132131', N'burak@mail.com', 1)
INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (2, N'Furkan Albayrak', N'123131312', N'furkan@gmail.com', 1)
INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (3, N'Hasan Bedri', N'213213211', N'hasan@gmail.com', 1)
INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (4, N'Kemal Kaynak', N'232131212', N'kemal@gmail.com', 1)
INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (5, N'Hayri Kaynak', N'12313131', N'hayri@gmail.com', 1)
INSERT [dbo].[Authors] ([AuthorNo], [AuthorName], [PhoneNo], [Email], [isActive]) VALUES (6, N'Hasan Kayra', N'1231312313', N'hasan@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[BookAuthor] ON 

INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (1, 2, 1)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (2, 2, 3)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (3, 1, 1)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (4, 1, 2)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (5, 4, 1)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (6, 3, 1)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (7, 3, 2)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (8, 3, 3)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (9, 5, 1)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (10, 6, 5)
INSERT [dbo].[BookAuthor] ([BANo], [BookNo], [AuthorNo]) VALUES (12, 6, 5)
SET IDENTITY_INSERT [dbo].[BookAuthor] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (1, N'123456789', N'C++ Programlama', 2, 1, 348, CAST(N'2019-12-07' AS Date), 8, NULL, NULL, 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (2, N'234567890', N'C# Programlama', 2, 1, 453, CAST(N'2019-12-07' AS Date), 8, 3, CAST(N'2019-12-10' AS Date), 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (3, N'345678901', N'Kalkulus', 2, 2, 148, CAST(N'2019-12-07' AS Date), 8, 1, CAST(N'2019-12-09' AS Date), 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (4, N'456789012', N'Lineer Cebir', 2, 2, 200, CAST(N'2019-12-07' AS Date), 8, 3, CAST(N'2019-12-10' AS Date), 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (5, N'567890123', N'ReactJs', 3, 1, 300, CAST(N'2019-12-09' AS Date), 9, 1, CAST(N'2019-12-09' AS Date), 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (6, N'098765432', N'T-SQL Egitimi', 3, 1, 150, CAST(N'2019-12-09' AS Date), 3, 1, CAST(N'2019-12-09' AS Date), 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (7, N'987654321', N'React Native Kitap', 3, 1, 170, CAST(N'2019-12-09' AS Date), 9, NULL, NULL, 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (8, N'876543210', N'Serway', 3, 3, 200, CAST(N'2019-12-09' AS Date), 9, NULL, NULL, 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (9, N'765432109', N'MSSQL', 3, 1, 210, CAST(N'2019-12-09' AS Date), 9, NULL, NULL, 1)
INSERT [dbo].[Books] ([BookNo], [ISBN], [BookName], [PublisherNo], [CategoryNo], [BookPageCount], [ReleaseDate], [LangNo], [ResMemberNo], [ResDate], [isActive]) VALUES (10, N'555555555', N'Visual Studio', 2, 1, 312, CAST(N'2019-12-09' AS Date), 8, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[BorrowedBooks] ON 

INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (1, 1, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (2, 2, 3, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (3, 3, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (4, 4, 3, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (5, 5, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (6, 5, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (7, 6, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (8, 3, 1, 0)
INSERT [dbo].[BorrowedBooks] ([BBNo], [BookNo], [MemberNo], [isActive]) VALUES (9, 10, 1, 0)
SET IDENTITY_INSERT [dbo].[BorrowedBooks] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryNo], [CategoryName]) VALUES (1, N'Programlama')
INSERT [dbo].[Categories] ([CategoryNo], [CategoryName]) VALUES (2, N'Matematik')
INSERT [dbo].[Categories] ([CategoryNo], [CategoryName]) VALUES (3, N'Fizik')
INSERT [dbo].[Categories] ([CategoryNo], [CategoryName]) VALUES (4, N'Veri Yapıları')
INSERT [dbo].[Categories] ([CategoryNo], [CategoryName]) VALUES (5, N'Kimya')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[DonatedBooks] ON 

INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (1, 1, 1)
INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (2, 1, 2)
INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (3, 1, 3)
INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (4, 3, 4)
INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (6, 1, 8)
INSERT [dbo].[DonatedBooks] ([DBNo], [MemberNo], [BookNo]) VALUES (7, 1, 10)
SET IDENTITY_INSERT [dbo].[DonatedBooks] OFF
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (3, N'Ispanyolca', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (8, N'Turkce', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (9, N'İngilizce', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (13, N'Tayca', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (14, N'Korece', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (15, N'Japonca', 1)
INSERT [dbo].[Languages] ([LangNo], [LangName], [isActive]) VALUES (16, N'Fince', 1)
SET IDENTITY_INSERT [dbo].[Languages] OFF
SET IDENTITY_INSERT [dbo].[LibraryInformation] ON 

INSERT [dbo].[LibraryInformation] ([infoNo], [BookCount], [DonatedBookCount], [PublisherCount], [CategoryCount], [LanguageCount], [MemberCount], [NeededBookCount], [AuthorCount]) VALUES (1, 10, 6, 3, 5, 7, 4, 3, 6)
SET IDENTITY_INSERT [dbo].[LibraryInformation] OFF
INSERT [dbo].[Members] ([memberNo], [nickName], [firstName], [lastName], [_password], [email], [isAdmin], [isActive]) VALUES (1, N'burak', N'Burak', N'Yazan', N'997', N'burak@gmail.com', 1, 1)
INSERT [dbo].[Members] ([memberNo], [nickName], [firstName], [lastName], [_password], [email], [isAdmin], [isActive]) VALUES (3, N'furkan', N'Furkan', N'Albayrak', N'997', N'furkan@gmail.com', 0, 1)
INSERT [dbo].[Members] ([memberNo], [nickName], [firstName], [lastName], [_password], [email], [isAdmin], [isActive]) VALUES (6, N'hasan', N'Hasan', N'Kemal', N'997', N'hasankemal@gmail.com', 0, 1)
INSERT [dbo].[Members] ([memberNo], [nickName], [firstName], [lastName], [_password], [email], [isAdmin], [isActive]) VALUES (7, N'huseyin', N'Huseyin', N'Bahtsız', N'997', N'huseyin@gmail.com', 0, 1)
SET IDENTITY_INSERT [dbo].[NeededBooks] ON 

INSERT [dbo].[NeededBooks] ([RequestNo], [BookName], [memberNo]) VALUES (2, N'Java Programlama', 7)
INSERT [dbo].[NeededBooks] ([RequestNo], [BookName], [memberNo]) VALUES (3, N'Git Kullanimi', 5)
INSERT [dbo].[NeededBooks] ([RequestNo], [BookName], [memberNo]) VALUES (4, N'Javascript Programlama', 3)
SET IDENTITY_INSERT [dbo].[NeededBooks] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([PublisherNo], [PublisherName], [PhoneNo], [PublisherAddress], [Email], [WebURL], [isActive]) VALUES (2, N'Aras Yayıncılık', N'02123334455', N'Istanbul', N'arasyayincilik@gmail.com', N'arasyayincilik.com', 1)
INSERT [dbo].[Publishers] ([PublisherNo], [PublisherName], [PhoneNo], [PublisherAddress], [Email], [WebURL], [isActive]) VALUES (3, N'Argo Yayıncılık', N'02129994455', N'Istanbul', N'argoyayincilik@gmail.com', N'argoyayincilik.com', 1)
INSERT [dbo].[Publishers] ([PublisherNo], [PublisherName], [PhoneNo], [PublisherAddress], [Email], [WebURL], [isActive]) VALUES (4, N'Tan Yayıncılık', N'02161112233', N'Istanbul', N'tanyayincilik@gmail.com', N'tanyayincilik.com', 1)
SET IDENTITY_INSERT [dbo].[Publishers] OFF
SET IDENTITY_INSERT [dbo].[RegisterTypes] ON 

INSERT [dbo].[RegisterTypes] ([registerTypeNo], [registerTypeDesc]) VALUES (1, N'On Lisans')
INSERT [dbo].[RegisterTypes] ([registerTypeNo], [registerTypeDesc]) VALUES (2, N'Lisans')
INSERT [dbo].[RegisterTypes] ([registerTypeNo], [registerTypeDesc]) VALUES (3, N'Yuksek Lisans')
INSERT [dbo].[RegisterTypes] ([registerTypeNo], [registerTypeDesc]) VALUES (4, N'Doktora')
INSERT [dbo].[RegisterTypes] ([registerTypeNo], [registerTypeDesc]) VALUES (7, N'Erasmus')
SET IDENTITY_INSERT [dbo].[RegisterTypes] OFF
INSERT [dbo].[Staff] ([memberNo], [departmentDesc], [titleDesc]) VALUES (6, N'İdari               ', N'Müdür               ')
INSERT [dbo].[Students] ([memberNo], [registerTypeNo]) VALUES (1, 3)
INSERT [dbo].[Students] ([memberNo], [registerTypeNo]) VALUES (3, 3)
INSERT [dbo].[Students] ([memberNo], [registerTypeNo]) VALUES (7, 2)
/****** Object:  Index [IX_DonatedBooks]    Script Date: 12/15/2019 12:58:54 AM ******/
ALTER TABLE [dbo].[DonatedBooks] ADD  CONSTRAINT [IX_DonatedBooks] UNIQUE NONCLUSTERED 
(
	[BookNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Authors] FOREIGN KEY([AuthorNo])
REFERENCES [dbo].[Authors] ([AuthorNo])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Authors]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Books] FOREIGN KEY([BookNo])
REFERENCES [dbo].[Books] ([BookNo])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Books]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Categories] FOREIGN KEY([CategoryNo])
REFERENCES [dbo].[Categories] ([CategoryNo])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Categories]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Languages] FOREIGN KEY([LangNo])
REFERENCES [dbo].[Languages] ([LangNo])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Languages]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Members] FOREIGN KEY([ResMemberNo])
REFERENCES [dbo].[Members] ([memberNo])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Members]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers] FOREIGN KEY([PublisherNo])
REFERENCES [dbo].[Publishers] ([PublisherNo])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Books] FOREIGN KEY([BookNo])
REFERENCES [dbo].[Books] ([BookNo])
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Books]
GO
ALTER TABLE [dbo].[BorrowedBooks]  WITH CHECK ADD  CONSTRAINT [FK_BorrowedBooks_Members] FOREIGN KEY([MemberNo])
REFERENCES [dbo].[Members] ([memberNo])
GO
ALTER TABLE [dbo].[BorrowedBooks] CHECK CONSTRAINT [FK_BorrowedBooks_Members]
GO
ALTER TABLE [dbo].[DonatedBooks]  WITH CHECK ADD  CONSTRAINT [FK_DonatedBooks_Books] FOREIGN KEY([BookNo])
REFERENCES [dbo].[Books] ([BookNo])
GO
ALTER TABLE [dbo].[DonatedBooks] CHECK CONSTRAINT [FK_DonatedBooks_Books]
GO
ALTER TABLE [dbo].[DonatedBooks]  WITH CHECK ADD  CONSTRAINT [FK_DonatedBooks_Members] FOREIGN KEY([MemberNo])
REFERENCES [dbo].[Members] ([memberNo])
GO
ALTER TABLE [dbo].[DonatedBooks] CHECK CONSTRAINT [FK_DonatedBooks_Members]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Members] FOREIGN KEY([memberNo])
REFERENCES [dbo].[Members] ([memberNo])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Members]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Members] FOREIGN KEY([memberNo])
REFERENCES [dbo].[Members] ([memberNo])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Members]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_RegisterTypes] FOREIGN KEY([registerTypeNo])
REFERENCES [dbo].[RegisterTypes] ([registerTypeNo])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_RegisterTypes]
GO
/****** Object:  StoredProcedure [dbo].[AddAuthor]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Yazar eklemek icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[AddAuthor]
	@_authorName nvarchar(50),
	@_phoneNo nvarchar(50),
	@_email nvarchar(50)
AS
	DECLARE @Error int
BEGIN TRY
	INSERT INTO Authors(AuthorName, PhoneNo, Email, isActive)
	VALUES (@_authorName, @_phoneNo, @_email, 1);
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddAuthorToBook]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/09/2019>
-- Description:	<Kitaplara yazar eklemek icin yazilmistir.>
-- =============================================
CREATE PROCEDURE [dbo].[AddAuthorToBook]
	@_BookNo int,
	@_AuthorNo int,
	@_Message nvarchar(200) OUTPUT
AS
BEGIN TRY  
    INSERT INTO BookAuthor(BookNo, AuthorNo)
	VALUES (@_BookNo, @_AuthorNo);
	SET @_Message = 'Yazar kitaba başarıyla eklendi.'
END TRY  
BEGIN CATCH  
	SET @_Message = 'Yazar eklenirken bir hata oluştu.'
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Kitap eklemek icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[AddBook]
	@_ISBN nvarchar(17),
	@_bookName nvarchar(50),
	@_publisherNo int,
	@_categoryNo int,
	@_pageCount int,
	@_langNo int,
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @Error int
BEGIN TRY
	--INSERT INTO Books(ISBN, BookName, PublisherNo, CategoryNo, ReleaseDate, LangNo, ResMemberNo,ResDate, isActive)
	--VALUES (@_ISBN,@_bookName,@_publisherNo,@_categoryNo,@_pageCount,GETDATE(),@_langNo,NULL,NULL,1);

	INSERT INTO [dbo].[Books]
           ([ISBN]
           ,[BookName]
           ,[PublisherNo]
           ,[CategoryNo]
           ,[BookPageCount]
           ,[ReleaseDate]
           ,[LangNo]
           ,[ResMemberNo]
           ,[ResDate]
           ,[isActive])
     VALUES
           (@_ISBN
           ,@_bookName
           ,@_publisherNo
           ,@_categoryNo
           ,@_pageCount
           ,GETDATE()
           ,@_langNo
           ,NULL
           ,NULL
           ,1)
	SET @_Message = 'Kitap başarıyla eklendi.'
END TRY
BEGIN CATCH
	SET @_Message = 'Kitap eklenirken bir hata oluştu.';
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddBookFromDon]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/09/2019>
-- Description:	<Bagislanan kitaplari eklemek icin yazilan fonksiyondur.>
-- =============================================
CREATE PROCEDURE [dbo].[AddBookFromDon]
	@_ISBN nvarchar(17),
	@_bookName nvarchar(50),
	@_publisherNo int,
	@_categoryNo int,
	@_pageCount int,
	@_langNo int,
	@_DonMemberNo int,
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @Book_BookNo int
BEGIN TRY
	INSERT INTO [dbo].[Books]
           ([ISBN]
           ,[BookName]
           ,[PublisherNo]
           ,[CategoryNo]
           ,[BookPageCount]
           ,[ReleaseDate]
           ,[LangNo]
           ,[ResMemberNo]
           ,[ResDate]
           ,[isActive])
     VALUES
           (@_ISBN
           ,@_bookName
           ,@_publisherNo
           ,@_categoryNo
           ,@_pageCount
           ,GETDATE()
           ,@_langNo
           ,NULL
           ,NULL
           ,1)
	
	SELECT @Book_BookNo=BookNo FROM Books WHERE ISBN = @_ISBN
	INSERT INTO DonatedBooks(MemberNo, BookNo)
	VALUES (@_DonMemberNo,@Book_BookNo);

	SET @_Message = 'Kitap başarıyla kaydedildi.'
END TRY
BEGIN CATCH
	SET @_Message = 'Kitap kaydedilirken bir hata oluştu.';
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/09/2019>
-- Description:	<Kategori eklemek icin yazilmistir.>
-- =============================================
CREATE PROCEDURE [dbo].[AddCategory]
	@_CategoryName nvarchar(50),
	@_Message nvarchar(200) OUTPUT
AS
BEGIN TRY
	INSERT INTO [dbo].[Categories]
           ([CategoryName])
     VALUES
           (@_CategoryName)

	SET @_Message = 'Kategori başarıyla eklendi.'
END TRY
BEGIN CATCH
	SET @_Message = 'Kategori eklenirken bir hata oluştu.'
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddLang]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Dil ekleme>
-- =============================================
CREATE PROCEDURE [dbo].[AddLang]
	@_langName nvarchar(50)
AS
	DECLARE @Error int
BEGIN TRY
	INSERT INTO Languages(LangName,isActive)
	VALUES (@_langName,1);
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddPublisher]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Yayınevi ekleme scripti>
-- =============================================
CREATE PROCEDURE [dbo].[AddPublisher]
	@_publisherName nvarchar(50),
	@_phoneNo nvarchar(50),
	@_adress text,
	@_email nvarchar(50),
	@_webURL text
AS
	DECLARE @Error int
BEGIN TRY
	INSERT INTO Publishers(PublisherName, PhoneNo, PublisherAddress, Email, WebURL, isActive)
	VALUES (@_publisherName,@_phoneNo,@_adress,@_email,@_webURL,1);
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[AddStaff]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <14/12/2019>
-- Description:	<Personel eklemek icin yazilmis prosedurdur.>
-- =============================================
CREATE PROCEDURE [dbo].[AddStaff]
	@_nickName nvarchar(15),
	@_firstName nvarchar(15),
	@_lastName nvarchar(15),
	@_pass nvarchar(15),
	@_email nvarchar(30),
	@_departmenDesc nvarchar(20),
	@_titleDesc nvarchar(20),
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @_memberNo int
BEGIN TRY  
	SELECT @_memberNo = NEXT VALUE FOR SQ_memberNo ;

	INSERT INTO Staff(memberNo,departmentDesc,titleDesc)
    VALUES (@_memberNo,@_departmenDesc,@_titleDesc)

	INSERT INTO Members(memberNo,nickName,firstName,lastName,
						_password,email,registerTypeNo,isAdmin,isActive)
    VALUES(@_memberNo,@_nickName,@_firstName,@_lastName,@_pass,@_email,1,0,1)

	SET @_Message = 'Personel başarıyla eklendi.';
END TRY  
BEGIN CATCH  
	SET @_Message = 'Personel eklenirken bir hata oluştu'
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[AddStudent]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <14/12/2019>
-- Description:	<Ogrenci eklemek icin yazilmis prosedurdur>
-- =============================================
CREATE PROCEDURE [dbo].[AddStudent]
	@_nickName nvarchar(15),
	@_firstName nvarchar(15),
	@_lastName nvarchar(15),
	@_pass nvarchar(15),
	@_email nvarchar(30),
	@_registerTypeNo int,
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @_memberNo int
BEGIN TRY  
	SELECT @_memberNo = NEXT VALUE FOR SQ_memberNo ;

	INSERT INTO Students(memberNo,registerTypeNo)
    VALUES (@_memberNo,@_registerTypeNo)

	INSERT INTO Members(memberNo,nickName,firstName,lastName,
						_password,email,isAdmin,isActive)
    VALUES(@_memberNo,@_nickName,@_firstName,@_lastName,@_pass,@_email,0,1)

	SET @_Message = 'Öğrenci kaydı başarıyla eklendi.';
END TRY  
BEGIN CATCH  
	SET @_Message = 'Öğrenci kaydı eklenirken bir hata oluştu'
END CATCH

GO
/****** Object:  StoredProcedure [dbo].[BorrowBookFromLibrary]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/9/2019>
-- Description:	<Kullanicilarin kitaplari almaları icin yazilmistir.>
-- =============================================
CREATE PROCEDURE [dbo].[BorrowBookFromLibrary]
	@_BookNo int,
	@_MemberNo int,
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @Books_ResMemberNo int 
	DECLARE @Books_BookNo int
	DECLARE @BooksCount int
BEGIN

	SELECT @BooksCount=COUNT(*) FROM Books AS B WHERE B.ResMemberNo=1
	SELECT @Books_BookNo=BookNo, @Books_ResMemberNo=ResMemberNo FROM Books WHERE BookNo = @_BookNo;

	IF @BooksCount < 3 AND @Books_ResMemberNo IS NULL
		BEGIN
			INSERT INTO BorrowedBooks(BookNo,MemberNo,isActive)
			VALUES (@_BookNo,@_MemberNo,1);
			SET @_Message = 'Kitap basariyla alindi.';
		END
	ELSE 
		BEGIN
			SET @_Message = 'Kitap baskasinin uzerinde, yok veya kitap alma hakkiniz dolmus.';
		END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAuthor]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Yazar silmek icin yazilmistir.>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteAuthor]
	@_authorNo int
AS
	DECLARE @Error int
BEGIN TRY
	UPDATE Authors
	SET isActive = 0
	WHERE AuthorNo = @_authorNo;
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[DeleteBook]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Kitap silmek icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteBook]
	@_bookNo int
AS
	DECLARE @Error int
BEGIN TRY
	UPDATE Books
	SET isActive = 0
	WHERE BookNo = @_bookNo;
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[DeleteLang]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Dil silmek>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteLang]
	@_langNo nvarchar(50)
AS
	DECLARE @Error int
BEGIN TRY
	--DELETE FROM Languages WHERE LangNo = @_langNo;
	UPDATE Languages
	SET isActive = 0
	WHERE LangNo = @_langNo
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[DeletePublisher]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Yayinevi silmek icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[DeletePublisher]
	@_publisherNo int
AS
	DECLARE @Error int
BEGIN TRY
	--DELETE FROM Publishers WHERE PublisherNo = @_publisherNo;
	UPDATE Publishers
	SET isActive = 0
	WHERE PublisherNo = @_publisherNo
	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
/****** Object:  StoredProcedure [dbo].[GetLibraryInformation]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/09/2019>
-- Description:	<Genel bilgiler formu icin kutuphane bilgileri tablosunu tek tek dondurur.>
-- =============================================
CREATE PROCEDURE [dbo].[GetLibraryInformation]
	@_BookCount int OUTPUT,
	@_DonatedBookCount int OUTPUT,
	@_PublisherCount int OUTPUT,
	@_CategoryCount int OUTPUT,
	@_LanguageCount int OUTPUT,
	@_MemberCount int OUTPUT,
	@_NeededBookCount int OUTPUT,
	@_AuthorCount int OUTPUT
AS
BEGIN 
	SELECT 
		@_BookCount=BookCount,
		@_DonatedBookCount=DonatedBookCount,
		@_PublisherCount=PublisherCount,
		@_CategoryCount=CategoryCount,
		@_LanguageCount=LanguageCount,
		@_MemberCount=MemberCount,
		@_NeededBookCount=NeededBookCount,
		@_AuthorCount=AuthorCount
	FROM LibraryInformation
END 
GO
/****** Object:  StoredProcedure [dbo].[LeaveBook]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <09/12/2019>
-- Description:	<Kullanıcılar uzerınde olan kitapları bırakmalarını saglayan saklı yordamdır.>
-- =============================================
CREATE PROCEDURE [dbo].[LeaveBook]
	@_BookNo int,
	@_MemberNo int,
	@_Message nvarchar(200) OUTPUT
AS
	DECLARE @_BookResMemberNo int
BEGIN
	SELECT @_BookResMemberNo=B.ResMemberNo FROM Books AS B WHERE B.BookNo = @_BookNo
	
	IF @_BookResMemberNo IS NULL OR @_MemberNo != @_BookResMemberNo
		BEGIN
			SET @_Message = 'Bu kitap daha önce alınmamış veya sizin üzerinizde değil.'
		END
	ELSE 
		BEGIN
			UPDATE Books
			SET ResMemberNo = NULL, ResDate = NULL
			WHERE BookNo = @_BookNo
			SET @_Message = 'Kitap başarıyla bırakıldı.'
		END
END
GO
/****** Object:  StoredProcedure [dbo].[mtb_SampleExceptionHndling]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Create Stored procedure **/
CREATE PROCEDURE [dbo].[mtb_SampleExceptionHndling]
    @Error NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        SELECT 5/0;
    END TRY
    BEGIN CATCH
        SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' + Char(10) +
        'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' + Char(10) +
        'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' + Char(10) +
        'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' + Char(10) +
        'Error Message: ' + ERROR_MESSAGE()
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SelectBooksWithOtherTables]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/08/2019>
-- Description:	<Kitapları tum iliskili tablolarıyla birlikte gostermek icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBooksWithOtherTables]
AS
BEGIN 
	SELECT 
		B.BookNo AS KitapNo, 
		B.BookName AS KitapAdı, 
		CT.CategoryName AS Kategori,
		AUB.AuthorName AS Yazar, 
		P.PublisherName AS Yayıncı,
		L.LangName AS Dili,
		MEN.nickName AS AlanKullanici, 
		B.ResDate AS AlmaTarihi,
		DME.nickName AS BagislayanKullanici,
		B.ReleaseDate EklenmeTarihi 
	FROM Books AS B
	
	LEFT JOIN (
		SELECT 
			LN.LangNo,
			LN.LangName 
		FROM Languages AS LN) AS L 
	ON B.LangNo = L.LangNo
	
	INNER JOIN (SELECT * FROM Categories) AS CT 
	ON CT.CategoryNo = B.CategoryNo 
	
	LEFT JOIN (
		SELECT 
			PB.PublisherNo,
			PB.PublisherName  
		FROM Publishers AS PB) AS P
	ON B.PublisherNo = P.PublisherNo
	
	LEFT JOIN (
		SELECT BA.BookNo, AU.AuthorName
		FROM Authors AS AU 
		INNER JOIN BookAuthor AS BA 
		ON AU.AuthorNo = BA.AuthorNo) AS AUB 
	ON AUB.BookNo = B.BookNo
	
	LEFT JOIN (
		SELECT 
			ME.memberNo, 
			ME.nickName 
		FROM Members AS ME) AS MEN 
	ON B.ResMemberNo = MEN.memberNo

	LEFT JOIN (
		SELECT DOBO.BookNo, ME.nickName FROM DonatedBooks AS DOBO
		INNER JOIN Members AS ME 
		ON ME.memberNo = DOBO.MemberNo) AS DME
	ON DME.BookNo = B.BookNo
END
GO
/****** Object:  StoredProcedure [dbo].[SelectBooksWithWord]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/08/2019>
-- Description:	<Aranan kelimeye gore kitapları listeler.>
-- =============================================
CREATE PROCEDURE [dbo].[SelectBooksWithWord]
	@_BookName nvarchar(50)
AS
BEGIN
	SELECT 
		B.BookNo AS KitapNo, 
		B.BookName AS KitapAdı, 
		CT.CategoryName AS Kategori,
		AUB.AuthorName AS Yazar, 
		P.PublisherName AS Yayıncı,
		L.LangName AS Dili,
		MEN.nickName AS AlanKullanici, 
		B.ResDate AS AlmaTarihi,
		DME.nickName AS BagislayanKullanici,
		B.ReleaseDate EklenmeTarihi 
	FROM Books AS B
	
	LEFT JOIN (
		SELECT 
			LN.LangNo,
			LN.LangName 
		FROM Languages AS LN) AS L 
	ON B.LangNo = L.LangNo
	
	INNER JOIN (SELECT * FROM Categories) AS CT 
	ON CT.CategoryNo = B.CategoryNo 
	
	LEFT JOIN (
		SELECT 
			PB.PublisherNo,
			PB.PublisherName  
		FROM Publishers AS PB) AS P
	ON B.PublisherNo = P.PublisherNo
	
	LEFT JOIN (
		SELECT BA.BookNo, AU.AuthorName
		FROM Authors AS AU 
		INNER JOIN BookAuthor AS BA 
		ON AU.AuthorNo = BA.AuthorNo) AS AUB 
	ON AUB.BookNo = B.BookNo
	
	LEFT JOIN (
		SELECT 
			ME.memberNo, 
			ME.nickName 
		FROM Members AS ME) AS MEN 
	ON B.ResMemberNo = MEN.memberNo

	LEFT JOIN (
		SELECT DOBO.BookNo, ME.nickName FROM DonatedBooks AS DOBO
		INNER JOIN Members AS ME 
		ON ME.memberNo = DOBO.MemberNo) AS DME
	ON DME.BookNo = B.BookNo

	WHERE B.BookName LIKE '%'+@_BookName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[SelectDonatedBooks]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/09/2019>
-- Description:	<Bağışlanmış kitapların gosterilmesi icin yazilmistir.>
-- =============================================
CREATE PROCEDURE [dbo].[SelectDonatedBooks]
AS
BEGIN 
	SELECT 
		ME.nickName AS BagislayanKullanici, 
		Bo.BookName AS BagisladigiKitap 
	FROM DonatedBooks AS DoBo
	INNER JOIN (
		SELECT Bo.BookNo,Bo.BookName FROM Books AS Bo) AS Bo
		ON Bo.BookNo = DoBo.BookNo
	INNER JOIN (
		SELECT ME.memberNo,ME.nickName FROM Members AS ME) AS ME
		ON ME.memberNo = DoBo.MemberNo
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStaff]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <14/12/2019>
-- Description:	<Personel listesini getiren prosedur>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStaff]
AS
BEGIN 
	SELECT 
		ME.memberNo AS KullanıcıNo, 
		ME.nickName AS KullanıcıAdı,
		ME.firstName AS Adı,
		ME.lastName AS Soyadı,
		ME.email AS EPosta,
		ST.departmentDesc AS Departmanı,
		ST.titleDesc AS Görevi,
		ME.isAdmin AS AdminMi,
		ME.isActive AS AktifMi
	FROM Members AS ME
	INNER JOIN Staff AS ST ON ME.memberNo = ST.memberNo
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStudent]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <14/12/2019>
-- Description:	<Ogrencilerin listesini kalitim ve fk uygulanmis sekilde getiren prosedur>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStudent]
AS
BEGIN 
	SELECT 
		ME.memberNo AS KullanıcıNo, 
		ME.nickName AS KullanıcıAdı,
		ME.firstName AS Adı,
		ME.lastName AS Soyadı,
		ME.email AS EPosta,
		RT.registerTypeDesc AS Alanı,
		ME.isAdmin AS AdminMi,
		ME.isActive AS AktifMi
	FROM Members AS ME
	INNER JOIN Students AS ST ON ME.memberNo = ST.memberNo
	INNER JOIN RegisterTypes AS RT ON ST.registerTypeNo = RT.registerTypeNo
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMember]    Script Date: 12/15/2019 12:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Burak Yazan>
-- Create date: <12/7/2019>
-- Description:	<Kullaniciyi admin yapmak icin yazilmistir>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateMember]
	@_operation char,
	@_memberNo int
AS
	DECLARE @Error int
BEGIN TRY
	IF @_operation = 'U'
		BEGIN
			UPDATE Members
			SET isAdmin = 1
			WHERE memberNo = @_memberNo;
		END
	ELSE IF @_operation = 'D'
		BEGIN 
			UPDATE Members
			SET isActive = 0
			WHERE memberNo = @_memberNo;
		END

	SET @Error = 0
END TRY
BEGIN CATCH
	SET @Error = 1;
END CATCH;
GO
USE [master]
GO
ALTER DATABASE [kutuphaneDB] SET  READ_WRITE 
GO
