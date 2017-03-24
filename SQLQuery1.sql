USE [InsuranceAgent]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerMedia_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerMedia]'))
ALTER TABLE [dbo].[CustomerMedia] DROP CONSTRAINT [FK_CustomerMedia_Customers]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerMedia_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerMedia] DROP CONSTRAINT [DF_CustomerMedia_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerMedia_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerMedia] DROP CONSTRAINT [DF_CustomerMedia_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerPolicy_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerPolicy]'))
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [FK_CustomerPolicy_Customers]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerPolicy_PolicyMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerPolicy]'))
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [FK_CustomerPolicy_PolicyMaster]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_IssueDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_IssueDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Table_1_PolicySumInsuredAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_Table_1_PolicySumInsuredAmount]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_ODPremiumAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_ODPremiumAmount]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_NetPremiumAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_NetPremiumAmount]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_ServiceTax]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_ServiceTax]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicy_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicy] DROP CONSTRAINT [DF_CustomerPolicy_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicyInsured_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicyInsured] DROP CONSTRAINT [DF_CustomerPolicyInsured_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicyInsured_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicyInsured] DROP CONSTRAINT [DF_CustomerPolicyInsured_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerPolicyMedia_CustomerPolicy]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerPolicyMedia]'))
ALTER TABLE [dbo].[CustomerPolicyMedia] DROP CONSTRAINT [FK_CustomerPolicyMedia_CustomerPolicy]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicyMedia_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicyMedia] DROP CONSTRAINT [DF_CustomerPolicyMedia_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CustomerPolicyMedia_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerPolicyMedia] DROP CONSTRAINT [DF_CustomerPolicyMedia_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customers_Families]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customers]'))
ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [FK_Customers_Families]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Customers_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [DF_Customers_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Customers_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customers] DROP CONSTRAINT [DF_Customers_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Families_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Families] DROP CONSTRAINT [DF_Families_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Families_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Families] DROP CONSTRAINT [DF_Families_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_InsuranceCompany_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyCompany] DROP CONSTRAINT [DF_InsuranceCompany_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_InsuranceCompany_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyCompany] DROP CONSTRAINT [DF_InsuranceCompany_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyMaster_PolicyCompany]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyMaster]'))
ALTER TABLE [dbo].[PolicyMaster] DROP CONSTRAINT [FK_PolicyMaster_PolicyCompany]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyMaster_PolicyTypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyMaster]'))
ALTER TABLE [dbo].[PolicyMaster] DROP CONSTRAINT [FK_PolicyMaster_PolicyTypes]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyMaster_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyMaster] DROP CONSTRAINT [DF_PolicyMaster_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyMaster_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyMaster] DROP CONSTRAINT [DF_PolicyMaster_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PolicyPayments_CustomerPolicy]') AND parent_object_id = OBJECT_ID(N'[dbo].[PolicyPayments]'))
ALTER TABLE [dbo].[PolicyPayments] DROP CONSTRAINT [FK_PolicyPayments_CustomerPolicy]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyPayments_CommissionAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyPayments] DROP CONSTRAINT [DF_PolicyPayments_CommissionAmount]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyPayments_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyPayments] DROP CONSTRAINT [DF_PolicyPayments_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyPayments_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyPayments] DROP CONSTRAINT [DF_PolicyPayments_UpdatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyTypes_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyTypes] DROP CONSTRAINT [DF_PolicyTypes_CreatedDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_PolicyTypes_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PolicyTypes] DROP CONSTRAINT [DF_PolicyTypes_UpdatedDate]
END

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerMedia]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerMedia]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerMedia]
GO

/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPolicy]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerPolicy]
GO

/****** Object:  Table [dbo].[CustomerPolicyInsured]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPolicyInsured]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerPolicyInsured]
GO

/****** Object:  Table [dbo].[CustomerPolicyMedia]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerPolicyMedia]') AND type in (N'U'))
DROP TABLE [dbo].[CustomerPolicyMedia]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]
GO

/****** Object:  Table [dbo].[Families]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Families]') AND type in (N'U'))
DROP TABLE [dbo].[Families]
GO

/****** Object:  Table [dbo].[PolicyCompany]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyCompany]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyCompany]
GO

/****** Object:  Table [dbo].[PolicyMaster]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyMaster]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyMaster]
GO

/****** Object:  Table [dbo].[PolicyPayments]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyPayments]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyPayments]
GO

/****** Object:  Table [dbo].[PolicyTypes]    Script Date: 03/24/2017 20:07:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PolicyTypes]') AND type in (N'U'))
DROP TABLE [dbo].[PolicyTypes]
GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerMedia]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CustomerMedia](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MediaType] [varchar](50) NOT NULL,
	[MediaTitle] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[FileData] [varbinary](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerMedia] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PDF, Photo, Email, Document, Excel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerMedia', @level2type=N'COLUMN',@level2name=N'MediaType'
GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CustomerPolicy](
	[CustomerPolicyID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PolicyID] [int] NOT NULL,
	[PolicyNumber] [nvarchar](500) NULL,
	[IssueDate] [date] NOT NULL,
	[ExpireDate] [date] NULL,
	[PremiumFrequency] [nvarchar](50) NOT NULL,
	[VechileRegistrationNumber] [nvarchar](200) NULL,
	[SumInsuredAmount] [decimal](18, 2) NOT NULL,
	[ODPremiumAmount] [decimal](18, 2) NOT NULL,
	[NetPremiumAmount] [decimal](18, 2) NOT NULL,
	[TPPremiumAmount] [decimal](18, 2) NOT NULL,
	[ServiceTax] [decimal](18, 2) NOT NULL,
	[TotalPremiumAmount] [decimal](18, 2) NOT NULL,
	[InsuredName] [nvarchar](500) NOT NULL,
	[PolicyStatus] [varchar](50) NOT NULL,
	[PolicySubmitedDate] [date] NULL,
	[LastPolicyNumber] [nvarchar](500) NULL,
	[IsHardCopy] [bit] NULL,
	[IsRenewedPolicyReceived] [bit] NULL,
	[IsDelivered] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[UDK4] [nvarchar](max) NULL,
	[UDK5] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdateByID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPolicy] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Onetime, Yearly, Half Yearly, Quarterly, Monthly, Bi-Monthly, Weekly, Bi-Weekly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerPolicy', @level2type=N'COLUMN',@level2name=N'PremiumFrequency'
GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerPolicyInsured]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CustomerPolicyInsured](
	[InsuredID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerPolicyID] [int] NOT NULL,
	[InsuredName] [nvarchar](500) NOT NULL,
	[Relation] [nchar](50) NULL,
	[RelationCustomerID] [int] NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPolicyInsured] PRIMARY KEY CLUSTERED 
(
	[InsuredID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerPolicyMedia]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[CustomerPolicyMedia](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerPolicyID] [int] NOT NULL,
	[MediaType] [varchar](50) NOT NULL,
	[MediaTitle] [nvarchar](100) NOT NULL,
	[FileName] [nvarchar](500) NOT NULL,
	[FileData] [varbinary](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPolicyMedia] PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PDF, Photo, Email, Document, Excel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerPolicyMedia', @level2type=N'COLUMN',@level2name=N'MediaType'
GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[Customers]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[FamilyID] [int] NULL,
	[Address1] [nvarchar](500) NULL,
	[Address2] [nvarchar](500) NULL,
	[City] [nvarchar](200) NULL,
	[HomePhone] [nvarchar](100) NULL,
	[PrimaryMobile] [nvarchar](100) NULL,
	[SecondaryMobile] [nvarchar](100) NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Profession] [nvarchar](500) NULL,
	[Occupation] [nvarchar](500) NULL,
	[Height] [nvarchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
	[SkinColor] [nvarchar](50) NULL,
	[VisibleMark] [nvarchar](50) NULL,
	[BloodGroup] [nvarchar](50) NULL,
	[Details] [nvarchar](max) NULL,
	[Relation] [nvarchar](50) NULL,
	[RelationCustomerID] [nvarchar](50) NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[UDK4] [nvarchar](max) NULL,
	[UDK5] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[Families]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Families](
	[FamilyID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyName] [nvarchar](200) NOT NULL,
	[Area] [nvarchar](200) NULL,
	[MasterID] [int] NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Families] PRIMARY KEY CLUSTERED 
(
	[FamilyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[PolicyCompany]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyCompany](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[PolicyMaster]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyMaster](
	[PolicyID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyName] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CompanyID] [int] NOT NULL,
	[PolicyTypeID] [int] NOT NULL,
	[LastCompanyID] [int] NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[UDK4] [nvarchar](max) NULL,
	[UDK5] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyMaster] PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[PolicyPayments]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyPayments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentDate] [date] NOT NULL,
	[CustomerPolicyID] [int] NOT NULL,
	[PaymentAmount] [decimal](18, 2) NOT NULL,
	[PaymentDetails] [nvarchar](max) NOT NULL,
	[CommissionAmount] [decimal](18, 2) NOT NULL,
	[CommissionDate] [date] NULL,
	[CommissionDetails] [nvarchar](max) NOT NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[UDK4] [nvarchar](max) NULL,
	[UDK5] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyPayments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[PolicyTypes]    Script Date: 03/24/2017 20:07:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyTypes](
	[PolicyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyTypeName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[UDK1] [nvarchar](max) NULL,
	[UDK2] [nvarchar](max) NULL,
	[UDK3] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyTypes] PRIMARY KEY CLUSTERED 
(
	[PolicyTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CustomerMedia]  WITH CHECK ADD  CONSTRAINT [FK_CustomerMedia_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[CustomerMedia] CHECK CONSTRAINT [FK_CustomerMedia_Customers]
GO

ALTER TABLE [dbo].[CustomerMedia] ADD  CONSTRAINT [DF_CustomerMedia_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[CustomerMedia] ADD  CONSTRAINT [DF_CustomerMedia_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicy]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPolicy_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO

ALTER TABLE [dbo].[CustomerPolicy] CHECK CONSTRAINT [FK_CustomerPolicy_Customers]
GO

ALTER TABLE [dbo].[CustomerPolicy]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPolicy_PolicyMaster] FOREIGN KEY([PolicyID])
REFERENCES [dbo].[PolicyMaster] ([PolicyID])
GO

ALTER TABLE [dbo].[CustomerPolicy] CHECK CONSTRAINT [FK_CustomerPolicy_PolicyMaster]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_IssueDate]  DEFAULT (getdate()) FOR [IssueDate]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_Table_1_PolicySumInsuredAmount]  DEFAULT ((0)) FOR [SumInsuredAmount]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_ODPremiumAmount]  DEFAULT ((0)) FOR [ODPremiumAmount]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_NetPremiumAmount]  DEFAULT ((0)) FOR [NetPremiumAmount]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_ServiceTax]  DEFAULT ((0)) FOR [ServiceTax]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicy] ADD  CONSTRAINT [DF_CustomerPolicy_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicyInsured] ADD  CONSTRAINT [DF_CustomerPolicyInsured_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicyInsured] ADD  CONSTRAINT [DF_CustomerPolicyInsured_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicyMedia]  WITH CHECK ADD  CONSTRAINT [FK_CustomerPolicyMedia_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO

ALTER TABLE [dbo].[CustomerPolicyMedia] CHECK CONSTRAINT [FK_CustomerPolicyMedia_CustomerPolicy]
GO

ALTER TABLE [dbo].[CustomerPolicyMedia] ADD  CONSTRAINT [DF_CustomerPolicyMedia_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[CustomerPolicyMedia] ADD  CONSTRAINT [DF_CustomerPolicyMedia_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Families] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[Families] ([FamilyID])
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Families]
GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[Families] ADD  CONSTRAINT [DF_Families_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Families] ADD  CONSTRAINT [DF_Families_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[PolicyCompany] ADD  CONSTRAINT [DF_InsuranceCompany_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[PolicyCompany] ADD  CONSTRAINT [DF_InsuranceCompany_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[PolicyMaster]  WITH CHECK ADD  CONSTRAINT [FK_PolicyMaster_PolicyCompany] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[PolicyCompany] ([CompanyID])
GO

ALTER TABLE [dbo].[PolicyMaster] CHECK CONSTRAINT [FK_PolicyMaster_PolicyCompany]
GO

ALTER TABLE [dbo].[PolicyMaster]  WITH CHECK ADD  CONSTRAINT [FK_PolicyMaster_PolicyTypes] FOREIGN KEY([PolicyTypeID])
REFERENCES [dbo].[PolicyTypes] ([PolicyTypeID])
GO

ALTER TABLE [dbo].[PolicyMaster] CHECK CONSTRAINT [FK_PolicyMaster_PolicyTypes]
GO

ALTER TABLE [dbo].[PolicyMaster] ADD  CONSTRAINT [DF_PolicyMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[PolicyMaster] ADD  CONSTRAINT [DF_PolicyMaster_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[PolicyPayments]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPayments_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO

ALTER TABLE [dbo].[PolicyPayments] CHECK CONSTRAINT [FK_PolicyPayments_CustomerPolicy]
GO

ALTER TABLE [dbo].[PolicyPayments] ADD  CONSTRAINT [DF_PolicyPayments_CommissionAmount]  DEFAULT ((0)) FOR [CommissionAmount]
GO

ALTER TABLE [dbo].[PolicyPayments] ADD  CONSTRAINT [DF_PolicyPayments_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[PolicyPayments] ADD  CONSTRAINT [DF_PolicyPayments_UpdatedDate]  DEFAULT ((0)) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[PolicyTypes] ADD  CONSTRAINT [DF_PolicyTypes_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[PolicyTypes] ADD  CONSTRAINT [DF_PolicyTypes_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO


