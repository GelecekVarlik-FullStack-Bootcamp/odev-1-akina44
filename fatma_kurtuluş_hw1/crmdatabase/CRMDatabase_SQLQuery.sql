USE [master]
GO
/****** Object:  Database [CRMDatabase]    Script Date: 20.04.2022 12:05:19 ******/
CREATE DATABASE [CRMDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRMDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\CRMDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRMDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS2017\MSSQL\DATA\CRMDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CRMDatabase] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRMDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRMDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRMDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRMDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRMDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRMDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRMDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRMDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRMDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRMDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRMDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRMDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRMDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRMDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRMDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRMDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRMDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRMDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRMDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRMDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRMDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRMDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRMDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRMDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CRMDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [CRMDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRMDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRMDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRMDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRMDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRMDatabase] SET QUERY_STORE = OFF
GO
USE [CRMDatabase]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_ID] [int] NOT NULL,
	[Account_name] [varchar](40) NOT NULL,
	[Account_description] [varchar](40) NOT NULL,
	[Account_phone] [int] NOT NULL,
	[Billing_address] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountContactRole]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountContactRole](
	[AccountContactRole_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
 CONSTRAINT [PK_AccountContactRole] PRIMARY KEY CLUSTERED 
(
	[AccountContactRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[Campaign_ID] [int] NOT NULL,
	[Campaign_name] [varchar](40) NOT NULL,
	[Campaign_objectives] [varchar](40) NOT NULL,
	[Campaign_sponsor] [varchar](40) NOT NULL,
	[Campaign_start_date] [date] NOT NULL,
	[Campaign_end_date] [date] NOT NULL,
	[Campaign_other_details] [varchar](40) NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[Campaign_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignMember]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignMember](
	[CampaignMember_ID] [int] NOT NULL,
	[Campaign_ID] [int] NOT NULL,
	[Lead_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_CampaignMember] PRIMARY KEY CLUSTERED 
(
	[CampaignMember_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case](
	[Case_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[Case_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Contact_address] [varchar](40) NOT NULL,
	[Contact_contact_details] [varchar](40) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Contract_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Contract_status] [varchar](40) NOT NULL,
	[Contract_approval] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Contract_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lead]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead](
	[Lead_ID] [int] NOT NULL,
	[Lead_firestname] [varchar](40) NOT NULL,
	[Lead_surname] [varchar](40) NOT NULL,
	[Lead_other_details] [varchar](40) NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[Lead_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunity]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunity](
	[Opportunity_ID] [int] NOT NULL,
	[Account_ID] [int] NOT NULL,
	[Opportunity_description] [varchar](40) NULL,
	[Opportunity_details] [varchar](40) NOT NULL,
	[Opportunity_stage] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Opportunity] PRIMARY KEY CLUSTERED 
(
	[Opportunity_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpportunityContactRole]    Script Date: 20.04.2022 12:05:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpportunityContactRole](
	[OpportunityContactRole_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
	[Opportunity_ID] [int] NOT NULL,
	[Date_time] [datetime] NOT NULL,
	[Other_Details] [varchar](40) NULL,
 CONSTRAINT [PK_OpportunityContactRole] PRIMARY KEY CLUSTERED 
(
	[OpportunityContactRole_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountContactRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRole_Contact] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[AccountContactRole] CHECK CONSTRAINT [FK_AccountContactRole_Contact]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_CampaignMember] FOREIGN KEY([Campaign_ID])
REFERENCES [dbo].[Campaign] ([Campaign_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_CampaignMember]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Contact]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Lead] FOREIGN KEY([Lead_ID])
REFERENCES [dbo].[Lead] ([Lead_ID])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Lead]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_Contact]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
ALTER TABLE [dbo].[Opportunity]  WITH CHECK ADD  CONSTRAINT [FK_Opportunity_Account] FOREIGN KEY([Account_ID])
REFERENCES [dbo].[Account] ([Account_ID])
GO
ALTER TABLE [dbo].[Opportunity] CHECK CONSTRAINT [FK_Opportunity_Account]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Contact]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Opportunity] FOREIGN KEY([Opportunity_ID])
REFERENCES [dbo].[Opportunity] ([Opportunity_ID])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Opportunity]
GO
USE [master]
GO
ALTER DATABASE [CRMDatabase] SET  READ_WRITE 
GO
