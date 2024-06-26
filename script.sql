USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 17.04.2024 12:27:32 ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ХранительПРО] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ХранительПРО] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ХранительПРО', N'ON'
GO
ALTER DATABASE [ХранительПРО] SET QUERY_STORE = OFF
GO
USE [ХранительПРО]
GO
/****** Object:  Table [dbo].[Групповое посещение]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Групповое посещение](
	[Логин] [varchar](20) NOT NULL,
	[Пароль] [varchar](20) NOT NULL,
	[Назначение] [varchar](100) NULL,
	[Код_пропуска] [int] NULL,
	[Код_группы] [int] NULL,
	[Код_пользователя] [int] NULL,
 CONSTRAINT [PK_Групповое посещение] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Группы посещения]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группы посещения](
	[Код_группы] [int] NOT NULL,
	[Название_группы] [varchar](40) NULL,
	[Код_пользователя] [varchar](50) NULL,
 CONSTRAINT [PK_Группы посещения] PRIMARY KEY CLUSTERED 
(
	[Код_группы] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка на посещение]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка на посещение](
	[Код_заявки] [int] NOT NULL,
	[Начало_срока_действия] [date] NOT NULL,
	[Конец_срока_действия] [date] NOT NULL,
 CONSTRAINT [PK_Заявка на посещение] PRIMARY KEY CLUSTERED 
(
	[Код_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Личное посещение]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Личное посещение](
	[Логин] [varchar](20) NOT NULL,
	[Пароль] [varchar](20) NOT NULL,
	[Назначение] [varchar](40) NOT NULL,
	[Код_пользователя] [int] NOT NULL,
	[Код_пропуска] [int] NULL,
 CONSTRAINT [PK_Личное посещение] PRIMARY KEY CLUSTERED 
(
	[Логин] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отдел]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отдел](
	[Код_отдела] [int] IDENTITY(1,1) NOT NULL,
	[Название_отдела] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Отдел] PRIMARY KEY CLUSTERED 
(
	[Код_отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Подразделение]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделение](
	[Код_подразделения] [int] IDENTITY(1,1) NOT NULL,
	[Название_подразделения] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Подразделение] PRIMARY KEY CLUSTERED 
(
	[Код_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[Код_пользователя] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](30) NOT NULL,
	[Имя] [varchar](30) NOT NULL,
	[Отчество] [varchar](30) NOT NULL,
	[Дата_рождения] [date] NOT NULL,
	[Серия_паспорта] [varchar](4) NOT NULL,
	[Номер_паспорта] [varchar](6) NOT NULL,
	[Номер_телефона] [varchar](20) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Фотография] [varbinary](max) NULL,
	[Документы] [varbinary](max) NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[Код_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пропуск]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пропуск](
	[Код_пропуска] [int] IDENTITY(1,1) NOT NULL,
	[Код_заявки] [int] NOT NULL,
	[Цель_посещения] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Пропуск] PRIMARY KEY CLUSTERED 
(
	[Код_пропуска] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код_сотрудника] [int] NOT NULL,
	[Фамилия] [varchar](30) NOT NULL,
	[Имя] [varchar](30) NOT NULL,
	[Отчество] [varchar](30) NOT NULL,
	[Код_отдела] [int] NULL,
	[Код_подразделения] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Статус заявки]    Script Date: 17.04.2024 12:27:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Статус заявки](
	[Статус_заявки] [varchar](20) NULL,
	[Код_заявки] [int] NOT NULL,
	[Код_сотрудника_одобрившего_заявку] [int] NOT NULL,
 CONSTRAINT [PK_Статус заявки] PRIMARY KEY CLUSTERED 
(
	[Код_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Групповое посещение]  WITH CHECK ADD  CONSTRAINT [FK_Групповое посещение_Группы посещения] FOREIGN KEY([Код_группы])
REFERENCES [dbo].[Группы посещения] ([Код_группы])
GO
ALTER TABLE [dbo].[Групповое посещение] CHECK CONSTRAINT [FK_Групповое посещение_Группы посещения]
GO
ALTER TABLE [dbo].[Групповое посещение]  WITH CHECK ADD  CONSTRAINT [FK_Групповое посещение_Пропуск] FOREIGN KEY([Код_пропуска])
REFERENCES [dbo].[Пропуск] ([Код_пропуска])
GO
ALTER TABLE [dbo].[Групповое посещение] CHECK CONSTRAINT [FK_Групповое посещение_Пропуск]
GO
ALTER TABLE [dbo].[Личное посещение]  WITH CHECK ADD  CONSTRAINT [FK_Личное посещение_Пользователи] FOREIGN KEY([Код_пользователя])
REFERENCES [dbo].[Пользователи] ([Код_пользователя])
GO
ALTER TABLE [dbo].[Личное посещение] CHECK CONSTRAINT [FK_Личное посещение_Пользователи]
GO
ALTER TABLE [dbo].[Личное посещение]  WITH CHECK ADD  CONSTRAINT [FK_Личное посещение_Пропуск] FOREIGN KEY([Код_пропуска])
REFERENCES [dbo].[Пропуск] ([Код_пропуска])
GO
ALTER TABLE [dbo].[Личное посещение] CHECK CONSTRAINT [FK_Личное посещение_Пропуск]
GO
ALTER TABLE [dbo].[Пропуск]  WITH CHECK ADD  CONSTRAINT [FK_Пропуск_Заявка на посещение] FOREIGN KEY([Код_заявки])
REFERENCES [dbo].[Заявка на посещение] ([Код_заявки])
GO
ALTER TABLE [dbo].[Пропуск] CHECK CONSTRAINT [FK_Пропуск_Заявка на посещение]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Отдел] FOREIGN KEY([Код_отдела])
REFERENCES [dbo].[Отдел] ([Код_отдела])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Отдел]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Подразделение] FOREIGN KEY([Код_подразделения])
REFERENCES [dbo].[Подразделение] ([Код_подразделения])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Подразделение]
GO
ALTER TABLE [dbo].[Статус заявки]  WITH CHECK ADD  CONSTRAINT [FK_Статус заявки_Заявка на посещение] FOREIGN KEY([Код_заявки])
REFERENCES [dbo].[Заявка на посещение] ([Код_заявки])
GO
ALTER TABLE [dbo].[Статус заявки] CHECK CONSTRAINT [FK_Статус заявки_Заявка на посещение]
GO
ALTER TABLE [dbo].[Статус заявки]  WITH CHECK ADD  CONSTRAINT [FK_Статус заявки_Сотрудники] FOREIGN KEY([Код_сотрудника_одобрившего_заявку])
REFERENCES [dbo].[Сотрудники] ([Код_сотрудника])
GO
ALTER TABLE [dbo].[Статус заявки] CHECK CONSTRAINT [FK_Статус заявки_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
