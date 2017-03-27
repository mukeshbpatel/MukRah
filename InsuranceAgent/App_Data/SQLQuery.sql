USE [InsuranceAgent]
GO

/****** Object:  Table [dbo].[CustomerPolicy]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdateByID] [int] NOT NULL,
 CONSTRAINT [PK_CustomerPolicy] PRIMARY KEY CLUSTERED 
(
	[CustomerPolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Customers]    Script Date: 23-03-2017 10:36:25 AM ******/
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
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Families]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Families](
	[FamilyID] [int] IDENTITY(1,1) NOT NULL,
	[FamilyName] [nvarchar](100) NULL,
	[MasterID] [int] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_Families] PRIMARY KEY CLUSTERED 
(
	[FamilyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[PolicyCompany]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyCompany](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_InsuranceCompany_CreatedDate]  DEFAULT (getdate()),
	[UpdatedDate] [datetime] NOT NULL CONSTRAINT [DF_InsuranceCompany_UpdatedDate]  DEFAULT (getdate()),
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_InsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[PolicyMaster]    Script Date: 23-03-2017 10:36:25 AM ******/
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
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyMaster] PRIMARY KEY CLUSTERED 
(
	[PolicyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[PolicyPayments]    Script Date: 23-03-2017 10:36:25 AM ******/
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
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyPayments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[PolicyTypes]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PolicyTypes](
	[PolicyTypeID] [int] IDENTITY(1,1) NOT NULL,
	[PolicyTypeName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedByID] [int] NOT NULL,
 CONSTRAINT [PK_PolicyTypes] PRIMARY KEY CLUSTERED 
(
	[PolicyTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[UserProfile]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](56) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DOB] [date] NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL DEFAULT ((0)),
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL DEFAULT ((0)),
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserId] [nvarchar](100) NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 23-03-2017 10:36:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF_Customers_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[Families] ADD  CONSTRAINT [DF_Families_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Families] ADD  CONSTRAINT [DF_Families_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO

ALTER TABLE [dbo].[PolicyMaster] ADD  CONSTRAINT [DF_PolicyMaster_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[PolicyMaster] ADD  CONSTRAINT [DF_PolicyMaster_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
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

ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Families] FOREIGN KEY([FamilyID])
REFERENCES [dbo].[Families] ([FamilyID])
GO

ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Families]
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

ALTER TABLE [dbo].[PolicyPayments]  WITH CHECK ADD  CONSTRAINT [FK_PolicyPayments_CustomerPolicy] FOREIGN KEY([CustomerPolicyID])
REFERENCES [dbo].[CustomerPolicy] ([CustomerPolicyID])
GO

ALTER TABLE [dbo].[PolicyPayments] CHECK CONSTRAINT [FK_PolicyPayments_CustomerPolicy]
GO

ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO

ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO

ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Onetime, Yearly, Half Yearly, Quarterly, Monthly, Bi-Monthly, Weekly, Bi-Weekly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerPolicy', @level2type=N'COLUMN',@level2name=N'PremiumFrequency'
GO


