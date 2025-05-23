USE [SKY]
GO
/****** Object:  Table [dbo].[AllPlant]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllPlant](
	[PlantNameID] [int] IDENTITY(1,1) NOT NULL,
	[PlantCategory] [int] NULL,
	[PlantDescription] [nvarchar](50) NULL,
	[NormalPrice] [nvarchar](50) NULL,
 CONSTRAINT [AllPlant$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PlantNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerNotes]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerNotes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [int] NULL,
	[Date] [datetime2](0) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerNotes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[ContactTitle] [nvarchar](50) NULL,
	[ContactFirstNames] [nvarchar](50) NULL,
	[ContactSurname] [nvarchar](50) NULL,
	[Line1] [nvarchar](50) NULL,
	[Line2] [nvarchar](50) NULL,
	[Line3] [nvarchar](50) NULL,
	[Line4] [nvarchar](50) NULL,
	[Postcode] [nvarchar](50) NULL,
	[Telephone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[mailshot] [bit] NULL,
 CONSTRAINT [Customers$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CustID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inspections]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inspections](
	[UniqueRef] [int] IDENTITY(1,1) NOT NULL,
	[HoldingID] [int] NULL,
	[InspectionDate] [datetime2](0) NULL,
	[Location] [nvarchar](50) NULL,
	[VehicleInspectedOn] [int] NULL,
	[RecentCheck] [nvarchar](50) NULL,
	[PreviousCheck] [nvarchar](50) NULL,
	[SafeWorking] [nvarchar](50) NULL,
	[Defects] [nvarchar](max) NULL,
	[Rectified] [nvarchar](max) NULL,
	[LatestDate] [datetime2](0) NULL,
	[TestDetails] [nvarchar](max) NULL,
	[MiscNotes] [nvarchar](max) NULL,
	[HasSubPlant] [bit] NULL,
 CONSTRAINT [PK_Inspections] PRIMARY KEY CLUSTERED 
(
	[UniqueRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantCategories]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryDescription] [nvarchar](50) NULL,
 CONSTRAINT [PlantCategories$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlantHolding]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlantHolding](
	[HoldingID] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [int] NULL,
	[PlantNameID] [int] NULL,
	[SerialNumber] [nvarchar](50) NULL,
	[StatusID] [int] NULL,
	[HasSubPlant] [bit] NULL,
	[SWL] [nvarchar](80) NULL,
 CONSTRAINT [PlantHolding$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[HoldingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 22/03/2025 10:46:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusDescription] [nvarchar](50) NOT NULL,
 CONSTRAINT [Status$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AllPlant] ADD  DEFAULT ((0)) FOR [PlantCategory]
GO
ALTER TABLE [dbo].[CustomerNotes] ADD  DEFAULT ((0)) FOR [CustID]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((0)) FOR [mailshot]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT ((0)) FOR [HoldingID]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT (CONVERT([datetime],CONVERT([varchar],getdate(),(1)),(1))) FOR [InspectionDate]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT ('Yard') FOR [Location]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT ((0)) FOR [VehicleInspectedOn]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT ('Not known') FOR [RecentCheck]
GO
ALTER TABLE [dbo].[Inspections] ADD  DEFAULT ((0)) FOR [HasSubPlant]
GO
ALTER TABLE [dbo].[PlantHolding] ADD  DEFAULT ((0)) FOR [CustID]
GO
ALTER TABLE [dbo].[PlantHolding] ADD  DEFAULT ((0)) FOR [PlantNameID]
GO
ALTER TABLE [dbo].[PlantHolding] ADD  DEFAULT ((0)) FOR [StatusID]
GO
ALTER TABLE [dbo].[PlantHolding] ADD  DEFAULT ((0)) FOR [HasSubPlant]
GO
ALTER TABLE [dbo].[AllPlant]  WITH NOCHECK ADD  CONSTRAINT [AllPlant$PlantCategoriesAllPlant] FOREIGN KEY([PlantCategory])
REFERENCES [dbo].[PlantCategories] ([CategoryID])
GO
ALTER TABLE [dbo].[AllPlant] CHECK CONSTRAINT [AllPlant$PlantCategoriesAllPlant]
GO
ALTER TABLE [dbo].[CustomerNotes]  WITH NOCHECK ADD  CONSTRAINT [CustomerNotes$CustomersCustomerNotes] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customers] ([CustID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerNotes] CHECK CONSTRAINT [CustomerNotes$CustomersCustomerNotes]
GO
ALTER TABLE [dbo].[Inspections]  WITH NOCHECK ADD  CONSTRAINT [Inspections$PlantHoldingInspections] FOREIGN KEY([HoldingID])
REFERENCES [dbo].[PlantHolding] ([HoldingID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inspections] CHECK CONSTRAINT [Inspections$PlantHoldingInspections]
GO
ALTER TABLE [dbo].[PlantHolding]  WITH CHECK ADD  CONSTRAINT [FK_PlantHolding_PlantHolding] FOREIGN KEY([HoldingID])
REFERENCES [dbo].[PlantHolding] ([HoldingID])
GO
ALTER TABLE [dbo].[PlantHolding] CHECK CONSTRAINT [FK_PlantHolding_PlantHolding]
GO
ALTER TABLE [dbo].[PlantHolding]  WITH NOCHECK ADD  CONSTRAINT [FK_PlantHolding_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[PlantHolding] CHECK CONSTRAINT [FK_PlantHolding_Status]
GO
ALTER TABLE [dbo].[PlantHolding]  WITH NOCHECK ADD  CONSTRAINT [PlantHolding$AllPlantPlantHolding] FOREIGN KEY([PlantNameID])
REFERENCES [dbo].[AllPlant] ([PlantNameID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantHolding] CHECK CONSTRAINT [PlantHolding$AllPlantPlantHolding]
GO
ALTER TABLE [dbo].[PlantHolding]  WITH NOCHECK ADD  CONSTRAINT [PlantHolding$CustomersPlantHolding] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customers] ([CustID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlantHolding] CHECK CONSTRAINT [PlantHolding$CustomersPlantHolding]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[PlantNameID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'COLUMN',@level2name=N'PlantNameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[PlantCategory]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'COLUMN',@level2name=N'PlantCategory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[PlantDescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'COLUMN',@level2name=N'PlantDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[NormalPrice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'COLUMN',@level2name=N'NormalPrice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'CONSTRAINT',@level2name=N'AllPlant$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[AllPlant].[PlantCategoriesAllPlant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AllPlant', @level2type=N'CONSTRAINT',@level2name=N'AllPlant$PlantCategoriesAllPlant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes].[NoteID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes', @level2type=N'COLUMN',@level2name=N'NoteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes].[CustID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes', @level2type=N'COLUMN',@level2name=N'CustID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes].[Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[CustomerNotes].[CustomersCustomerNotes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerNotes', @level2type=N'CONSTRAINT',@level2name=N'CustomerNotes$CustomersCustomerNotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[CustID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CustID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[CompanyName]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'CompanyName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[ContactTitle]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'ContactTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[ContactFirstNames]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'ContactFirstNames'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[ContactSurname]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'ContactSurname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Line1]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Line1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Line2]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Line2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Line3]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Line3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Line4]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Line4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Postcode]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Postcode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Telephone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Telephone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[Fax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Fax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[email]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[mailshot]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'mailshot'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'CONSTRAINT',@level2name=N'Customers$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Customers]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[UniqueRef]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'UniqueRef'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[HoldingID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'HoldingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[InspectionDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'InspectionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[Location]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[VehicleInspectedOn]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'VehicleInspectedOn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[RecentCheck]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'RecentCheck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[PreviousCheck]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'PreviousCheck'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[SafeWorking]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'SafeWorking'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[Defects]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'Defects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[Rectified]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'Rectified'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[LatestDate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'LatestDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[TestDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'TestDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[MiscNotes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'MiscNotes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[HasSubPlant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'COLUMN',@level2name=N'HasSubPlant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Inspections].[PlantHoldingInspections]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inspections', @level2type=N'CONSTRAINT',@level2name=N'Inspections$PlantHoldingInspections'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantCategories].[CategoryID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantCategories', @level2type=N'COLUMN',@level2name=N'CategoryID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantCategories].[CategoryDescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantCategories', @level2type=N'COLUMN',@level2name=N'CategoryDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantCategories].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantCategories', @level2type=N'CONSTRAINT',@level2name=N'PlantCategories$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantCategories]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantCategories'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[HoldingID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'HoldingID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[CustID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'CustID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[PlantNameID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'PlantNameID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[SerialNumber]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'SerialNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[StatusID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[HasSubPlant]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'HasSubPlant'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[SWL]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'COLUMN',@level2name=N'SWL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'CONSTRAINT',@level2name=N'PlantHolding$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[AllPlantPlantHolding]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'CONSTRAINT',@level2name=N'PlantHolding$AllPlantPlantHolding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[PlantHolding].[CustomersPlantHolding]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PlantHolding', @level2type=N'CONSTRAINT',@level2name=N'PlantHolding$CustomersPlantHolding'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Status].[StatusID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Status', @level2type=N'COLUMN',@level2name=N'StatusID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Status].[StatusDescription]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Status', @level2type=N'COLUMN',@level2name=N'StatusDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Status].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Status', @level2type=N'CONSTRAINT',@level2name=N'Status$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'SkyTechnical.[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Status'
GO
