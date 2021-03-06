USE [master]
GO
/****** Object:  Database [ChageitDB]    Script Date: 6/20/2021 10:31:26 PM ******/
CREATE DATABASE [ChageitDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChageitDB', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChageitDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChageitDB_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChageitDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChageitDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChageitDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChageitDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChageitDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChageitDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChageitDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChageitDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChageitDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChageitDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChageitDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChageitDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChageitDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChageitDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChageitDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChageitDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChageitDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChageitDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChageitDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChageitDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChageitDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChageitDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChageitDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChageitDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChageitDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChageitDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ChageitDB] SET  MULTI_USER 
GO
ALTER DATABASE [ChageitDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChageitDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChageitDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChageitDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChageitDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChageitDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChageitDB', N'ON'
GO
ALTER DATABASE [ChageitDB] SET QUERY_STORE = OFF
GO
USE [ChageitDB]
GO
/****** Object:  Table [dbo].[AdInteractions]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdInteractions](
	[AdInteractionId] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[AdId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdRefId] [bigint] NOT NULL,
	[AdURL] [varchar](128) NOT NULL,
	[CampañaId] [bigint] NOT NULL,
	[ActionURL] [varchar](128) NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[AdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppSources]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppSources](
	[AppSourceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AppSources] PRIMARY KEY CLUSTERED 
(
	[AppSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auth_Providers]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth_Providers](
	[AuthProviderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Auth_Providers] PRIMARY KEY CLUSTERED 
(
	[AuthProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Benefits]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Benefits](
	[BenefitId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NULL,
 CONSTRAINT [PK_Benefits] PRIMARY KEY CLUSTERED 
(
	[BenefitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenefitsxHabit]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenefitsxHabit](
	[BenefitxHabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[BenefitId] [int] NOT NULL,
	[HabitId] [int] NOT NULL,
	[Value] [smallint] NOT NULL,
	[Measurement] [varchar](50) NULL,
 CONSTRAINT [PK_BenefitsxHabit] PRIMARY KEY CLUSTERED 
(
	[BenefitxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campañas]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campañas](
	[CampañaId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](150) NULL,
 CONSTRAINT [PK_Campañas] PRIMARY KEY CLUSTERED 
(
	[CampañaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntityTypes]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityTypes](
	[EntityTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_EntityTypes] PRIMARY KEY CLUSTERED 
(
	[EntityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits](
	[HabitId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_Habits] PRIMARY KEY CLUSTERED 
(
	[HabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitsPraticedbyUsers]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitsPraticedbyUsers](
	[HabitPbUId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[HabitId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Location] [geography] NOT NULL,
 CONSTRAINT [PK_HabitsPraticedbyUsers] PRIMARY KEY CLUSTERED 
(
	[HabitPbUId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HabitsSponsoredbyUsers]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitsSponsoredbyUsers](
	[HabitSbUId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[HabitId] [int] NOT NULL,
	[Date] [timestamp] NOT NULL,
	[Amount] [money] NOT NULL,
	[Location] [geography] NOT NULL,
	[radio] [float] NOT NULL,
	[ExpDate] [date] NOT NULL,
 CONSTRAINT [PK_HabitsSponsoredbyUsers] PRIMARY KEY CLUSTERED 
(
	[HabitSbUId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[Population] [int] NOT NULL,
	[Location] [geography] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LocationsxHabit]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LocationsxHabit](
	[LocationxHabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[HabitId] [int] NOT NULL,
	[Enabled] [bit] NULL,
 CONSTRAINT [PK_LocationsxHabit] PRIMARY KEY CLUSTERED 
(
	[LocationxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[LogTypeId] [int] NOT NULL,
	[SeverityId] [int] NOT NULL,
	[AppSourceId] [int] NOT NULL,
	[EntityTypeId] [int] NOT NULL,
	[Posttime] [datetime] NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[OldValue] [varchar](200) NULL,
	[NewValue] [varchar](200) NULL,
	[RefId1] [bigint] NULL,
	[RefId2] [bigint] NULL,
	[Checksum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTypes]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTypes](
	[LogTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_LogTypes] PRIMARY KEY CLUSTERED 
(
	[LogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Merchants]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchants](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Url] [varchar](128) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[IconUrl] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Merchants] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentAttempts]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAttempts](
	[PaymentAttemptId] [bigint] IDENTITY(1,1) NOT NULL,
	[Posttime] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[CurrencySymbol] [varchar](4) NOT NULL,
	[ReferenceNumber] [bigint] NOT NULL,
	[ErrorNumber] [int] NULL,
	[MerchantTransNumber] [int] NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[PaymentTimestamp] [timestamp] NOT NULL,
	[ComputerName] [varchar](100) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[IpAdress] [varbinary](16) NOT NULL,
	[Checksum] [varbinary](300) NOT NULL,
	[MerchantId] [int] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[HabitId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentAttempts] PRIMARY KEY CLUSTERED 
(
	[PaymentAttemptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentStatuses]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentStatuses](
	[PaymentStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentStatuses] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[PictureId] [bigint] IDENTITY(1,1) NOT NULL,
	[ImageURL] [varchar](128) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PicturesxHabit]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PicturesxHabit](
	[PicturexHabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[PictureId] [bigint] NOT NULL,
	[HabitId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PicturesxHabit] PRIMARY KEY CLUSTERED 
(
	[PicturexHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PicturesxUser]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PicturesxUser](
	[PicturexUsersId] [bigint] IDENTITY(1,1) NOT NULL,
	[PictureId] [bigint] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_PicturesxUser] PRIMARY KEY CLUSTERED 
(
	[PicturexUsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInteractions]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInteractions](
	[PostInteractionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PostInteractions] PRIMARY KEY CLUSTERED 
(
	[PostInteractionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostInteractionsxPosts]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostInteractionsxPosts](
	[PostInteractionxPostId] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[PostInteractionId] [int] NOT NULL,
	[value] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[PracticeStart] [datetime] NOT NULL,
	[PracticeEnd] [datetime] NOT NULL,
	[PostURL] [varchar](128) NOT NULL,
	[ActionURL] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Severity]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Severity](
	[SeverityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED 
(
	[SeverityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsxAd]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsxAd](
	[TagxAdId] [bigint] IDENTITY(1,1) NOT NULL,
	[AdId] [bigint] NOT NULL,
	[UTMTagId] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_TagsxAd] PRIMARY KEY CLUSTERED 
(
	[TagxAdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsxHabit]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsxHabit](
	[TagxHabitId] [bigint] IDENTITY(1,1) NOT NULL,
	[HabitId] [int] NOT NULL,
	[UTMTagId] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_TagsxHabit] PRIMARY KEY CLUSTERED 
(
	[TagxHabitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagsxPost]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagsxPost](
	[TagxPostId] [bigint] IDENTITY(1,1) NOT NULL,
	[PostId] [bigint] NOT NULL,
	[UTMTagId] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_TagsxPost] PRIMARY KEY CLUSTERED 
(
	[TagxPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha] [timestamp] NOT NULL,
	[Amount] [money] NOT NULL,
	[Description] [varchar](255) NULL,
	[Checksum] [varbinary](300) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ComputerName] [varchar](100) NOT NULL,
	[IpAdress] [varbinary](16) NOT NULL,
	[TransTypeId] [int] NOT NULL,
	[TransSubTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransSubType]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransSubType](
	[TransSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
 CONSTRAINT [PK_TransSubType] PRIMARY KEY CLUSTERED 
(
	[TransSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransType]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransType](
	[TransTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NOT NULL,
 CONSTRAINT [PK_TransType] PRIMARY KEY CLUSTERED 
(
	[TransTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](124) NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[Apellido1] [varchar](35) NOT NULL,
	[Apellido2] [varchar](35) NOT NULL,
	[BirthDay] [date] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersxProviders]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersxProviders](
	[UserxProviderId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AuthProviderId] [int] NOT NULL,
	[AuthCode] [varbinary](255) NOT NULL,
	[ExpDate] [timestamp] NOT NULL,
	[PorDefecto] [bit] NOT NULL,
 CONSTRAINT [PK_UsersxProviders] PRIMARY KEY CLUSTERED 
(
	[UserxProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTMTags]    Script Date: 6/20/2021 10:31:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTMTags](
	[UTMTagId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UTMTags] PRIMARY KEY CLUSTERED 
(
	[UTMTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Campañas] FOREIGN KEY([CampañaId])
REFERENCES [dbo].[Campañas] ([CampañaId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Campañas]
GO
ALTER TABLE [dbo].[BenefitsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_BenefitsxHabit_Benefits] FOREIGN KEY([BenefitId])
REFERENCES [dbo].[Benefits] ([BenefitId])
GO
ALTER TABLE [dbo].[BenefitsxHabit] CHECK CONSTRAINT [FK_BenefitsxHabit_Benefits]
GO
ALTER TABLE [dbo].[BenefitsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_BenefitsxHabit_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[BenefitsxHabit] CHECK CONSTRAINT [FK_BenefitsxHabit_Habits]
GO
ALTER TABLE [dbo].[HabitsPraticedbyUsers]  WITH CHECK ADD  CONSTRAINT [FK_HabitsPraticedbyUsers_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[HabitsPraticedbyUsers] CHECK CONSTRAINT [FK_HabitsPraticedbyUsers_Habits]
GO
ALTER TABLE [dbo].[HabitsPraticedbyUsers]  WITH CHECK ADD  CONSTRAINT [FK_HabitsPraticedbyUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[HabitsPraticedbyUsers] CHECK CONSTRAINT [FK_HabitsPraticedbyUsers_Users]
GO
ALTER TABLE [dbo].[HabitsSponsoredbyUsers]  WITH CHECK ADD  CONSTRAINT [FK_HabitsSponsoredbyUsers_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[HabitsSponsoredbyUsers] CHECK CONSTRAINT [FK_HabitsSponsoredbyUsers_Habits]
GO
ALTER TABLE [dbo].[HabitsSponsoredbyUsers]  WITH CHECK ADD  CONSTRAINT [FK_HabitsSponsoredbyUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[HabitsSponsoredbyUsers] CHECK CONSTRAINT [FK_HabitsSponsoredbyUsers_Users]
GO
ALTER TABLE [dbo].[LocationsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_LocationsxHabit_Cities] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([LocationId])
GO
ALTER TABLE [dbo].[LocationsxHabit] CHECK CONSTRAINT [FK_LocationsxHabit_Cities]
GO
ALTER TABLE [dbo].[LocationsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_LocationsxHabit_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[LocationsxHabit] CHECK CONSTRAINT [FK_LocationsxHabit_Habits]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_AppSources] FOREIGN KEY([AppSourceId])
REFERENCES [dbo].[AppSources] ([AppSourceId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_AppSources]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_EntityTypes] FOREIGN KEY([EntityTypeId])
REFERENCES [dbo].[EntityTypes] ([EntityTypeId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_EntityTypes]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_LogTypes] FOREIGN KEY([LogTypeId])
REFERENCES [dbo].[LogTypes] ([LogTypeId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_LogTypes]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Severity] FOREIGN KEY([SeverityId])
REFERENCES [dbo].[Severity] ([SeverityId])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Severity]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAttempts_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [FK_PaymentAttempts_Habits]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAttempts_Merchants] FOREIGN KEY([MerchantId])
REFERENCES [dbo].[Merchants] ([MerchantId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [FK_PaymentAttempts_Merchants]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAttempts_PaymentStatuses] FOREIGN KEY([PaymentStatusId])
REFERENCES [dbo].[PaymentStatuses] ([PaymentStatusId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [FK_PaymentAttempts_PaymentStatuses]
GO
ALTER TABLE [dbo].[PaymentAttempts]  WITH CHECK ADD  CONSTRAINT [FK_PaymentAttempts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PaymentAttempts] CHECK CONSTRAINT [FK_PaymentAttempts_Users]
GO
ALTER TABLE [dbo].[PicturesxHabit]  WITH CHECK ADD  CONSTRAINT [FK_PicturesxHabit_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[PicturesxHabit] CHECK CONSTRAINT [FK_PicturesxHabit_Habits]
GO
ALTER TABLE [dbo].[PicturesxHabit]  WITH CHECK ADD  CONSTRAINT [FK_PicturesxHabit_Pictures] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([PictureId])
GO
ALTER TABLE [dbo].[PicturesxHabit] CHECK CONSTRAINT [FK_PicturesxHabit_Pictures]
GO
ALTER TABLE [dbo].[PicturesxUser]  WITH CHECK ADD  CONSTRAINT [FK_PicturesxUser_Pictures] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([PictureId])
GO
ALTER TABLE [dbo].[PicturesxUser] CHECK CONSTRAINT [FK_PicturesxUser_Pictures]
GO
ALTER TABLE [dbo].[PicturesxUser]  WITH CHECK ADD  CONSTRAINT [FK_PicturesxUser_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PicturesxUser] CHECK CONSTRAINT [FK_PicturesxUser_Users]
GO
ALTER TABLE [dbo].[PostInteractionsxPosts]  WITH CHECK ADD  CONSTRAINT [FK_PostInteractionsxPosts_PostInteractions] FOREIGN KEY([PostInteractionId])
REFERENCES [dbo].[PostInteractions] ([PostInteractionId])
GO
ALTER TABLE [dbo].[PostInteractionsxPosts] CHECK CONSTRAINT [FK_PostInteractionsxPosts_PostInteractions]
GO
ALTER TABLE [dbo].[PostInteractionsxPosts]  WITH CHECK ADD  CONSTRAINT [FK_PostInteractionsxPosts_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[PostInteractionsxPosts] CHECK CONSTRAINT [FK_PostInteractionsxPosts_Posts]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[TagsxAd]  WITH CHECK ADD  CONSTRAINT [FK_TagsxAd_Ads] FOREIGN KEY([AdId])
REFERENCES [dbo].[Ads] ([AdId])
GO
ALTER TABLE [dbo].[TagsxAd] CHECK CONSTRAINT [FK_TagsxAd_Ads]
GO
ALTER TABLE [dbo].[TagsxAd]  WITH CHECK ADD  CONSTRAINT [FK_TagsxAd_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[TagsxAd] CHECK CONSTRAINT [FK_TagsxAd_UTMTags]
GO
ALTER TABLE [dbo].[TagsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_TagsxHabit_Habits] FOREIGN KEY([HabitId])
REFERENCES [dbo].[Habits] ([HabitId])
GO
ALTER TABLE [dbo].[TagsxHabit] CHECK CONSTRAINT [FK_TagsxHabit_Habits]
GO
ALTER TABLE [dbo].[TagsxHabit]  WITH CHECK ADD  CONSTRAINT [FK_TagsxHabit_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[TagsxHabit] CHECK CONSTRAINT [FK_TagsxHabit_UTMTags]
GO
ALTER TABLE [dbo].[TagsxPost]  WITH CHECK ADD  CONSTRAINT [FK_TagsxPost_Posts] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([PostId])
GO
ALTER TABLE [dbo].[TagsxPost] CHECK CONSTRAINT [FK_TagsxPost_Posts]
GO
ALTER TABLE [dbo].[TagsxPost]  WITH CHECK ADD  CONSTRAINT [FK_TagsxPost_UTMTags] FOREIGN KEY([UTMTagId])
REFERENCES [dbo].[UTMTags] ([UTMTagId])
GO
ALTER TABLE [dbo].[TagsxPost] CHECK CONSTRAINT [FK_TagsxPost_UTMTags]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransSubType] FOREIGN KEY([TransSubTypeId])
REFERENCES [dbo].[TransSubType] ([TransSubTypeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransSubType]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransType] FOREIGN KEY([TransTypeId])
REFERENCES [dbo].[TransType] ([TransTypeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransType]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Users]
GO
ALTER TABLE [dbo].[UsersxProviders]  WITH CHECK ADD  CONSTRAINT [FK_UsersxProviders_Auth_Providers] FOREIGN KEY([AuthProviderId])
REFERENCES [dbo].[Auth_Providers] ([AuthProviderId])
GO
ALTER TABLE [dbo].[UsersxProviders] CHECK CONSTRAINT [FK_UsersxProviders_Auth_Providers]
GO
ALTER TABLE [dbo].[UsersxProviders]  WITH CHECK ADD  CONSTRAINT [FK_UsersxProviders_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UsersxProviders] CHECK CONSTRAINT [FK_UsersxProviders_Users]
GO
USE [master]
GO
ALTER DATABASE [ChageitDB] SET  READ_WRITE 
GO
