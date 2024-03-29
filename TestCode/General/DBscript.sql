USE [master]
GO
/****** Object:  Database [!ESTY&TAMAR]    Script Date: 08/09/2019 02:11:33 ******/
CREATE DATABASE [!ESTY&TAMAR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'!ESTY&TAMAR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\!ESTY&TAMAR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'!ESTY&TAMAR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\!ESTY&TAMAR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [!ESTY&TAMAR] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [!ESTY&TAMAR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ARITHABORT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [!ESTY&TAMAR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [!ESTY&TAMAR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [!ESTY&TAMAR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET RECOVERY FULL 
GO
ALTER DATABASE [!ESTY&TAMAR] SET  MULTI_USER 
GO
ALTER DATABASE [!ESTY&TAMAR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [!ESTY&TAMAR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [!ESTY&TAMAR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [!ESTY&TAMAR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [!ESTY&TAMAR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'!ESTY&TAMAR', N'ON'
GO
ALTER DATABASE [!ESTY&TAMAR] SET QUERY_STORE = OFF
GO
USE [!ESTY&TAMAR]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [!ESTY&TAMAR]
GO
/****** Object:  Table [dbo].[Absence]    Script Date: 08/09/2019 02:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absence](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Absence] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AbsencesForTeacher]    Script Date: 08/09/2019 02:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbsencesForTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[TeacherStandIn] [int] NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
 CONSTRAINT [PK_AbsencesForTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 08/09/2019 02:11:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Num] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Layer] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[SchoolType] [int] NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassesForGroup]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesForGroup](
	[GroupId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_ClassesForGroup] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassesForOccasion]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassesForOccasion](
	[OccasionId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_ClassesForOcation] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DairyForClasses]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DairyForClasses](
	[DairyId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_DairyForClasses] PRIMARY KEY CLUSTERED 
(
	[DairyId] ASC,
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] NOT NULL,
	[Num] [int] NOT NULL,
	[Teacher] [int] NULL,
	[Subject] [int] NULL,
	[Room] [int] NULL,
	[Hours] [int] NULL,
	[CalculateHours] [decimal](4, 2) NULL,
	[SchoolType] [int] NULL,
	[Reforma] [int] NULL,
	[PayAbsence] [int] NULL,
	[HourType] [int] NULL,
	[SubHourType] [int] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HourType]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourType](
	[Id] [int] NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](70) NOT NULL,
 CONSTRAINT [PK_HourType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occasion]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[OccasionType] [int] NULL,
	[FromLesson] [int] NULL,
	[ToLesson] [int] NULL,
 CONSTRAINT [PK_Ocation_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OccasionType]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OccasionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayAbsence]    Script Date: 08/09/2019 02:11:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayAbsence](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[IsStandart] [bit] NULL,
 CONSTRAINT [PK_GormimMeshalmim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayAbsencesForTeacher]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayAbsencesForTeacher](
	[IdTeacher] [int] NOT NULL,
	[IdPayAbsence] [int] NOT NULL,
 CONSTRAINT [PK_PayAbsencesForTeacher] PRIMARY KEY CLUSTERED 
(
	[IdTeacher] ASC,
	[IdPayAbsence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reforma]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reforma](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Reforma] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Floor] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[ClassId] [int] NULL,
	[UseFor] [nvarchar](20) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomsForOccasion]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomsForOccasion](
	[OccasionId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
 CONSTRAINT [PK_RoomsForOcation] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[Id] [int] NOT NULL,
	[Num] [int] NULL,
	[TeacherId] [int] NULL,
	[SubjectId] [int] NULL,
	[TypeId] [int] NULL,
	[ClassId] [int] NULL,
	[RoomId] [int] NULL,
	[IsGrouped] [bit] NOT NULL,
	[OccasionId] [int] NULL,
	[Reforma] [int] NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[Hour] [int] NOT NULL,
	[CalculateHours] [decimal](4, 2) NULL,
	[Cause] [int] NULL,
 CONSTRAINT [PK_Groups_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolType]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolType](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SchoolType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudyTime]    Script Date: 08/09/2019 02:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudyTime](
	[Num] [int] NOT NULL,
	[WeekDay] [int] NOT NULL,
	[Day] [int] NOT NULL,
	[Hour] [int] NOT NULL,
	[Room] [int] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 08/09/2019 02:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Subjects_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectsForClass]    Script Date: 08/09/2019 02:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectsForClass](
	[ClassId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
 CONSTRAINT [PK_SubjectsForClass] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC,
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 08/09/2019 02:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Num] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersForOccasion]    Script Date: 08/09/2019 02:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersForOccasion](
	[OccasionId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_TeachersForOcation_1] PRIMARY KEY CLUSTERED 
(
	[OccasionId] ASC,
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Absence] ON 

INSERT [dbo].[Absence] ([Id], [Name]) VALUES (4, N'מחלה')
INSERT [dbo].[Absence] ([Id], [Name]) VALUES (5, N'מחלת ילד')
INSERT [dbo].[Absence] ([Id], [Name]) VALUES (6, N'שמחה משפחתית')
SET IDENTITY_INSERT [dbo].[Absence] OFF
SET IDENTITY_INSERT [dbo].[AbsencesForTeacher] ON 

INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (9, 4, 179, CAST(N'2019-08-04T01:03:02.460' AS DateTime), CAST(N'2019-08-04T01:03:02.477' AS DateTime), 180, 1, 5)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (10, 6, 12, CAST(N'2019-08-04T00:00:00.000' AS DateTime), CAST(N'2019-08-04T00:00:00.000' AS DateTime), 22, 3, 5)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (11, 6, 174, CAST(N'2019-08-05T00:00:00.000' AS DateTime), CAST(N'2019-08-05T00:00:00.000' AS DateTime), 9, 1, 8)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (12, 6, 254, CAST(N'2019-08-09T00:00:00.000' AS DateTime), CAST(N'2019-08-09T00:00:00.000' AS DateTime), NULL, 4, 8)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (1012, 5, 234, CAST(N'2019-08-17T00:00:00.000' AS DateTime), CAST(N'2019-08-18T00:00:00.000' AS DateTime), 134, 1, 6)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (1013, 6, 82, CAST(N'2019-08-17T00:00:00.000' AS DateTime), CAST(N'2019-08-24T00:00:00.000' AS DateTime), 139, 1, 4)
INSERT [dbo].[AbsencesForTeacher] ([Id], [Type], [TeacherId], [FromDate], [ToDate], [TeacherStandIn], [FromLesson], [ToLesson]) VALUES (1014, 6, 255, CAST(N'2019-08-27T00:00:00.000' AS DateTime), CAST(N'2019-08-28T00:00:00.000' AS DateTime), 252, 6, 8)
SET IDENTITY_INSERT [dbo].[AbsencesForTeacher] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (241, 0, N'ט 1', 9, 1, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (242, 1, N'ט 2', 9, 2, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (243, 2, N'ט 3', 9, 3, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (244, 3, N'ט 4', 9, 4, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (245, 4, N'ט 5', 9, 5, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (246, 5, N'ט 6', 9, 6, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (247, 6, N'ט 7', 9, 7, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (248, 7, N'ט 8', 9, 8, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (249, 8, N'ט 9', 9, 9, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (250, 9, N'ט 10', 9, 10, 2)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (251, 10, N'י 1', 10, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (252, 11, N'י 2', 10, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (253, 12, N'י 3', 10, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (254, 19, N'י 4', 10, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (255, 13, N'י 5', 10, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (256, 15, N'י 6', 10, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (257, 14, N'י 7', 10, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (258, 16, N'י 8', 10, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (259, 17, N'י 9', 10, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (260, 18, N'י 10', 10, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (261, 20, N'יא 1', 11, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (262, 21, N'יא 2', 11, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (263, 22, N'יא 3', 11, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (264, 29, N'יא.4', 11, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (265, 23, N'יא 5', 11, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (266, 24, N'יא 6', 11, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (267, 25, N'יא 7', 11, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (268, 26, N'יא 8', 11, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (269, 27, N'יא 9', 11, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (270, 28, N'יא 10', 11, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (271, 30, N'יב 1', 12, 1, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (272, 31, N'יב 2', 12, 2, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (273, 32, N'יב 3', 12, 3, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (274, 33, N'יב 4', 12, 4, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (275, 34, N'יב 5', 12, 5, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (276, 35, N'יב 6', 12, 6, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (277, 36, N'יב 7', 12, 7, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (278, 37, N'יב 8', 12, 8, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (279, 38, N'יב 9', 12, 9, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (280, 39, N'יב 10', 12, 10, 3)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (281, 40, N'יג 1', 13, 1, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (282, 41, N'יג 2', 13, 2, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (283, 42, N'יג 3', 13, 3, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (284, 43, N'יג 4', 13, 4, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (285, 44, N'יג 5', 13, 5, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (286, 45, N'יג 6', 13, 6, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (287, 46, N'יג 7', 13, 7, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (288, 47, N'יג 8', 13, 8, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (289, 48, N'יג 9', 13, 9, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (290, 49, N'יג 10', 13, 10, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (291, 50, N'יד 1', 14, 1, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (292, 51, N'יד 2', 14, 2, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (293, 52, N'יד 3', 14, 3, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (294, 53, N'יד 4', 14, 4, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (295, 54, N'יד 5', 14, 5, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (296, 55, N'יד 6', 14, 6, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (297, 56, N'יד 7', 14, 7, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (298, 57, N'יד 8', 14, 8, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (299, 58, N'יד 9', 14, 9, 4)
INSERT [dbo].[Class] ([Id], [Num], [Name], [Layer], [Number], [SchoolType]) VALUES (300, 59, N'יד 10', 14, 10, 4)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[OccasionType] ON 

INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (1, N'טיול')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (2, N'תוכנית')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (3, N'הרצאה')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (4, N'מבחן')
INSERT [dbo].[OccasionType] ([Id], [Name]) VALUES (5, N'מחנה')
SET IDENTITY_INSERT [dbo].[OccasionType] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (1, 0, 6, NULL, N'הקב, 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (2, 0, 7, NULL, N'הקב, 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (3, 0, 8, NULL, N'הקב, 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (4, 0, 9, NULL, N'הקב, 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (5, 1, 100, NULL, N'הקב, 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (6, 1, 101, NULL, N'הקב, 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (7, 1, 102, NULL, N'הקב, 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (8, 1, 103, NULL, N'הקב, 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (9, 9, 908, NULL, N'קב'' 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (10, 1, 108, NULL, N'התעמלות')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (11, 1, 106, NULL, N'חדר יהדות')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (12, 2, 209, 241, N'ט 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (13, 3, 300, 242, N'ט 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (14, 3, 301, 243, N'ט 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (15, 3, 302, 244, N'ט 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (16, 3, 303, 245, N'ט 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (17, 3, 304, 246, N'ט 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (18, 3, 305, 247, N'ט 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (19, 3, 306, 248, N'ט 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (20, 3, 307, 249, N'ט 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (21, 3, 308, 250, N'ט 10')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (22, 1, 109, 251, N'י 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (23, 2, 200, 252, N'י 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (24, 2, 201, 253, N'י 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (25, 2, 208, 254, N'י 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (26, 2, 202, 255, N'י 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (27, 2, 203, 256, N'י 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (28, 2, 204, 257, N'י 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (29, 2, 205, 258, N'י 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (30, 2, 206, 259, N'י 9')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (31, 2, 207, 260, N'י 10')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (32, 0, 0, NULL, N'מחשבים 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (33, 0, 1, NULL, N'מחשבים 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (34, 0, 2, NULL, N'מחשבים 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (35, 0, 3, NULL, N'מחשבים 4')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (36, 0, 4, NULL, N'מחשבים 5')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (37, 0, 5, NULL, N'מחשבים 6')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (38, 4, 400, NULL, N'מחשבים 7')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (39, 4, 401, NULL, N'מחשבים 8')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (40, 1, 107, NULL, N'ספריה')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (41, 4, 402, NULL, N'תפירה 1')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (42, 4, 403, NULL, N'תפירה 2')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (43, 4, 404, NULL, N'תפירה 3')
INSERT [dbo].[Room] ([Id], [Floor], [Number], [ClassId], [UseFor]) VALUES (44, 4, 405, NULL, N'תפירה 4')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2000, N'כתובים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2001, N'יהדות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2002, N'תורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2003, N'בקיאות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2004, N'נ ראשונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2005, N'נ אחרונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2006, N'פיוט ואגדתא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2007, N'דינים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2008, N'דעות ומידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2009, N'ח הלבבות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2010, N'הסטוריה י')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2011, N'הסטוריה כ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2012, N'כימיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2013, N'אזרחות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2014, N'אנגלית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2015, N'שמיטה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2016, N'מחשבים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2017, N'ע ראשונה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2018, N'פס בהוראה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2019, N'פס עיונית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2020, N'אומנות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2021, N'מתמטיקה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2022, N'מסילת ישרים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2023, N'דקדוק')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2024, N'מדעים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2025, N'הסטוריה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2026, N'התעמלות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2027, N'פדגוגיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2028, N'מתוד,קדש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2029, N'שמיה"ל')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2030, N'דיון  ושיח')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2031, N'עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2032, N'מבוא לח"מ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2033, N'ספריה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2034, N'מתוד''   לגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2035, N'ספורי תורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2036, N'חינוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2037, N'נביא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2038, N'הבעה והבנה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2039, N'תחביר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2040, N'פ השבוע')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2041, N'קול יוצר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2042, N'מתור, לחשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2043, N'מוכנות לחשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2044, N'קשרים וכשורים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2045, N'והערב נא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2046, N'דרשו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2047, N'עברית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2048, N'ודברת בם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2049, N'קומי עורי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2050, N'ריתמיקה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2051, N'מתוד,כללית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2052, N'אומנות בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2053, N'תזונה ובריאות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2054, N'משאבי למידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2055, N'פסיכולוגיה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2056, N'מן המקור')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2057, N'תפירה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2058, N'עיצוב')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2059, N'טכסטיל')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2060, N'אורחות יושר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2061, N'קשרים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2062, N'מוסר ומידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2063, N'מפרשי התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2064, N'כתובים ק''')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2065, N'סוגיות חינוכיות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2066, N'הצגה בלמידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2067, N'מגילות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2068, N'הבית יהודי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2069, N'אמונה ובטחון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2070, N'טבע בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2071, N'חורבן יהדות אירופה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2072, N'דיוקים בתנ"ך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2073, N'אנגלית מדברת א,')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2074, N'כלים בלמידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2075, N'מוסר וחסידות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2076, N'מודעות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2077, N'אחת שאלתי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2078, N'לישרים תהילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2079, N'אנגלית מדוברת א,2')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2080, N'חשבון בגן')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2081, N'מפרשי התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2082, N'אז נדברו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2083, N'הסטוריה ישראלית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2084, N'לשון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2085, N'חנוך לנער')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2086, N'רישומים דידקטים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2087, N'משחקים דידקטים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2088, N'ימים מיוחדים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2089, N'מקראי קדש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2090, N'הקנית מושגים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2091, N'מג'' טכנלוגית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2092, N'התפתחות רגשית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2093, N'אורינות מדעית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2094, N'לשוב לאיתנים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2095, N'חשבון')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2096, N'מג'' ספר עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2097, N'עלי ספר-עיונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2098, N'מוכניות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2099, N'פ"ש בגן')
GO
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2100, N'השקפה ואקטואליה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2101, N'ודברת בם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2102, N'סוגיות בחינוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2103, N'מסורת העברת התורה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2104, N'חכמת נשים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2105, N'"תוספת.בניה"')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2106, N'עיונים.במשנת')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2107, N'תהילים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2108, N'מחשבת לתיכונים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2109, N'מטעמי המקרא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2110, N'שערים לתפילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2111, N'שמיטה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2112, N'העצמה חינוכית')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2113, N'מעגלי יושר')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2114, N'מבקשי')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2115, N'שיח מחנכת')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2116, N'ספר החנוך')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2117, N'הל'' כבוד או"א')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2118, N'צוות בצותא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2119, N'עיקבתא דמשיחא')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2120, N'חיי עולם')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2121, N'שערי תפילה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2122, N'איסט'' למידה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2123, N'פרטני')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2124, N'דעת עצמנו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2125, N'שה"ש')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2126, N'מכתב מאליהו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2127, N'הל,מוקצה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2128, N'הל,יחוד')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2129, N'שהייה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2130, N'שיחה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2131, N'בית  יודי ')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2133, N'משנת חכמים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2134, N'למועד הימים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2135, N'שמונה פרקים')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2136, N'תומכות הוראה')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2138, N'מצוות תמידיות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2139, N'מעשי אבות')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2166, N'האזינו')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2249, N'הל'' כבוד אן"א')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2999, N'העשרה')
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (1, 1197, N'אדלר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (2, 1231, N'אדלר ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (3, 1151, N'אדלר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (4, 1100, N'אדלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (5, 1073, N'אדלשטיין ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (6, 1006, N'אולמן ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (7, 1180, N'אולמן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (8, 1098, N'איזנשטיין ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (9, 1084, N'איזנשטיין ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (10, 1177, N'איתן י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (11, 1099, N'איתן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (12, 1159, N'אלחרר ש"צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (13, 1189, N'אלטוסקי.ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (14, 1138, N'אלפא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (15, 1050, N'אלפר ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (16, 1178, N'אנגל פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (17, 1160, N'אריאלי ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (18, 1000, N'בביוף..ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (19, 1157, N'בוגץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (20, 1109, N'בוימרינד ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (21, 1179, N'בידרמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (22, 1114, N'בלום ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (23, 1034, N'בן שלמה א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (24, 1033, N'בן- שלמה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (25, 1024, N'בק  ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (26, 1090, N'ברגמן ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (27, 1240, N'ברדנשטיין ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (28, 1119, N'ברונפמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (29, 1124, N'ברטלר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (30, 1115, N'ברטלר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (31, 1125, N'ברטלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (32, 1091, N'ברלינגר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (33, 1055, N'ברמן א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (34, 1081, N'ברמן פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (35, 1156, N'ברנפלד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (36, 1247, N'ברנשטיין ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (37, 1062, N'גוטליב.ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (38, 1194, N'גולדברג פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (39, 1183, N'גולדוסר.מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (40, 1023, N'גולדיש הרב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (41, 1170, N'גילרנטר ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (42, 1149, N'גינזבורג א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (43, 1039, N'גינזבורג מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (44, 1195, N'גינסברגר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (45, 1226, N'גינסברגר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (46, 1185, N'גלעד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (47, 1061, N'גנוט ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (48, 1132, N'גרבוז ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (49, 1105, N'גרוב ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (50, 1049, N'גרינולד מרים')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (51, 1279, N'גרמן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (52, 1184, N'דויטש ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (53, 1208, N'דויטש ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (54, 1080, N'דיאמנט הרב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (55, 1068, N'דינקל ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (56, 1999, N'דינר רות')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (57, 1191, N'דסקל מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (58, 1027, N'דרבקין ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (59, 1026, N'דרבקין ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (60, 1095, N'דרורי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (61, 1162, N'הורביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (62, 1104, N'הלפרן ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (63, 1233, N'הלר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (64, 1032, N'הרב וולף')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (65, 1130, N'הרב וולף ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (66, 1020, N'הרשלר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (67, 1021, N'הרשלר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (68, 1031, N'וולף ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (69, 1215, N'וייס ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (70, 1083, N'וינטר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (71, 1082, N'וינטרויב י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (72, 1102, N'ויספיש א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (73, 1212, N'ויספיש ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (74, 1103, N'ויספיש פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (75, 1196, N'ולדודה צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (76, 1145, N'ולדמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (77, 1071, N'זייציק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (78, 1161, N'זיכרמן ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (79, 1070, N'זילבר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (80, 1018, N'זינגר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (81, 1202, N'זיסמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (82, 1131, N'זכריש ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (83, 1205, N'זלושינסקי')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (84, 1140, N'זלזניק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (85, 1137, N'זנדמן ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (86, 1094, N'זריצקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (87, 1066, N'ח שולזינגר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (88, 1154, N'חיים ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (89, 1004, N'טאוב ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (90, 1153, N'טאובה ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (91, 1225, N'טאראב מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (92, 1142, N'טופורוביץ ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (93, 1044, N'טננבוים ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (94, 1075, N'טננהויז א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (95, 1199, N'יוגל ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (96, 1206, N'יוספי מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (97, 1211, N'יחזקאל בש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (98, 1217, N'יעבץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (99, 1063, N'יעקבוביץ ח')
GO
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (100, 1069, N'יעקבוביץ.א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (101, 1079, N'יעקבזון נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (102, 1078, N'יעקבזון ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (103, 1182, N'יערי.ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (104, 1146, N'ישראל ב"ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (105, 1218, N'ישראלזון ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (106, 1117, N'ישרמי י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (107, 1122, N'כהן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (108, 1120, N'כהן ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (109, 1256, N'כהן פ ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (110, 1121, N'כהן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (111, 1123, N'כהן רחל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (112, 1213, N'כהן ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (113, 1074, N'כהן..רחל..2')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (114, 1201, N'כץ נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (115, 1214, N'לאבנשטיין ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (116, 1096, N'לוי ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (117, 1234, N'לוי מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (118, 1152, N'לוי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (119, 1112, N'לוין א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (120, 1251, N'לורוא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (121, 1059, N'לוריא י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (122, 1186, N'לוריא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (123, 1058, N'לוריא מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (124, 1060, N'לוריא ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (125, 1209, N'לורנץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (126, 1040, N'ליבוביץ ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (127, 1249, N'ליבוביץ מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (128, 1051, N'ליברמן י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (129, 1047, N'לידר ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (130, 1046, N'לידר נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (131, 1171, N'ליזנובסקי ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (132, 1200, N'ליטקה ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (133, 1193, N'לנדא ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (134, 1168, N'לנציצקי א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (135, 1155, N'לרנר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (136, 1037, N'לרר פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (137, 1175, N'מאגר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (138, 1092, N'מאיר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (139, 1141, N'מאירוביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (140, 1203, N'מובשוביץ ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (141, 1147, N'מונדרי צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (142, 1227, N'מונק מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (143, 1077, N'מילר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (144, 1236, N'מילר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (145, 1219, N'מינצר ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (146, 1242, N'מליק ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (147, 1057, N'מלכא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (148, 1221, N'מן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (149, 1222, N'מרמרוש ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (150, 1150, N'נבנצאל ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (151, 1220, N'נובק ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (152, 1048, N'נוימן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (153, 1025, N'סאלם א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (154, 1017, N'סבו ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (155, 1015, N'סגל א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (156, 1016, N'סגל ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (157, 1045, N'סגל ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (158, 1134, N'סופר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (159, 1243, N'סימפולינסקי ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (160, 1106, N'סלובס מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (161, 1239, N'ספרא א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (162, 1148, N'ספרא צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (163, 1093, N'עמרם ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (164, 1110, N'עמרם ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (165, 1163, N'פוברסקי ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (166, 1190, N'פוריס ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (167, 1198, N'פיינשטיין נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (168, 1237, N'פיינשטיין ע')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (169, 1245, N'פינקלשטיין נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (170, 1228, N'פיפרמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (171, 1108, N'פישהוף א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (172, 1107, N'פישהוף ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (173, 1133, N'פישר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (174, 1223, N'פליישמן ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (175, 1244, N'פלר פ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (176, 1111, N'פסטבסקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (177, 1252, N'פקירו ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (178, 1056, N'פרוינד ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (179, 1207, N'פרוכטר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (180, 1187, N'פרידלנדר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (181, 1126, N'פרידמן ד')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (182, 1128, N'פרידמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (183, 1127, N'פרידמן שפ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (184, 1204, N'פרץ א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (185, 1238, N'פרקש ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (186, 1030, N'צביון ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (187, 1013, N'צוקר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (188, 1139, N'צייטלין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (189, 1067, N'צימרמן נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (190, 1229, N'צלר ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (191, 1166, N'קויפמן ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (192, 1076, N'קויפמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (193, 1143, N'קופשיץ.מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (194, 1011, N'קורלנסקי ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (195, 1012, N'קורלנסקי ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (196, 1022, N'קורנפלד ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (197, 1176, N'קימל י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (198, 1116, N'קינסטלכער ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (199, 1038, N'קיסנר ש')
GO
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (200, 1241, N'קלויזנר ז')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (201, 1254, N'קלויזנר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (202, 1054, N'קלופט ל')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (203, 1003, N'קלופר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (204, 1230, N'קליין א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (205, 1118, N'קליין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (206, 1097, N'קליינמן ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (207, 1009, N'קלרמן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (208, 1010, N'קלרמן נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (209, 1216, N'קנובל א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (210, 1246, N'קנופלר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (211, 1248, N'קצבורג צ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (212, 1035, N'קראוס י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (213, 1113, N'קראוס נ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (214, 1165, N'קראוס ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (215, 1052, N'קרלשטיין מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (216, 1101, N'קרפט ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (217, 1065, N'ר שולזינגר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (218, 1087, N'ראובן')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (219, 1053, N'ראם ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (220, 1043, N'ראקוב י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (221, 1169, N'רבינוביץ ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (222, 1172, N'רבנים')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (223, 1210, N'רבנים ו')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (224, 1235, N'רהאן')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (225, 1088, N'רובין ת')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (226, 1167, N'רוזן ה')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (227, 1164, N'רוזנברג ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (228, 1029, N'רוט א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (229, 1028, N'רוט ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (230, 1036, N'רוטר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (231, 1144, N'רוכלין ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (232, 1135, N'רייכנברג ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (233, 1181, N'ריינר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (234, 1005, N'שוב ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (235, 1232, N'שוגול י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (236, 1002, N'שוורץ ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (237, 1173, N'שוורצברג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (238, 1041, N'שוורצמן מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (239, 1014, N'שולזינגר ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (240, 1174, N'שולזינגר ח')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (241, 1064, N'שולזינגר ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (242, 1192, N'שטיינהרטר..ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (243, 1224, N'שטמר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (244, 1188, N'שטראוס ע')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (245, 1001, N'שטרנגר מ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (246, 1086, N'שיף א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (247, 1089, N'שיף ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (248, 1257, N'שיף ג')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (249, 1085, N'שיף מא')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (250, 1136, N'שניידר י')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (251, 1072, N'שנק ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (252, 1278, N'שפיץ')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (253, 1019, N'שפירא ש')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (254, 1042, N'שפרנצלס ט')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (255, 1129, N'שרייבר א')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (256, 1007, N'שרייבר ב')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (257, 1008, N'שרייבר ר')
INSERT [dbo].[Teacher] ([Id], [Num], [Name]) VALUES (258, 1158, N'שרייבר ר"ל')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_Absence1] FOREIGN KEY([Type])
REFERENCES [dbo].[Absence] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_Absence1]
GO
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_Teacher] FOREIGN KEY([TeacherStandIn])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_Teacher]
GO
ALTER TABLE [dbo].[AbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_AbsencesForTeacher_TeacherStandIn] FOREIGN KEY([TeacherStandIn])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[AbsencesForTeacher] CHECK CONSTRAINT [FK_AbsencesForTeacher_TeacherStandIn]
GO
ALTER TABLE [dbo].[ClassesForGroup]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForGroup_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[ClassesForGroup] CHECK CONSTRAINT [FK_ClassesForGroup_Class]
GO
ALTER TABLE [dbo].[ClassesForGroup]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForGroup_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[ClassesForGroup] CHECK CONSTRAINT [FK_ClassesForGroup_Group]
GO
ALTER TABLE [dbo].[ClassesForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForOcation_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[ClassesForOccasion] CHECK CONSTRAINT [FK_ClassesForOcation_Class]
GO
ALTER TABLE [dbo].[ClassesForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_ClassesForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[ClassesForOccasion] CHECK CONSTRAINT [FK_ClassesForOcation_Ocation]
GO
ALTER TABLE [dbo].[DairyForClasses]  WITH CHECK ADD  CONSTRAINT [FK_DairyForClasses_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[DairyForClasses] CHECK CONSTRAINT [FK_DairyForClasses_Class]
GO
ALTER TABLE [dbo].[DairyForClasses]  WITH CHECK ADD  CONSTRAINT [FK_DairyForClasses_Dairy] FOREIGN KEY([DairyId])
REFERENCES [dbo].[Schedule] ([Id])
GO
ALTER TABLE [dbo].[DairyForClasses] CHECK CONSTRAINT [FK_DairyForClasses_Dairy]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_HourType] FOREIGN KEY([HourType])
REFERENCES [dbo].[HourType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_HourType]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_HourType1] FOREIGN KEY([SubHourType])
REFERENCES [dbo].[HourType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_HourType1]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Reforma] FOREIGN KEY([Reforma])
REFERENCES [dbo].[Reforma] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Reforma]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Room] FOREIGN KEY([Room])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Room]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_SchoolType] FOREIGN KEY([SchoolType])
REFERENCES [dbo].[SchoolType] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_SchoolType]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([Subject])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Teacher] FOREIGN KEY([Teacher])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Teacher]
GO
ALTER TABLE [dbo].[Occasion]  WITH CHECK ADD  CONSTRAINT [FK_Ocation_OcationType] FOREIGN KEY([OccasionType])
REFERENCES [dbo].[OccasionType] ([Id])
GO
ALTER TABLE [dbo].[Occasion] CHECK CONSTRAINT [FK_Ocation_OcationType]
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_PayAbsencesForTeacher_PayAbsence] FOREIGN KEY([IdPayAbsence])
REFERENCES [dbo].[PayAbsence] ([Id])
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher] CHECK CONSTRAINT [FK_PayAbsencesForTeacher_PayAbsence]
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher]  WITH CHECK ADD  CONSTRAINT [FK_PayAbsencesForTeacher_Teacher] FOREIGN KEY([IdTeacher])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[PayAbsencesForTeacher] CHECK CONSTRAINT [FK_PayAbsencesForTeacher_Teacher]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Class]
GO
ALTER TABLE [dbo].[RoomsForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_RoomsForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[RoomsForOccasion] CHECK CONSTRAINT [FK_RoomsForOcation_Ocation]
GO
ALTER TABLE [dbo].[RoomsForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_RoomsForOcation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[RoomsForOccasion] CHECK CONSTRAINT [FK_RoomsForOcation_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_Class]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_Ocation]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_OcationType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[OccasionType] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_OcationType]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_Room]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_Subject]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Dairy_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Dairy_Teacher]
GO
ALTER TABLE [dbo].[StudyTime]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Room] FOREIGN KEY([Room])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[StudyTime] CHECK CONSTRAINT [FK_Schedule_Room]
GO
ALTER TABLE [dbo].[SubjectsForClass]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsForClass_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([Id])
GO
ALTER TABLE [dbo].[SubjectsForClass] CHECK CONSTRAINT [FK_SubjectsForClass_Class]
GO
ALTER TABLE [dbo].[SubjectsForClass]  WITH CHECK ADD  CONSTRAINT [FK_SubjectsForClass_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectsForClass] CHECK CONSTRAINT [FK_SubjectsForClass_Subject]
GO
ALTER TABLE [dbo].[TeachersForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_TeachersForOcation_Ocation] FOREIGN KEY([OccasionId])
REFERENCES [dbo].[Occasion] ([Id])
GO
ALTER TABLE [dbo].[TeachersForOccasion] CHECK CONSTRAINT [FK_TeachersForOcation_Ocation]
GO
ALTER TABLE [dbo].[TeachersForOccasion]  WITH CHECK ADD  CONSTRAINT [FK_TeachersForOcation_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[TeachersForOccasion] CHECK CONSTRAINT [FK_TeachersForOcation_Teacher]
GO
USE [master]
GO
ALTER DATABASE [!ESTY&TAMAR] SET  READ_WRITE 
GO
