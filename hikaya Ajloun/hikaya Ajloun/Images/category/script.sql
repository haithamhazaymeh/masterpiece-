USE [ERP_Project]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[note] [nchar](10) NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ImgFaculty] [varchar](255) NULL,
	[Description] [varchar](500) NULL,
	[AcceptanceRate] [int] NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[IdFaculty] [int] NULL,
	[HoursNum] [int] NULL,
	[Price] [int] NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Majors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterClasses]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterClasses](
	[student_id] [int] NULL,
	[ClassID] [int] NULL,
	[isPaid] [bit] NULL,
	[registerclasses] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Register__F5D4471CECF694BE] PRIMARY KEY CLUSTERED 
(
	[registerclasses] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Section]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassNumber] [varchar](50) NULL,
	[IdSubject] [int] NULL,
	[Days] [varchar](50) NULL,
	[StartTime] [time](0) NULL,
	[EndTime] [time](0) NULL,
	[ClassStatus] [varchar](50) NULL,
	[Instructor] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
 CONSTRAINT [PK_classes] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,55555548) NOT NULL,
	[IdUser] [nvarchar](128) NULL,
	[IdMajor] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [bit] NULL,
	[PhoneNum] [varchar](50) NULL,
	[StudentImg] [varchar](250) NULL,
	[SchoolAvg] [float] NULL,
	[CertificateImg] [varchar](250) NULL,
	[PersonalIDImg] [varchar](250) NULL,
	[IsAccepted] [bit] NULL,
	[studentEmail] [nvarchar](256) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 2/25/2023 2:34:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[ID_Subject] [int] IDENTITY(1,1) NOT NULL,
	[Subject_Name] [varchar](50) NULL,
	[IdMajor] [int] NOT NULL,
	[SubjectHours] [int] NULL,
	[SubjectCode] [varchar](50) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[ID_Subject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202302150758498_InitialCreate', N'ERP_Project.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416A9954B77B10DEC2E522769836E2E58678BBE05B4443BEA4A9456A2B2098A7E591FFA49FD850E25EAC68B2EB6623B8B051616393C331C0EC9E17098FFFEF977FCF6D1F78C071CC56E4026E6C168DF3430B103C725CB8999D0C5F76FCCB73F7DFDD5F8CCF11F8DDF73BA2346072D493C31EF290D8F2D2BB6EFB18FE291EFDA5110070B3AB203DF424E601DEEEFFF681D1C5818204CC0328CF1FB8450D7C7E9077C4E0362E39026C8BB0C1CECC5BC1C6A6629AA71857C1C87C8C613F3ECFDCDDD4D14FC896D3ACAA84DE3C473114832C3DEC2341021014514E43CFE10E3198D02B29C855080BCDBA71003DD027931E6F21F97E45DBBB27FC8BA62950D73283B8969E0F7043C38E2BAB1C4E62B69D82C7407DA3B032DD327D6EB548313F3C2C169D1FBC00305880C8FA75EC48827E665C1E2240EAF301DE50D4719E47904709F83E8E3A88AB867746EB757D8D2E1689FFDDB33A6894793084F084E6884BC3DE326997BAEFD1B7EBA0D3E6232393A982F8EDEBC7A8D9CA3D73FE0A357D59E425F81AE5600456026218E4036BC28FA6F1A56BD9D25362C9A55DA645A015B8269611A97E8F11D264B7A0F13E6F08D699CBB8FD8C94BB8717D202ECC226844A3043EAF12CF43730F17F556234FF67F03D7C357AF07E17A851EDC653AF4027F983811CCABF7D84B6BE37B37CCA6576DBCEF38D97914F8ECBB6E5F59EDDD2C48229B7526D092DCA26889695DBAB1551A6F27936650C39B758EBAFBA6CD2495CD5B49CA3AB4CA4CC8596C7A36E4F23E2FDFCE167712863078A969318D34199CBC598D84D67B4685A6349D83AEA643A04B5FF24A78E623D71B6029ECC005BC90851BF9B8E8E5CF01181E22BD65BE41710C2B81F32B8AEF1B44879F03883EC376128181CE28F2C367E776731F107C95F87366F79BE335D8D0DC7E0ECE914D83E88CB0566BE3BD0BEC8F4142CF88738A28FE40ED1C907DDEBA7E778041C439B16D1CC7E760CCD89906E064E78017841E1DF686630BD4B65D91A9875C5FED8B084BE95D4E5AFA236A0AC927D190A9FC922651DF054B9774133527D58B9A51B48ACAC9FA8ACAC0BA49CA29F582A604AD72665483797AE9080DEFEAA5B0BBEFEBADB779EBD6828A1A67B042E25F30C1112C63CE0DA21447A41C812EEBC6369C8574F818D367DF9B524EBF232F199AD54AB3215D04869F0D29ECEECF86544C287E701DE695743800E5C400DF895E7DB66A9F7382649B9E0EB56E6E9AF966D600DD743989E3C076D359A0087DF1C0455D7EF0E18CF62846D61B3112021D034377D9960725D0375334AA6B728A3D4CB1716267A1C1298A6DE4C86A840E393D04CB775485606544A42EDC77124FB0741CB146881D826298A92EA1F2B47089ED86C86BD592D0B2E316C6FA5EF0106B4E71880963D8AA892ECCD501102640C1471894360D8DAD8AC5351BA2C66BD58D799B0B5B8EBB1497D8884DB6F8CE1ABBE4FEDBB31866B3C636609CCD2AE922803698B70D03E56795AE06201E5C76CD40851393C640B94BB51103AD6B6C0B065A57C98B33D0EC88DA75FC85F3EAAE9967FDA0BCF96DBD515D5BB0CD9A3E76CC3433DF13DA50688123D93C4FE7AC123F52C5E10CE4E4E7B398BBBAA28930F019A6F5904DE9EF2AFD50AB194434A226C0D2D05A40F935A004244DA81EC2E5B1BC46E9B817D103368FBB35C2F2B55F80ADD8808C5DBD0EAD10EA2F4D45E3EC74FA287A56588364E49D0E0B151C8541888B57BDE31D94A28BCBCA8AE9E20BF7F1862B1DE383D1A0A016CF55A3A4BC33836B2937CD762DA91CB23E2ED95A5A12DC278D96F2CE0CAE256EA3ED4A5238053DDC82B55454DFC2079A6C79A4A3D86D8ABAB1956549F182B1A549A71A5FA23074C9B2925EC54B8C59965B35FD7ED63FE9C8CF302C3B56E41E15D2169C6810A125166A8135487AEE46313D4514CD118BF34C1D5F2253EEAD9AE53F6759DD3EE541CCF7819C9AFDE697C2F2E57D6DAF959D118E710E3DF499479386D115E3AF6E6EB07437E4A14811B99F065EE213BD83A56F9DDDDF55DB672532C2D812E4971C28495B929B5B577DA7819127C5408354F82FAB0F941E42A7EEDCFBAC2A5CE791EA51F20055154517B4DADAC0E91C995E8325FA88FDC7AA15E179E6154F4CA902F0A29E1895DC0609AC52D71DB59E7E52C5ACD7744714724CAA9042550F29AB99243521AB152BE16934AAA6E8CE41CE1DA9A2CBB5DD91155924556845F50AD80A99C5BAEEA88A44932AB0A2BA3B769975222EA23BBC73694F2E2B6F5DD9E176BDBD4B83F13C2BE2305B5FE50EBF0A5429EE89C56FE925305EBE93D6A43DE1AD6C4D594C633D6BD260E8579EDAED777DE169BCB2D763D6AEB46B8B7BD395BE1EAF9FCD3EAB6548073C91A4E05E1CF48403DD981FAEDA1FD148A7AD8CC4347235C2C6FE1453EC8F18C168F6C99B7A2E66CB784E708988BBC031CDD238CCC3FD8343E11DCEEEBC89B1E2D8F1148753DDC398FA986D20238B3CA0C8BE47919C1FB1C6BB9112540A3D5F10073F4ECCBFD256C7691483FD4A8BF78C8BF803713F2550711B25D8F85BCEF71C268FBEC3CB8D42D0BF5FC49388EE2ABFF8E32E6BBA675C47309D8E8D7D41D1AB0C7FFDA1442F69B2A66B48B3F2F389973BDB6A6F1394A8C26C59FD29C2DCA5833C43C8A5FCC6478FDFF6154DF9D4602D44C57382A1F00651A1EEB9C02A58DAA7020E7CD2F4A940BFCEAA9F0EAC229AF6D9804BFA83898F06BA2F4379CB2DEE438A03D32696A454CFAD49D76B65606E7B6F9272B3D79AE872FE750FB84173ACD773515E58EEF2605BA722357930EC6DDAFDB3E723EF4A0A72E9B46F37F37893C9C60D174A5F548EF10E64C529B27CB69F49BC695BD34580773C1DB35FBEF08E191BDFE6B79F15BC6963D3058877DCD87AE5FEEE98AD6D6BFFDCB2A575DE42B79EC92B2725696E725451E4B64CDD2CE40EC7FF790046907994D9034B756A58535A6B0BC39244CF549F93263296268EC457A26866DBAFAF7CC36FEC2CA76966ABC9E46CE2CDD7FF46DE9CA699B7263F721B39C6CA0C4555DE77CB3AD6943EF592728A6B3D6949616FF3591BAFE55F520AF1204AA9CD1ECDEDF2CBC9181E4425434E9D1E19C2F24531EC9D95BFC908FB77EC2E4B08F6171A09B66BBB664173411641BE790B12E5244284E61253E4C0967A125177816C0AD52C009DBE104F837AEC1A648E9D0B729DD030A1D065ECCFBD5AC08B39014DFCD334E8BACCE3EB907DC5437401C47459E0FE9AFC9CB89E53C87DAE880969209877C1C3BD6C2C290BFB2E9F0AA4AB807404E2EA2B9CA25BEC871E80C5D764861EF02AB281F9BDC34B643F9511401D48FB40D4D53E3E75D132427ECC31CAF6F00936ECF88F3FFD0F74CC02EA9A540000, N'6.4.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Student')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [note]) VALUES (N'6ed2baa0-3b96-4883-a8de-2b91dd6b60a2', N'1', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [note]) VALUES (N'887d09e9-f10b-44b8-96b2-03f8c62c6872', N'2', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [note]) VALUES (N'a518b811-9f9c-4a9e-bfc4-ae1dc63af175', N'2', NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [note]) VALUES (N'd4b56a7d-34c6-40ba-87c5-0b064480ca7c', N'1', N'2         ')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'02d4e659-50bb-4afb-b96b-22a5486cdc56', N'bana@gmail.com', 0, N'AD2cnbJlDdK1MMuzG2PvaDvk8xje2sTg5buPGnh28h9QhS+BJvVvlnSu9f3ZcWT/Fw==', N'16755ba2-7cb7-4310-a086-2d85ef43bcb5', NULL, 0, 0, NULL, 1, 0, N'bana@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'039f1a55-ace3-4de7-95a6-7e436943b45a', N'ayham@gmail.com', 0, N'AJGe5bmsm0Q2fa1F0YKrE7m/nSa+EdoTIFG1TJnjp4dLXs93C7bK6AMDUGKRr0/5UA==', N'95b67d88-7719-41a7-8fad-897d4063ba5a', NULL, 0, 0, NULL, 1, 0, N'ayham@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b0fa06f-70d8-4e3c-b306-2ec8a41be6a9', N'ahmad1122@gmail.com', 0, N'AO7l+s/V61Oio1gZXc/VG10LUmi/KRegaNa7NsK0IE8xIZNuLnkoZTX6EYk95PPeCw==', N'fa9cadf0-5c7c-49f7-9693-cf76369c28d5', NULL, 0, 0, NULL, 1, 0, N'ahmad1122@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1058e8e3-3ffa-44d3-b3c9-bb7069a81ad1', N'ffff@gmail.com', 0, N'AMhAT6vBFLxGdYOpdE6WDe4TrIf/gdpoq24gDQLrl0HbuL5JbDn89nKCpqv9UR9hqw==', N'9f5007be-a2e2-4845-8c45-d1fde586e10d', NULL, 0, 0, NULL, 1, 0, N'ffff@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'10d5dcd8-79f9-4c37-bb60-6bdfe9c1b7e8', N'rogina1211@gmail.com', 0, N'AHdVYPO3PcasNBvR+GwOqN/5YUcK2XR6Z+ovojm8X6jV5KDoPRao9slKrynd9iE5HQ==', N'9216235a-6234-4f41-b312-7ee5af27f781', NULL, 0, 0, NULL, 1, 0, N'rogina1211@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'149678c0-e7c9-4c1c-a938-bd2692ddd6d3', N'roojena@gmail.com', 0, N'ADEzt1ZD0ELYIFTTE8Ngl8EL9G59YEYMEZA+4LE8iGWNpNz2pOK10VtCgtcmeO+5ZA==', N'8b8827e3-cd1c-4709-b472-73c53d85a37e', NULL, 0, 0, NULL, 1, 0, N'roojena@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'28ed9256-7cab-4ee0-9ed6-2be60cb1c768', N'sohaib22@gmail.com', 0, N'AIPdn8xvfz5OQ5jKJkY8LRTgXvFO7vo8rKH8fS3tX20uc3Bkfu0UyQ8ZUAawOxWejg==', N'923d56cd-1ceb-4c6b-9b59-4567522cb62d', NULL, 0, 0, NULL, 1, 0, N'sohaib22@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2c9c8e39-0e42-4bba-8b34-81bfd7698973', N'sohaib12@gmail.com', 0, N'ABvdeEbf9lapmLsLhZ3Uk69jJjH/CyZISwIiRWs4MhfJo2dYtB0TVovEnHJHYBYECA==', N'80882bd3-d035-4af8-a42f-e77f9a9d088e', NULL, 0, 0, NULL, 1, 0, N'sohaib12@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2f7d931b-5f77-4c5f-b927-d8350d160eed', N'sohaib123@gmail.com', 0, N'ABskl2Y2hI4WXQWiBvZwts8PoVyRDbQhqz1blDy3/2q48eY/rGwxNgWkkoQ+I+chbQ==', N'252e5805-d635-4b3b-9f85-092e29b6b59d', NULL, 0, 0, NULL, 1, 0, N'sohaib123@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'321cde1c-df66-445a-aca6-1788b7358b6d', N'ahmad1@gmail.com', 0, N'ABy81oiH9cJjcgdNJX2qRaBqOQaa+YG7V/LGdoPmYfXFrURdpqa0VXcMbUpERhYLdg==', N'e477f468-ac37-476a-87a0-7482abed0f20', NULL, 0, 0, NULL, 1, 0, N'ahmad1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'386eb278-b088-4000-871e-465ba6396182', N'ddddddddddddddddd@ghfzgh', 0, N'AKz9ZeqBwSW4J/W2z10L13sUhFr8U4Lx7tydl2AhmvImNof/wzbMXOdlpfUCmyrCtA==', N'66360ffb-6dc8-406f-8756-97080ca69a32', NULL, 0, 0, NULL, 1, 0, N'ddddddddddddddddd@ghfzgh')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'43050269-3c69-4f9e-a9cd-6acdf42cda14', N'ahmad123@gmail.com', 0, N'AOEuheO3WDY/MBEjArq8kw+cIfsSGxYNBpDgwdMp1GNBh9cwaPVOBwGyBt0mdR3HaA==', N'7d406733-318c-427f-9a73-ff43d36a6b58', NULL, 0, 0, NULL, 1, 0, N'ahmad123@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4c1b263a-4501-4089-b8af-2851c6653a9b', N'bana111@gmail.com', 0, N'AH+2D0JmjNAUlhpj2oe3EYMeFwQcp9cO9PJBol1Lp4CGDdXik2/hOxksGtVRxH1Yag==', N'8ddfad34-5d52-4694-ab61-ccc4755975f7', NULL, 0, 0, NULL, 1, 0, N'bana111@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5f1e49dc-909f-4813-8745-8b79dd81137c', N'cccccccccc@gmail.com', 0, N'AEXSJNS6yz3ZvWm5yDyS+oMOOSssyf4n7RQu94PbnscFqJF9q774hKxlwyJzSnphlg==', N'fcd112f1-c7ff-406c-8a35-171ea8ecd12c', NULL, 0, 0, NULL, 1, 0, N'cccccccccc@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'66577de4-7111-4d99-b798-ed1ae50a4540', N'wesam@gmail.com', 0, N'AA50G2opxrcxnFXQGFkD6+YJChFhmbKVJJs0lDjOtywrMEe2bl71eM0ADXWOvOmd0A==', N'63193189-7e83-4fbf-950a-5dc5590cabc6', NULL, 0, 0, NULL, 1, 0, N'wesam@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6ed2baa0-3b96-4883-a8de-2b91dd6b60a2', N'Admin@gmail.com', 0, N'AO/QmuypnscTOhl7qEy0Bd51tgPsUIpqwlZxlFl3uU10DCeXoh/VBhWfOlB2nnVMFQ==', N'0f9b6096-105e-4b8f-a055-4686dd2dd226', NULL, 0, 0, NULL, 1, 0, N'Admin@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'71741dfe-7cf7-4ba1-acdb-cece28205a7a', N'rogina12@gmail.com', 0, N'ABAhr3+MT3fyD/+q6u8nI53YplADsxDwTz2VgmN7VonJ8QOrCmAdAdKD6+skvQEbxA==', N'a3da9763-15db-4861-83b4-2b8b1d58693e', NULL, 0, 0, NULL, 1, 0, N'rogina12@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ea53e6a-a369-45d8-8fa2-d1c489ccf969', N'sohaib33@gmail.com', 0, N'AFbgkvtK1+fG/gsIzNEObTgZrSm62bD+LDXUAXPbokdzAUuVR/ZCr+PiGR3L2vgPIg==', N'f4abfe1d-d0b8-40fd-b6e6-0f78d174f10c', NULL, 0, 0, NULL, 1, 0, N'sohaib33@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'856b06da-a6d6-4f43-938c-c5992cf4e264', N'ali@gmail.com', 0, N'AK55PULfx7PAubfRgaR11jY6Hfy4MnZGy9KvVy9/OIXI7xKZj/QbOPGa5/F0TLRlMA==', N'3b2e807c-aed2-45cb-a6fc-8b51427165bd', NULL, 0, 0, NULL, 1, 0, N'ali@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'887d09e9-f10b-44b8-96b2-03f8c62c6872', N'Student1@gmail.com', 0, N'AMFcwq01XrZqQdCzGK6k3HVGBy7mkCddwd8VAijFmltRU/LQq6pXx80H6nTZQDlF2w==', N'756289bd-b5cd-4df4-8510-9eff47289ca1', NULL, 0, 0, NULL, 1, 0, N'Student1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'88e71427-e502-4776-9f61-f82d5813ec24', N'rogina@gmail.com', 0, N'AG4ZLPzLxkHqaJH48KByVNvqx6j4tJyoPcgHSeZytI2RlyV+Lu963Y6X8CYQTAENQw==', N'b18a8da1-e6c6-4bd4-a73d-a3b2f30429ed', NULL, 0, 0, NULL, 1, 0, N'rogina@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'95ae4948-0841-4061-9044-fc76a3317bf5', N'aaaaaaaaaaaa@gggg', 0, N'APrRBtFukMX9Fa9TkwVAwEdZECUgz7trmoNmkDsHWOCmTrnc6SSA16NMcDg1TJnvXA==', N'fe14b74f-2954-417b-a21b-253202878ef8', NULL, 0, 0, NULL, 1, 0, N'aaaaaaaaaaaa@gggg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a518b811-9f9c-4a9e-bfc4-ae1dc63af175', N'sohaib111@gmail.com', 0, N'AAxYMAXnGvj78yK8z18CiVO6pPnMsykiTw/RpO82+7Ssgt4P8x7voVVt88p6a1pfFQ==', N'77b18a2a-2037-4642-b53d-d66fa235f97c', NULL, 0, 0, NULL, 1, 0, N'sohaib111@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a6cbece1-d6e5-481d-b37a-844d817b72d1', N'sohaib21@gmail.com', 0, N'ALb63ldCQCr84FKt9OvVuolT/S1RfY+kWiw8RJ0gUdOTJRjb3zxR01xJrGxS5x/Mmg==', N'5e336e67-9ff3-4b42-888a-04d140055ac9', NULL, 0, 0, NULL, 1, 0, N'sohaib21@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a89e7fb0-0cec-44eb-bc98-890283f57dc5', N'fffffvdsf@gmail.com', 0, N'AA/j+L6uAKKzC4zKT7mcIGRg6H/niBEwP0aptsimXhD0pgXdI/MUw9BqldCZ0LoX3w==', N'2ebc4ea4-dcb9-47f8-b7b6-b3f47f0391bd', NULL, 0, 0, NULL, 1, 0, N'fffffvdsf@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bf060a3a-32bd-4ab7-8519-7a817f510a08', N'fares123@gmail', 0, N'AFXMbY4l8dmj3B2iNVVo+eEKHe5bDWzFkI8YIAk0HRFAp492G9BYLlKGTnjvF+gdTQ==', N'e704f901-1df5-4fa9-909e-ba4eaa5a1de5', NULL, 0, 0, NULL, 1, 0, N'fares123@gmail')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c56ce1f1-e26d-4ab9-ad79-44f2e34d1418', N'haytham@gmail.com', 0, N'AMf2HOw/ep0c4UQjQtMyRMc4q5neY8dj3AwBsJv+EGPOa9tVPWLeSG/HxO5+KYbDrw==', N'06360c57-1c18-4f41-8f76-e7a474ad5690', NULL, 0, 0, NULL, 1, 0, N'haytham@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c59e323f-74ad-4108-ab48-25292e116134', N'Student@gmail.com', 0, N'AKUeOGchhKaUus9Y4Cm/xys4x2i9FhjXLx7ehjfBAujROFkQVIQC57i1MmViMMnfHg==', N'c4805bb8-017c-44d7-a567-37661f62ab97', NULL, 0, 0, NULL, 1, 0, N'Student@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c63ce946-b883-401a-9e4b-d1d26f2ba6d8', N'khaled@gmail.com', 0, N'ABP9djLQ71XeaJSudaiZuO/prU7BGYDGMygIY3RpYLfOthDB2WF2bjf+olh2MFReJA==', N'49db4f2e-c27f-4175-8eb6-db2d0f297471', NULL, 0, 0, NULL, 1, 0, N'khaled@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd2e70d39-0f33-453c-b544-a5673f3581dc', N'yazeed@gmail.com', 0, N'ACPkfr3HFCBnNNMoaqd2CvzFvf2xgsnJkbovB2CkT/BajuJkV7THuTRSaAKL2Si2EA==', N'da7177a4-5e4b-45da-b814-cab37f1cb47c', NULL, 0, 0, NULL, 1, 0, N'yazeed@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd4b56a7d-34c6-40ba-87c5-0b064480ca7c', N'sohaib@gmail.com', 0, N'AKRTSKNpJCXSO0/ncl2Zfiq4QeKO/zZ8KYcX27Dog5LlFHE7XxmlGxdtp/zvgByX6Q==', N'464092b3-5cf2-4627-9c04-88e3268d3f08', NULL, 0, 0, NULL, 1, 0, N'sohaib@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dd5b689f-fd5d-4634-9a92-d84219808ec8', N'ahmad15123@gmail.com', 0, N'AP1gVMWlls6vRvlma4VjT9PGRL1tbr1aCC0Am/0ayJUH5VB9h5KRQGj3/cVnbnUmwQ==', N'809835d6-63a7-49e3-a2e1-5c064f1dd853', NULL, 0, 0, NULL, 1, 0, N'ahmad15123@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ea448062-3cc2-4c85-93f5-2584a37d2276', N'mays@ggggg', 0, N'AH8ux/Qu3C9cmLs+du0lIGp1iv01Y4VtKlibABXxPM09LTeIsxXpXaiRNe4s163SLw==', N'bce60bd9-4755-4e6a-b458-8ccab4d39f97', NULL, 0, 0, NULL, 1, 0, N'mays@ggggg')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f0895bb3-3bcf-4771-8d2b-624dd969a2f2', N'vvvvv@gmail.com', 0, N'AP6CzNRK2pjfxUBdmibVjrZ3yF9hmZxSZVZgmWySVUCA82X3l1JRu3iRSHCrSvyw+w==', N'08716de6-3d49-4a70-af10-a233b535ef64', NULL, 0, 0, NULL, 1, 0, N'vvvvv@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ffd96ad5-db6c-4556-b610-82d350feafdd', N'rogina121@gmail.com', 0, N'AMaygOvoo1RFcvIddaKN80OuKfowoAneugkAtAyCLRxxF6iNalZ5B+vTMP2IDVyCcA==', N'b8a062ac-7deb-42e2-9a7f-e0bed83a3c6f', NULL, 0, 0, NULL, 1, 0, N'rogina121@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([ID], [Name], [ImgFaculty], [Description], [AcceptanceRate]) VALUES (1, N'Engineering', N'images/eng.jpg', N'our Faculty of Engineering has been a leader in technology advancement and engineering education.
 Our faculty has assumed a remarkable role in shaping up both the local and regional educational and research communities. 
Over the past 40 years, our graduates have proved that they have acquired a wealth of theoretical knowledge, 
practical and soft skills that would definitely lead them and their reputable employers forward.', 85)
INSERT [dbo].[Faculties] ([ID], [Name], [ImgFaculty], [Description], [AcceptanceRate]) VALUES (7, N'Applied Medical Sciences', N'images/ams.jpg', N'The Faculty of Applied Medical Sciences (FAMS) was established in 2000. 
There are 76 faculty members teaching in 11 different disciplines including Allied Dental Sciences, Dental Technology,
 Medical Laboratory Sciences, Physical Therapy, Occupational Therapy,
 Audiology and Speech Pathology, Optometry, Radiologic Technology, Anesthesia Technology, Respiratory Rehabilitation, and Paramedics.', 80)
INSERT [dbo].[Faculties] ([ID], [Name], [ImgFaculty], [Description], [AcceptanceRate]) VALUES (8, N'IT', N'images/cit.jpg', N'NAs information and communication technology has become a fundamental pillar in the renaissance and development of the society,
 the faculty of computer and information technology (CIT) utilizes technology and innovation in its educational programs,
 research activities, and social responsibilities in order to achieve the vision and goals of the university.
ULL', 75)
INSERT [dbo].[Faculties] ([ID], [Name], [ImgFaculty], [Description], [AcceptanceRate]) VALUES (9, N'Science & Arts', N'images/sci.jpg', N'NULLThe Faculty of Science and Arts - the faculty that has an important role in preparing and graduating conscious generations in various fields of science. 
The generations that contribute into society’s growth and evolution. 
Our faculty is eager in providing its students with the best that it can so the students can reflect a true bright image of both the faculty, and the university.', 70)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
GO
SET IDENTITY_INSERT [dbo].[Majors] ON 

INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (2, N'Civil Engineering', 1, 160, 40, N'The Department offers bachelor''s and master''s degrees in civil engineering and began to accept students at the doctoral level at the beginning of the academic year 1998/1999, majoring in transportations.')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (3, N'Electrical Engineering', 1, 160, 40, N'The Department of Electrical Engineering at JUST offers the Bachelor of Science (B.Sc.) 
degree in Electrical Engineering in the following two specializations:
 Communications Engineering Power Engineering??The B. Sc. degree is awarded after
 successful completion of 160 credit hours in addition to practical training of not less than 8 weeks.
 The under?graduate curriculum provides a broad foundation in both standard and modern topics in electrical engineering.???')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (5, N'Mechanical Engineering', 1, 160, 40, N'??Mechanical Engineering is one of the oldest and broadest areas of the engineering profession.
')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (6, N'Radiologic  Tecnoloagy', 7, 130, 35, N'The program introduces students to physical and clinical
aspects of medical imaging modalities used in the radiology field. The curriculum
includes coursework and clinical training in hospitals. The program qualifies students
to work on different imaging techniques such as computed tomography, magnetic
resonance imaging and nuclear medicine.')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (7, N'Dental Tecnoloagy', 7, 130, 35, N'The program includes courses in dental materials, dental
morphology and issue in dental laboratory technology. The extensive laboratory
component covers all parts of dental technology: Fixed restorations, partial and
complete removable dentures, orthodontic appliances, maxillofacial prostheses and
dental implant. As a result of this experience, students acquire skills in waxing,
')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (8, N'Physical Therapy', 7, 130, 35, N'Physical Therapy program is designed to meet the
standard requirements for the national and regional physical therapy license of
practice. The program prepares graduates to become fully competent physical
therapists equipped capable of assuming roles of clinical practitioners, educators, and
administrators. We offer excellent learning environment through active learning,')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (9, N'Computer Science', 8, 132, 30, N' The Computer Science (CS) Department maintains high quality teaching and research in both Bachelor’s and Master’s programs.? The CS Department has distinguished tenured and tenure-track faculty members holding Ph.D. degrees from top world universities. Our faculty members conduct high quality research in different CS areas such as Artificial Intelligence, Computer Networks, Cyber Security, Multimedia, and Cloud Computing.
')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (10, N'Computer Engineering', 8, 160, 40, N'Computer Engineering (CPE) at Jordan University of Science and Technology (JUST). The website provides useful information about our undergraduate and graduate programs as well as the research areas in our department. Continuously ranked among the best in Jordan, the department offers both undergraduate and graduate programs.')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (11, N'Computer Information Systems', 8, 132, 30, N' The primary objective of the CIS department is to graduate internationally competitive and highly qualified students. The enrollment rate is about 70 students per academic year coming from more than 20 nationalities. Our state-of-the-art computer labs are under the disposal of our staff, students and local community all working weekdays. Besides being a friendly environment, the department is also active in serving the local community.
')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (12, N'Humanities', 9, 132, 25, N' The Department is gratified to have qualified faculty members whether from JUST or other universities. Currently, 14 faculty members are employed in the Department along with two full time lecturers and two lab technicians.')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (13, N'Physics', 9, 132, 25, N'Physics is an ancient Greek word defined as a natural science that involves the study of some concepts such as matter, time, space, energy, force, light, etc. Physics is one of oldest and most important subjects among the four academic disciplines ')
INSERT [dbo].[Majors] ([ID], [Name], [IdFaculty], [HoursNum], [Price], [Description]) VALUES (14, N'Mathematics', 9, 132, 25, N'The Department of Mathematics and Statistics was established in 1992, and offers a B.Sc. degree program in mathematics as a single specialization. The program requires a basic knowledge in mathematics with emphasis on concepts and applications.')
SET IDENTITY_INSERT [dbo].[Majors] OFF
GO
SET IDENTITY_INSERT [dbo].[RegisterClasses] ON 

INSERT [dbo].[RegisterClasses] ([student_id], [ClassID], [isPaid], [registerclasses]) VALUES (666666577, 46, NULL, 15)
INSERT [dbo].[RegisterClasses] ([student_id], [ClassID], [isPaid], [registerclasses]) VALUES (722222125, 29, 1, 16)
INSERT [dbo].[RegisterClasses] ([student_id], [ClassID], [isPaid], [registerclasses]) VALUES (722222125, 32, 1, 17)
INSERT [dbo].[RegisterClasses] ([student_id], [ClassID], [isPaid], [registerclasses]) VALUES (777777673, 81, 1, 18)
SET IDENTITY_INSERT [dbo].[RegisterClasses] OFF
GO
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (1, N'1', 1, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Ahmad Ali', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (2, N'2', 1, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Ahmad Ali', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (3, N'1', 2, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Haitham', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (4, N'2', 2, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Haitham', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (5, N'1', 3, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Suhaib', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (6, N'2', 3, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Suhaib', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (7, N'1', 4, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Odai', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (8, N'2', 4, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Odai', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (9, N'1', 5, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Nouran', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (10, N'2', 5, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Nouran', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (11, N'1', 6, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Faten', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (12, N'2', 6, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Faten', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (13, N'1', 7, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Rogina', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (14, N'2', 7, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Rogina', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (15, N'1', 8, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Alaa', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (16, N'2', 8, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Alaa', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (17, N'1', 9, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Rami', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (18, N'2', 9, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Rami', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (19, N'1', 10, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Rand', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (20, N'2', 10, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Rand', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (21, N'1', 11, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Amer', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (22, N'2', 11, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Amer', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (23, N'1', 12, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Moamen', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (24, N'2', 12, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Moamen', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (25, N'1', 13, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Razan', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (26, N'2', 13, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Razan', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (27, N'1', 14, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Nsreen', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (28, N'2', 14, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Nsreen', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (29, N'1', 15, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Mohammed', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (30, N'2', 15, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Mohammed', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (31, N'1', 16, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Yazeed', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (32, N'2', 16, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Yazeed', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (33, N'1', 17, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Roa''a', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (34, N'2', 17, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Roa''a', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (35, N'1', 18, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Qais', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (36, N'2', 18, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Qais', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (37, N'1', 19, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Batool', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (38, N'2', 19, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Batool', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (39, N'1', 20, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Hassan', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (40, N'2', 20, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Hassan', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (41, N'1', 21, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Rahma', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (42, N'2', 21, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Rahma', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (43, N'1', 22, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Moath', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (44, N'2', 22, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Moath', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (45, N'1', 23, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Mayaas', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (46, N'2', 23, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Mayaas', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (47, N'1', 24, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Rahma', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (48, N'2', 24, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Rahma', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (49, N'1', 25, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Ashraf', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (50, N'2', 25, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Ashraf', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (51, N'1', 26, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Aya', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (52, N'2', 26, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Aya', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (53, N'1', 27, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Lubna', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (54, N'2', 27, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Lubna', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (55, N'1', 28, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Eman', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (56, N'2', 28, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Eman', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (57, N'1', 29, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Wesam', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (58, N'2', 29, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Wesam', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (59, N'1', 30, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Lujain', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (60, N'2', 30, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Lujain', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (61, N'1', 31, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Haya', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (62, N'2', 31, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Haya', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (63, N'1', 32, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Ahmad', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (64, N'2', 32, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Ahmad', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (65, N'1', 33, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Bana', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (66, N'2', 33, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'Bana', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (67, N'1', 34, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'Ali', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (68, N'2', 34, N'Sun-Tue-Thu', CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), NULL, N'Khaled', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (69, N'1', 35, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:30:00' AS Time), NULL, N'ahmad', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (70, N'2', 35, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, N'ali', NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (71, N'1', 36, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (72, N'2', 36, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (73, N'1', 37, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (74, N'2', 37, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (75, N'1', 38, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (76, N'2', 38, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (77, N'1', 39, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (78, N'2', 39, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (79, N'1', 40, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (80, N'2', 40, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (81, N'1', 41, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (82, N'2', 41, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (83, N'1', 42, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (84, N'2', 42, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (85, N'1', 43, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (86, N'2', 43, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (87, N'1', 44, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (88, N'2', 44, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (89, N'1', 45, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (90, N'2', 45, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (91, N'1', 46, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (92, N'2', 46, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (93, N'1', 47, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (94, N'2', 47, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (95, N'1', 48, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (96, N'2', 48, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (97, N'1', 49, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (98, N'2', 49, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (99, N'1', 50, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
GO
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (100, N'2', 50, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (101, N'1', 51, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (102, N'2', 51, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (103, N'1', 52, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (104, N'2', 52, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (105, N'1', 53, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (106, N'2', 53, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (107, N'1', 54, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (108, N'2', 54, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (109, N'1', 55, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (110, N'2', 55, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (111, N'1', 56, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (112, N'2', 56, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (113, N'1', 57, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (114, N'2', 57, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (115, N'1', 58, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (116, N'2', 58, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (117, N'1', 59, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (118, N'2', 59, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (119, N'1', 60, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (120, N'2', 60, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (121, N'1', 61, N'Mon-Wed', CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (122, N'2', 61, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (123, N'1', 62, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (125, N'2', 62, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (126, N'1', 63, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (127, N'2', 63, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (128, N'1', 64, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (129, N'2', 64, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (130, N'1', 65, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (131, N'2', 65, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (132, N'1', 66, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (133, N'2', 66, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (134, N'1', 67, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (135, N'2', 67, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (136, N'1', 68, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (137, N'2', 68, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (138, N'1', 69, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (139, N'2', 69, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (140, N'1', 70, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (141, N'2', 70, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (142, N'1', 71, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (143, N'2', 71, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (144, N'1', 72, N'Mon-Wed', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
INSERT [dbo].[Section] ([ClassID], [ClassNumber], [IdSubject], [Days], [StartTime], [EndTime], [ClassStatus], [Instructor], [Location]) VALUES (145, N'2', 72, N'Sun-Tue-Thu', CAST(N'08:00:00' AS Time), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Section] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1, N'c63ce946-b883-401a-9e4b-d1d26f2ba6d8', 11, N'bana', N'hamzh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (55555549, N'149678c0-e7c9-4c1c-a938-bd2692ddd6d3', 11, N'Roojena', N'Rezq', CAST(N'1998-03-24' AS Date), 0, N'0779996565', N'img4.jpeg', 88, N'sci.jpg', N'Screenshot 2023-02-15 130407.png', 1, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (111111097, N'66577de4-7111-4d99-b798-ed1ae50a4540', 6, N'wesam', N'Ali', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (166666645, N'4c1b263a-4501-4089-b8af-2851c6653a9b', 10, N'bana', N'hamzh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (222222193, N'4c1b263a-4501-4089-b8af-2851c6653a9b', 10, N'bana', N'hamzh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (333333289, N'f0895bb3-3bcf-4771-8d2b-624dd969a2f2', 10, N'dddddd', N'sssssssssssss', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (388888837, N'a89e7fb0-0cec-44eb-bc98-890283f57dc5', 10, N'ali', N'ahmad', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (444444385, N'856b06da-a6d6-4f43-938c-c5992cf4e264', 9, N'ali', N'ahmad', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (499999933, N'386eb278-b088-4000-871e-465ba6396182', 3, N'wesam', N'Ali', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (555555481, N'5f1e49dc-909f-4813-8745-8b79dd81137c', 8, N'bana', N'hamzh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (611111029, N'5f1e49dc-909f-4813-8745-8b79dd81137c', 8, N'bana', N'hamzh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (666666577, N'bf060a3a-32bd-4ab7-8519-7a817f510a08', 6, N'dddddd', N'sssssssssssss', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (722222125, N'c56ce1f1-e26d-4ab9-ad79-44f2e34d1418', 5, N'haytham', N'hazaymeh', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (777777673, N'039f1a55-ace3-4de7-95a6-7e436943b45a', 9, N'ali', N'ahmad', NULL, 1, N'0779996565', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (833333221, N'ea448062-3cc2-4c85-93f5-2584a37d2276', 6, N'sdgdfg', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (888888769, N'887d09e9-f10b-44b8-96b2-03f8c62c6872', 11, N'ali', N'ahmad', NULL, 1, N'0779996565', N'img4.jpeg', NULL, N'cit.jpg', NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (944444317, N'7ea53e6a-a369-45d8-8fa2-d1c489ccf969', 2, N'sohaib2', N'alrousan', NULL, 1, N'0790552460', NULL, 85, NULL, NULL, 1, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1055555413, N'd2e70d39-0f33-453c-b544-a5673f3581dc', 2, N'yazeed', N'aldeamen', NULL, 1, N'9654945684', NULL, 20, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1111110961, NULL, 2, N'sohaib', N'alrousan', NULL, 1, N'0790552460', NULL, 85, NULL, NULL, NULL, NULL)
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1166666509, N'88e71427-e502-4776-9f61-f82d5813ec24', 2, N'rogina', N'aldeamen', NULL, 1, N'(965) 494-5684', NULL, 85, NULL, NULL, 1, N'rogina@gmail.com')
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1222222057, N'71741dfe-7cf7-4ba1-acdb-cece28205a7a', 2, N'rogina1', N'aldeamen', NULL, 1, N'(965) 494-5684', NULL, 80, NULL, NULL, NULL, N'rogina12@gmail.com')
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1277777605, N'ffd96ad5-db6c-4556-b610-82d350feafdd', 2, N'rogina1', N'aldeamen', NULL, 1, N'(965) 494-5684', NULL, NULL, NULL, NULL, NULL, N'rogina121@gmail.com')
INSERT [dbo].[Students] ([StudentId], [IdUser], [IdMajor], [FirstName], [LastName], [BirthDate], [Gender], [PhoneNum], [StudentImg], [SchoolAvg], [CertificateImg], [PersonalIDImg], [IsAccepted], [studentEmail]) VALUES (1333333153, N'10d5dcd8-79f9-4c37-bb60-6bdfe9c1b7e8', 2, N'rogina1', N'aldeamen', NULL, 1, N'(965) 494-5684', NULL, NULL, NULL, NULL, NULL, N'rogina1211@gmail.com')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (1, N'STRUCTURAL ANALYSIS', 2, 3, N'CV1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (2, N'CONCRETE TECHNOLOGY', 2, 3, N'CV2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (3, N'NUMERICAL METHODS', 2, 3, N'CV3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (4, N'ENGINEERING ECONOMY', 2, 3, N'CV4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (5, N'CIVIL ENGINEERING DRAWING', 2, 3, N'CV5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (6, N'STRENGTH OF MATERIALS', 2, 3, N'CV6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (7, N'NUMERICAL METHODS FOR ENGINEERS', 3, 3, N'EL1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (8, N'ELECTRIC DRIVE', 3, 3, N'EL2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (9, N'SIGNAL AND SYSTEMS ANALYSIS', 3, 3, N'EL3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (10, N'INTRODUCTION TO ELECTRONICS', 3, 3, N'EL4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (11, N'ELECTRIC CIRCUIT ANALYSIS', 3, 3, N'EL5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (12, N'CIRCUITS', 3, 3, N'EL6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (13, N'FLUID MECHANICS', 5, 3, N'ME1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (14, N'MACHINE DESIGN', 5, 3, N'ME2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (15, N'THERMODYNAMIC', 5, 3, N'ME3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (16, N'MECHANICS OF MACHINES', 5, 3, N'ME4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (17, N'ENGINEERING WORKSHOPS', 5, 3, N'ME5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (18, N'THEORETICAL', 5, 3, N'ME6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (19, N'FLUOROSCOPIE IMAGING', 6, 3, N'RT1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (20, N'MAMMOGRAPHY', 6, 3, N'RT2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (21, N'RADIOLOGIC PATHOLOGY', 6, 3, N'RT3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (22, N'RADIOGRAPHIC CROSS SECTIONAL ANATOMY', 6, 3, N'RT4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (23, N'PRINCIPLES OF DIAGNOSTIC IMAGING', 6, 3, N'RT5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (24, N'DIGITAL IMAGE PROCESSING AND ANALYSIS', 6, 3, N'RT6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (25, N'MAXILLOFACIAL', 7, 3, N'DT1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (26, N'PROSTHODONTICS', 7, 3, N'DT2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (27, N'ORTHODONTICS', 7, 3, N'DT3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (28, N'FIXED PROSTHODONTICS', 7, 3, N'DT4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (29, N'ADVANCED REMOVABLE', 7, 3, N'DT5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (30, N'REMOVABLE COMPLETE PROSTHODONTICS', 7, 3, N'DT6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (31, N'INTRODUCTION TO CLINICAL MEDICINE', 8, 3, N'PT1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (32, N'GROSS ANATOMY & HISTOLOGY', 8, 3, N'PT2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (33, N'INTRODUCTION TO PHYSIOTHERAPY', 8, 3, N'PT3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (34, N'MAXILLOFACIAL', 8, 3, N'PT4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (35, N'PROSTHODONTICS', 8, 3, N'PT5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (36, N'THERAPEUTIC EXERCISE', 8, 3, N'PT6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (37, N' HUMAN-COMPUTER INTERACTION', 9, 3, N'CS1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (38, N'THEORY OF COMPUTING', 9, 3, N'CS2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (39, N'DATA STRUCTURES', 9, 3, N'CS3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (40, N'PROGRAMMING IN C++', 9, 3, N'CS4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (41, N'OBJECT-ORIENTED PROGRAMMING ', 9, 3, N'CS5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (42, N'INTRODUCTION TO PROGRAMMING', 9, 3, N'CS6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (43, N'ARTIFICIAL INTELLIGENCE', 10, 3, N'CE1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (44, N'OPERATING SYSTEMS', 10, 3, N'CE2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (45, N'Digital Integrated Circuits', 10, 3, N'CE3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (46, N'COMPUTER ARCHITECTURE', 10, 3, N'CE4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (47, N'COMPUTER ORGANIZATION AND DESIGN', 10, 3, N'CE5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (48, N'DIGITAL LOGIC DESIGN', 10, 3, N'CE6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (49, N'Health information systems', 11, 3, N'CIS1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (50, N'Data mining', 11, 3, N'CIS2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (51, N'Accounting', 11, 3, N'CIS3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (52, N'Fundamentals of Database Systems', 11, 3, N'CIS4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (53, N'COMMUNICATION AND PROFESSIONAL ETHICS', 11, 3, N'CIS5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (54, N'COMMUNICATION SKILLS
', 11, 3, N'CIS6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (55, N' ISLAMIC CIVILIZATION', 12, 3, N'HUM1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (56, N'DIGITAL SKILLS', 12, 3, N'HUM2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (57, N'ENTREPRENEURSHIP AND INNOVATION', 12, 3, N'HUM3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (58, N'ECONOMIC SYSTEM IN ISLAM', 12, 3, N'HUM4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (59, N'LEADER AND SOCIAL RESPONSIBILITY', 12, 3, N'HUM5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (60, N'THE PALESTINIAN ISSUE', 12, 3, N'HUM6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (61, N'MODERN PHYSICS', 13, 3, N'PHY1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (62, N'PROPERTIES OF MATTER AND HEAT', 13, 3, N'PHY2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (63, N'SPACE PHYSICS', 13, 3, N'PHY3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (64, N'MATHEMATICAL PHYSICS', 13, 3, N'PHY4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (65, N'ELECTRONICS', 13, 3, N'PHY5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (66, N'GENERAL PHYSICS', 13, 3, N'PHY6')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (67, N'DISCRETE MATHEMATICS', 14, 3, N'MAT1')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (68, N'PROBABILITY THEORY', 14, 3, N'MAT2')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (69, N'INTERMEDIATE ANALYSIS', 14, 3, N'MAT3')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (70, N'FUNDAMENTALS OF MATHEMATICS', 14, 3, N'MAT4')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (71, N'ELEMENTS OF LINEAR ALGEBRA', 14, 3, N'MAT5')
INSERT [dbo].[Subjects] ([ID_Subject], [Subject_Name], [IdMajor], [SubjectHours], [SubjectCode]) VALUES (72, N'ELEMENTS OF STATISTICS', 14, 3, N'MAT6')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD  CONSTRAINT [DF_AspNetUserRoles_UserId]  DEFAULT ((2)) FOR [UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD  CONSTRAINT [DF_AspNetUserRoles_RoleId]  DEFAULT ((2)) FOR [RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] ADD  CONSTRAINT [DF_AspNetUserRoles_note]  DEFAULT ((2)) FOR [note]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Majors]  WITH CHECK ADD  CONSTRAINT [FK_Majors_Majors] FOREIGN KEY([IdFaculty])
REFERENCES [dbo].[Faculties] ([ID])
GO
ALTER TABLE [dbo].[Majors] CHECK CONSTRAINT [FK_Majors_Majors]
GO
ALTER TABLE [dbo].[RegisterClasses]  WITH CHECK ADD  CONSTRAINT [FK__RegisterC__Class__02FC7413] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Section] ([ClassID])
GO
ALTER TABLE [dbo].[RegisterClasses] CHECK CONSTRAINT [FK__RegisterC__Class__02FC7413]
GO
ALTER TABLE [dbo].[RegisterClasses]  WITH CHECK ADD  CONSTRAINT [FK__RegisterC__stude__02084FDA] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[RegisterClasses] CHECK CONSTRAINT [FK__RegisterC__stude__02084FDA]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_classes_Subjects] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subjects] ([ID_Subject])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_classes_Subjects]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Majors] FOREIGN KEY([IdMajor])
REFERENCES [dbo].[Majors] ([ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Majors]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Students] FOREIGN KEY([IdUser])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Students]
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_Majors] FOREIGN KEY([IdMajor])
REFERENCES [dbo].[Majors] ([ID])
GO
ALTER TABLE [dbo].[Subjects] CHECK CONSTRAINT [FK_Subjects_Majors]
GO
