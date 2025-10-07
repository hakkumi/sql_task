USE CompanyProductionDB;
GO

-- AgentType Table
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
	[ChangedByEmployeeID] [int] NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
	[PointType] [nvarchar](50) NOT NULL CHECK (PointType IN ('RetailStore', 'OnlineStore', 'Wholesale', 'ResaleStore')),
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
	[OperationType] [nvarchar](50) NOT NULL CHECK (OperationType IN ('Receipt', 'Inventory', 'ReleaseToProduction')),
	[PerformedByEmployeeID] [int] NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
	[PackageLength] [decimal](10, 2) NULL,
	[PackageWidth] [decimal](10, 2) NULL,
	[PackageHeight] [decimal](10, 2) NULL,
	[WeightWithoutPackage] [decimal](10, 2) NULL,
	[WeightWithPackage] [decimal](10, 2) NULL,
	[QualityCertificate] [nvarchar](100) NULL,
	[StandardNumber] [nvarchar](100) NULL,
	[ProductionTime] [int] NOT NULL,
	[ProductionCost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[TotalAmount] [decimal](18,2) NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO


CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[PassportData] [nvarchar](255) NOT NULL,
	[BankDetails] [nvarchar](500) NOT NULL,
	[HasFamily] [bit] NOT NULL DEFAULT 0,
	[HealthIssues] [nvarchar](max) NULL,
	[Specialization] [nvarchar](255) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
GO

CREATE TABLE [dbo].[EmployeeMovements](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[MovementTime] [datetime] NOT NULL DEFAULT GETDATE(),
 CONSTRAINT [PK_EmployeeMovements] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[EmployeeAttendance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[EventType] [nvarchar](50) NOT NULL CHECK (EventType IN ('Entry', 'Exit', 'Break')),
	[EventTime] [datetime] NOT NULL DEFAULT GETDATE(),
 CONSTRAINT [PK_EmployeeAttendance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ManagerID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT GETDATE(),
	[Status] [nvarchar](50) NOT NULL CHECK (Status IN ('Created', 'Prepaid', 'InProduction', 'ReadyForDelivery', 'Delivered', 'Completed', 'Cancelled')),
	[PrepaymentDate] [datetime] NULL,
	[FullPaymentDate] [datetime] NULL,
	[CancellationDate] [datetime] NULL,
	[DeliveryMethod] [nvarchar](50) NULL CHECK (DeliveryMethod IN ('Delivery', 'SelfPickup', NULL)),
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[AgreedPrice] [decimal](18,2) NOT NULL,
	[EstimatedProductionTime] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

CREATE TABLE [dbo].[SupplierDeliveries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Quantity] [decimal](18,2) NOT NULL,
	[DeliveryDate] [datetime] NOT NULL,
	[QualityRating] [int] NULL,
 CONSTRAINT [PK_SupplierDeliveries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY];
GO

ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID]);
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType];
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID]);
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent];
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Employees] FOREIGN KEY([ChangedByEmployeeID])
REFERENCES [dbo].[Employees] ([ID]);
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Employees];
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID]);
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType];
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID]);
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material];
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Employees] FOREIGN KEY([PerformedByEmployeeID])
REFERENCES [dbo].[Employees] ([ID]);
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Employees];
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID]);
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material];
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID]);
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier];
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID]);
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType];
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID]);
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product];
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID]);
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material];
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID]);
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product];
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID]);
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent];
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID]);
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product];
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID]);
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent];
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID]);
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Agent];
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Employees] ([ID]);
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees];
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID]);
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders];
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID]);
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Product];
GO
ALTER TABLE [dbo].[SupplierDeliveries]  WITH CHECK ADD  CONSTRAINT [FK_SupplierDeliveries_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID]);
GO
ALTER TABLE [dbo].[SupplierDeliveries] CHECK CONSTRAINT [FK_SupplierDeliveries_Supplier];
GO
ALTER TABLE [dbo].[SupplierDeliveries]  WITH CHECK ADD  CONSTRAINT [FK_SupplierDeliveries_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID]);
GO
ALTER TABLE [dbo].[SupplierDeliveries] CHECK CONSTRAINT [FK_SupplierDeliveries_Material];
GO

CREATE TRIGGER [dbo].[AutoCancelOrder]
ON [dbo].[Orders]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE [dbo].[Orders]
    SET Status = 'Cancelled',
        CancellationDate = GETDATE()
    WHERE Status = 'Created'
    AND PrepaymentDate IS NULL
    AND DATEDIFF(DAY, CreateDate, GETDATE()) >= 3;
END;
GO

INSERT INTO [dbo].[AgentType] (Title, Image) VALUES
('Company', NULL),
('IndividualEntrepreneur', NULL),
('SelfEmployed', NULL);
GO

INSERT INTO [dbo].[MaterialType] (Title, DefectedPercent) VALUES
('Гранулы', 0),
('Краски', 0),
('Нитки', 0);
GO

INSERT INTO [dbo].[Supplier] (Title, INN, StartDate, QualityRating, SupplierType) VALUES
('ГаражТелекомГор', '1718185951', '2011-12-20', 36, 'МКК'),
('Компания Омск', '1878504395', '2012-09-13', 2, 'ОАО'),
('ГорМонтаж', '1564667734', '2016-12-23', 79, 'ООО'),
('Микро', '2293562756', '2019-05-27', 64, 'МКК'),
('Электро', '1755853973', '2015-06-16', 14, 'ЗАО'),
('Компания Мотор', '1429908355', '2010-12-27', 50, 'ООО'),
('Асбоцем', '1944834477', '2011-04-10', 20, 'МФО'),
('ВостокМети', '1488487851', '2012-03-13', 58, 'ООО'),
('МясКрепТеле', '2152486844', '2018-11-11', 59, 'ПАО'),
('Софт', '1036521658', '2011-11-23', 67, 'МКК'),
('Компания СервисМикроО', '1178826599', '2012-07-07', 5, 'ООО'),
('ИнфоГазМотор', '1954050214', '2011-07-23', 42, 'ОАО'),
('Монтаж', '1163880101', '2016-05-23', 10, 'ОАО'),
('ЭлектроЦвет', '1654184411', '2015-06-25', 3, 'ОАО'),
('Компания НефтьITИнф', '1685247455', '2017-03-09', 85, 'ООО'),
('ТомскНефть', '1002996016', '2015-05-07', 95, 'ООО'),
('ТомскТяжРеч', '1102143492', '2014-12-22', 36, 'МФО'),
('УралХме', '2291253256', '2015-05-22', 82, 'ООО'),
('ВодРыб', '1113468466', '2011-11-25', 21, 'ЗАО'),
('УралСервисМон', '1892306757', '2016-12-20', 26, 'МКК'),
('Казань', '1965011544', '2015-03-16', 51, 'ОАО'),
('Cиб', '1949139718', '2011-11-28', 95, 'ОАО'),
('ГаражГазМ', '1740623312', '2011-11-20', 86, 'ОАО'),
('МобайлДизайнОмск', '1014490629', '2019-10-28', 73, 'ООО'),
('ЖелДорГаз', '1255275062', '2014-09-04', 76, 'МФО'),
('ТверьБухГаз', '2167673760', '2013-11-13', 9, 'ОАО'),
('ТелекомТранс', '2200735978', '2015-01-11', 8, 'ОАО'),
('ГаражГлав', '1404774111', '2013-06-28', 89, 'МКК'),
('Компания К', '1468114280', '2018-12-07', 70, 'ПАО'),
('ТяжЛифтВостокС', '1032089879', '2012-08-13', 66, 'ОАО'),
('Компания Во', '2027005945', '2016-06-22', 11, 'ПАО'),
('МоторКаз', '1076279398', '2015-08-23', 37, 'ОАО'),
('Сервис', '2031832854', '2011-11-25', 25, 'ОАО'),
('ЮпитерТомс', '1551173338', '2011-07-28', 60, 'ПАО'),
('Мор', '1906157177', '2011-03-06', 82, 'МКК'),
('СеверТехВостокЛизинг', '1846812080', '2011-02-26', 30, 'ООО'),
('ЦементОбл', '2021607106', '2015-10-03', 42, 'ООО'),
('Компания КазаньАвтоCиб', '1371692583', '2015-10-19', 23, 'МКК'),
('ГаражХозФлот', '2164720385', '2018-08-28', 7, 'ОАО'),
('Компания МорМетал', '1947163072', '2013-11-18', 33, 'ООО'),
('ГлавРыб', '1426268088', '2018-11-09', 46, 'МФО'),
('CибCибОрио', '1988313615', '2018-01-13', 95, 'ООО'),
('ТелеРыбХм', '2299034130', '2012-02-10', 3, 'ООО'),
('ГлавАвтоГазТрест', '2059691335', '2014-08-04', 18, 'МФО'),
('ТяжКазаньБашкир', '1794419510', '2015-12-22', 85, 'ПАО'),
('Асбоцемент', '1650212184', '2018-12-09', 80, 'МФО'),
('Мотор', '1019917089', '2017-04-24', 19, 'ПАО'),
('МорФинансФинансМаш', '1549496316', '2013-06-18', 68, 'ООО'),
('РыбВектор', '2275526397', '2011-06-20', 92, 'ОАО'),
('Теле', '2170198203', '2010-05-01', 11, 'ПАО');
GO

INSERT INTO [dbo].[Material] (Title, CountInPack, Unit, CountInStock, MinCount, Description, Cost, Image, MaterialTypeID)
SELECT 
    Title,
    CountInPack,
    Unit,
    CountInStock,
    MinCount,
    NULL AS Description,
    Cost,
    CASE WHEN Image IN ('не указано', 'отсутствует', 'нет') THEN NULL ELSE Image END AS Image,
    (SELECT ID FROM [dbo].[MaterialType] WHERE Title = MaterialType) AS MaterialTypeID
FROM (VALUES
('Гранулы белый 2x2', 'Гранулы', 'не указано', 47680.00, 76, 8, 7, 'л'),
('Нить серый 1x0', 'Краски', 'не указано', 27456.00, 978, 42, 1, 'м'),
('Нить белый 1x3', 'Нитки', 'не указано', 2191.00, 406, 27, 8, 'м'),
('Нить цветной 1x1', 'Краски', '\materials\image_5.jpeg', 8619.00, 424, 10, 3, 'г'),
('Нить цветной 2x0', 'Краски', 'отсутствует', 16856.00, 395, 26, 2, 'м'),
('Краска синий 2x2', 'Краски', 'не указано', 403.00, 334, 48, 6, 'л'),
('Нить синий 0x2', 'Нитки', 'отсутствует', 7490.00, 654, 10, 9, 'м'),
('Гранулы серый 2x2', 'Гранулы', 'не указано', 15478.00, 648, 17, 7, 'л'),
('Краска синий 1x2', 'Краски', 'отсутствует', 44490.00, 640, 50, 2, 'л'),
('Нить зеленый 2x0', 'Краски', '\materials\image_10.jpeg', 28301.00, 535, 45, 5, 'м'),
('Гранулы синий 1x2', 'Гранулы', 'не указано', 9242.00, 680, 6, 3, 'кг'),
('Нить синий 3x2', 'Нитки', 'отсутствует', 10878.00, 529, 13, 1, 'м'),
('Краска белый 2x2', 'Краски', '\materials\image_3.jpeg', 29906.00, 659, 35, 1, 'л'),
('Краска зеленый 0x3', 'Краски', 'не указано', 24073.00, 50, 48, 2, 'л'),
('Нить зеленый 2x3', 'Нитки', 'отсутствует', 20057.00, 649, 25, 7, 'г'),
('Краска белый 2x1', 'Краски', 'не указано', 3353.00, 790, 8, 2, 'л'),
('Нить серый 2x3', 'Нитки', 'не указано', 22452.00, 431, 40, 1, 'г'),
('Гранулы серый 3x2', 'Гранулы', 'нет', 29943.00, 96, 9, 5, 'л'),
('Краска серый 3x2', 'Краски', 'отсутствует', 55064.00, 806, 50, 3, 'л'),
('Гранулы белый 0x3', 'Гранулы', 'нет', 7183.00, 538, 11, 3, 'кг'),
('Краска цветной 1x1', 'Краски', 'отсутствует', 43466.00, 784, 22, 3, 'л'),
('Гранулы белый 1x0', 'Гранулы', 'нет', 27718.00, 980, 41, 3, 'кг'),
('Краска серый 0x2', 'Краски', 'отсутствует', 33227.00, 679, 36, 3, 'кг'),
('Гранулы серый 3x3', 'Гранулы', 'нет', 15170.00, 2, 38, 5, 'л'),
('Краска серый 3x0', 'Краски', 'не указано', 19352.00, 341, 38, 7, 'кг'),
('Гранулы синий 2x1', 'Гранулы', '\materials\image_2.jpeg', 231.00, 273, 17, 9, 'л'),
('Гранулы синий 0x2', 'Гранулы', 'не указано', 41646.00, 576, 36, 9, 'л'),
('Нить цветной 1x0', 'Нитки', 'не указано', 24948.00, 91, 38, 5, 'г'),
('Краска зеленый 2x2', 'Краски', 'не указано', 19014.00, 752, 36, 2, 'кг'),
('Краска цветной 1x3', 'Краски', 'отсутствует', 268.00, 730, 5, 9, 'кг'),
('Краска серый 2x0', 'Краски', 'не указано', 35256.00, 131, 22, 2, 'л'),
('Нить зеленый 2x1', 'Нитки', 'не указано', 34556.00, 802, 16, 6, 'м'),
('Краска цветной 0x3', 'Краски', 'нет', 3322.00, 324, 9, 10, 'л'),
('Нить белый 2x3', 'Нитки', 'не указано', 10823.00, 283, 41, 3, 'г'),
('Гранулы синий 3x0', 'Гранулы', 'не указано', 16665.00, 411, 8, 1, 'кг'),
('Гранулы синий 1x3', 'Гранулы', 'нет', 5668.00, 41, 30, 8, 'л'),
('Нить цветной 2x1', 'Краски', 'нет', 7615.00, 150, 22, 3, 'м'),
('Гранулы серый 3x0', 'Гранулы', '\materials\image_7.jpeg', 702.00, 0, 5, 4, 'л'),
('Краска синий 3x0', 'Краски', 'нет', 38644.00, 523, 42, 7, 'л'),
('Нить зеленый 0x0', 'Краски', 'не указано', 41827.00, 288, 43, 8, 'м'),
('Гранулы белый 1x2', 'Гранулы', 'нет', 8129.00, 77, 46, 4, 'л'),
('Краска белый 3x0', 'Краски', 'нет', 51471.00, 609, 48, 5, 'кг'),
('Краска цветной 0x1', 'Краски', 'отсутствует', 54401.00, 43, 8, 6, 'л'),
('Нить серый 1x1', 'Нитки', 'отсутствует', 14474.00, 372, 22, 5, 'м'),
('Краска синий 2x1', 'Краски', 'нет', 46848.00, 642, 29, 9, 'л'),
('Нить серый 3x0', 'Нитки', 'отсутствует', 29503.00, 409, 19, 1, 'м'),
('Краска зеленый 3x3', 'Краски', 'отсутствует', 27710.00, 601, 32, 6, 'л'),
('Краска синий 2x0', 'Краски', 'отсутствует', 40074.00, 135, 50, 7, 'л'),
('Гранулы синий 2x3', 'Гранулы', 'не указано', 53482.00, 749, 45, 2, 'л'),
('Нить синий 0x3', 'Краски', 'не указано', 32087.00, 615, 22, 8, 'м'),
('Нить синий 3x3', 'Нитки', 'отсутствует', 45774.00, 140, 12, 7, 'г'),
('Краска зеленый 2x3', 'Краски', 'нет', 44978.00, 485, 8, 2, 'л'),
('Нить синий 3x0', 'Нитки', 'отсутствует', 44407.00, 67, 23, 10, 'м'),
('Гранулы серый 2x1', 'Гранулы', 'нет', 50339.00, 779, 44, 7, 'кг'),
('Краска зеленый 0x1', 'Краски', 'нет', 30581.00, 869, 7, 2, 'л'),
('Краска синий 0x0', 'Краски', 'не указано', 18656.00, 796, 29, 8, 'кг'),
('Краска серый 2x1', 'Краски', 'отсутствует', 46579.00, 706, 45, 5, 'л'),
('Нить белый 0x1', 'Нитки', 'не указано', 36883.00, 101, 43, 10, 'м'),
('Гранулы зеленый 1x2', 'Гранулы', 'нет', 45083.00, 575, 15, 9, 'л'),
('Краска серый 0x1', 'Краски', 'не указано', 35063.00, 768, 27, 2, 'л'),
('Гранулы цветной 0x1', 'Гранулы', 'нет', 24488.00, 746, 50, 3, 'л'),
('Гранулы белый 3x1', 'Гранулы', 'отсутствует', 43711.00, 995, 27, 8, 'л'),
('Нить зеленый 0x2', 'Нитки', 'отсутствует', 17429.00, 578, 20, 2, 'м'),
('Гранулы зеленый 0x2', 'Гранулы', 'нет', 38217.00, 206, 34, 4, 'л'),
('Краска цветной 1x2', 'Краски', 'не указано', 47701.00, 299, 50, 10, 'л'),
('Краска зеленый 1x0', 'Краски', 'нет', 52189.00, 626, 17, 8, 'кг'),
('Гранулы серый 0x0', 'Гранулы', 'не указано', 16715.00, 608, 12, 5, 'л'),
('Гранулы синий 0x3', 'Гранулы', 'отсутствует', 45134.00, 953, 48, 5, 'кг'),
('Краска цветной 2x1', 'Краски', 'не указано', 1846.00, 325, 45, 1, 'л'),
('Нить синий 2x3', 'Краски', 'отсутствует', 43659.00, 10, 21, 5, 'м'),
('Нить синий 2x1', 'Краски', 'не указано', 12283.00, 948, 13, 9, 'г'),
('Гранулы белый 1x1', 'Гранулы', 'отсутствует', 6557.00, 93, 11, 4, 'л'),
('Краска синий 1x3', 'Краски', 'отсутствует', 38230.00, 265, 17, 6, 'кг'),
('Краска зеленый 3x0', 'Краски', '\materials\image_1.jpeg', 20226.00, 261, 7, 2, 'л'),
('Нить зеленый 1x0', 'Нитки', 'не указано', 8105.00, 304, 43, 9, 'г'),
('Краска цветной 0x2', 'Краски', 'нет', 2600.00, 595, 38, 7, 'л'),
('Нить синий 3x1', 'Краски', 'нет', 4920.00, 579, 48, 7, 'м'),
('Краска зеленый 0x2', 'Краски', 'отсутствует', 39809.00, 139, 23, 9, 'л'),
('Краска синий 3x3', 'Краски', 'нет', 46545.00, 740, 24, 6, 'кг'),
('Краска зеленый 1x1', 'Краски', '\materials\image_6.jpeg', 40583.00, 103, 34, 2, 'кг'),
('Краска цветной 2x3', 'Краски', 'не указано', 46502.00, 443, 46, 9, 'л'),
('Нить цветной 3x0', 'Нитки', 'отсутствует', 53651.00, 989, 14, 1, 'м'),
('Гранулы серый 2x3', 'Гранулы', 'не указано', 47757.00, 467, 28, 6, 'л'),
('Краска белый 1x0', 'Краски', 'нет', 3543.00, 95, 6, 6, 'л'),
('Гранулы серый 3x1', 'Гранулы', 'не указано', 10899.00, 762, 6, 10, 'кг'),
('Гранулы серый 2x0', 'Гранулы', '\materials\image_8.jpeg', 8939.00, 312, 21, 3, 'кг'),
('Нить белый 0x2', 'Нитки', 'отсутствует', 29271.00, 43, 19, 4, 'г'),
('Гранулы зеленый 1x1', 'Гранулы', '\materials\image_4.jpeg', 46455.00, 10, 19, 4, 'л'),
('Нить серый 0x2', 'Краски', '\materials\image_9.jpeg', 45744.00, 504, 10, 3, 'м'),
('Гранулы белый 0x2', 'Гранулы', 'нет', 9330.00, 581, 40, 2, 'л'),
('Нить цветной 3x2', 'Нитки', 'отсутствует', 2939.00, 831, 46, 3, 'м'),
('Гранулы белый 3x0', 'Гранулы', 'не указано', 50217.00, 208, 7, 6, 'л'),
('Нить серый 1x2', 'Нитки', 'нет', 30198.00, 292, 30, 1, 'м'),
('Краска белый 0x1', 'Краски', 'отсутствует', 19777.00, 423, 47, 7, 'л'),
('Гранулы цветной 0x3', 'Гранулы', 'нет', 1209.00, 723, 44, 7, 'кг'),
('Нить серый 1x3', 'Краски', 'отсутствует', 32002.00, 489, 25, 1, 'г'),
('Гранулы белый 2x3', 'Гранулы', 'нет', 32446.00, 274, 8, 4, 'л'),
('Краска зеленый 3x1', 'Краски', 'отсутствует', 32487.00, 657, 19, 10, 'л'),
('Гранулы цветной 3x2', 'Гранулы', 'нет', 28596.00, 32, 45, 1, 'л'),
('Нить белый 2x0', 'Краски', 'отсутствует', 46684.00, 623, 23, 2, 'м')
) AS Source (Title, MaterialType, Image, Cost, CountInStock, MinCount, CountInPack, Unit);
GO

INSERT INTO [dbo].[MaterialSupplier] (MaterialID, SupplierID)
SELECT 
    m.ID AS MaterialID,
    s.ID AS SupplierID
FROM (VALUES
('Нить серый 1x2', 'Электро'),
('Краска цветной 2x1', 'ЮпитерТомс'),
('Нить серый 1x0', 'МясКрепТеле'),
('Краска цветной 2x1', 'МоторКаз'),
('Краска белый 2x2', 'Софт'),
('Нить серый 1x3', 'Монтаж'),
('Гранулы цветной 3x2', 'ГлавРыб'),
('Нить серый 1x2', 'ГлавРыб'),
('Краска цветной 2x1', 'Компания КазаньАвтоCиб'),
('Краска белый 2x2', 'ТелекомТранс'),
('Краска цветной 2x1', 'CибCибОрио'),
('Нить серый 1x0', 'УралСервисМон'),
('Нить серый 1x0', 'ТомскТяжРеч'),
('Краска цветной 2x1', 'УралСервисМон'),
('Нить серый 1x3', 'ВостокМети'),
('Краска белый 2x2', 'УралСервисМон'),
('Краска зеленый 3x0', 'Компания К'),
('Нить цветной 2x0', 'ИнфоГазМотор'),
('Краска зеленый 3x0', 'ГаражГлав'),
('Нить цветной 2x0', 'ТомскНефть'),
('Краска зеленый 3x0', 'Компания КазаньАвтоCиб'),
('Гранулы белый 0x2', 'ВодРыб'),
('Краска зеленый 3x0', 'МоторКаз'),
('Краска зеленый 1x1', 'ГаражТелекомГор'),
('Гранулы белый 0x2', 'Компания Мотор'),
('Краска зеленый 2x3', 'Сервис'),
('Нить цветной 2x0', 'ЮпитерТомс'),
('Гранулы белый 0x2', 'ГлавАвтоГазТрест'),
('Гранулы белый 0x2', 'Асбоцемент'),
('Краска зеленый 3x0', 'МорФинансФинансМаш'),
('Краска зеленый 1x1', 'РыбВектор'),
('Гранулы цветной 0x1', 'Компания Во'),
('Нить цветной 2x1', 'ТяжЛифтВостокС'),
('Нить цветной 1x1', 'УралХме'),
('Гранулы серый 2x0', 'Cиб'),
('Гранулы серый 2x0', 'ИнфоГазМотор'),
('Краска цветной 1x1', 'CибCибОрио'),
('Краска цветной 1x1', 'ТелекомТранс'),
('Гранулы белый 0x3', 'Cиб'),
('Краска цветной 1x1', 'ВодРыб'),
('Нить цветной 2x1', 'Асбоцемент'),
('Гранулы зеленый 0x2', 'УралХме'),
('Гранулы зеленый 1x1', 'Софт'),
('Гранулы зеленый 0x2', 'УралСервисМон'),
('Гранулы белый 1x2', 'Микро'),
('Гранулы зеленый 0x2', 'Электро'),
('Гранулы зеленый 0x2', 'Компания КазаньАвтоCиб'),
('Гранулы белый 1x2', 'ТяжЛифтВостокС'),
('Гранулы зеленый 1x1', 'Компания МорМетал'),
('Гранулы зеленый 0x2', 'Компания СервисМикроО'),
('Гранулы зеленый 0x2', 'Софт'),
('Гранулы зеленый 0x2', 'ГлавАвтоГазТрест'),
('Гранулы серый 0x0', 'ГорМонтаж'),
('Гранулы серый 0x0', 'Микро'),
('Гранулы серый 3x3', 'Компания Мотор'),
('Нить зеленый 2x0', 'МобайлДизайнОмск'),
('Краска серый 2x1', 'ВостокМети'),
('Нить зеленый 2x0', 'Компания Во'),
('Гранулы серый 0x0', 'МоторКаз'),
('Нить зеленый 2x0', 'ЮпитерТомс'),
('Гранулы серый 3x3', 'РыбВектор'),
('Краска белый 3x0', 'ИнфоГазМотор'),
('Краска синий 1x3', 'Компания КазаньАвтоCиб'),
('Краска синий 2x2', 'Микро'),
('Краска синий 1x3', 'ГаражГлав'),
('Краска синий 1x3', 'ТяжКазаньБашкир'),
('Гранулы серый 2x3', 'Мор'),
('Краска синий 2x2', 'МоторКаз'),
('Гранулы серый 2x3', 'ВодРыб'),
('Краска синий 2x2', 'Монтаж'),
('Гранулы серый 2x3', 'ГаражТелекомГор'),
('Нить синий 3x1', 'РыбВектор'),
('Краска цветной 0x2', 'Компания КазаньАвтоCиб'),
('Гранулы серый 2x1', 'Компания Мотор'),
('Краска цветной 0x2', 'Асбоцем'),
('Нить зеленый 2x3', 'Асбоцем'),
('Краска серый 3x0', 'СеверТехВостокЛизинг'),
('Нить зеленый 2x3', 'ИнфоГазМотор'),
('Гранулы серый 2x1', 'Компания НефтьITИнф'),
('Нить зеленый 0x0', 'ИнфоГазМотор'),
('Гранулы синий 1x3', 'Компания СервисМикроО'),
('Нить белый 1x3', 'Cиб'),
('Нить зеленый 0x0', 'ВостокМети'),
('Нить зеленый 0x0', 'Микро'),
('Гранулы синий 1x3', 'ГлавРыб'),
('Нить синий 2x1', 'ТомскНефть'),
('Краска цветной 1x3', 'Компания КазаньАвтоCиб'),
('Нить синий 2x1', 'ГаражХозФлот'),
('Краска цветной 1x3', 'Компания СервисМикроО'),
('Краска цветной 1x3', 'МясКрепТеле'),
('Нить синий 2x1', 'МоторКаз'),
('Гранулы синий 2x1', 'УралХме'),
('Нить синий 2x1', 'Компания КазаньАвтоCиб'),
('Нить белый 0x1', 'Компания КазаньАвтоCиб'),
('Нить белый 0x1', 'ГаражХозФлот'),
('Краска цветной 1x2', 'ЭлектроЦвет'),
('Гранулы серый 3x1', 'CибCибОрио'),
('Гранулы серый 3x1', 'Мор'),
('Гранулы серый 3x1', 'УралСервисМон'),
('Гранулы серый 3x1', 'МоторКаз')
) AS Source (MaterialTitle, SupplierTitle)
JOIN [dbo].[Material] m ON m.Title = Source.MaterialTitle
JOIN [dbo].[Supplier] s ON s.Title = Source.SupplierTitle;
GO

SELECT * FROM [dbo].[AgentType]
SELECT * FROM [dbo].[Agent]
SELECT * FROM [dbo].[AgentPriorityHistory]
SELECT * FROM [dbo].[Shop]
SELECT * FROM [dbo].[MaterialType]
SELECT * FROM [dbo].[Material]
SELECT * FROM [dbo].[MaterialCountHistory]
SELECT * FROM [dbo].[Supplier]
SELECT * FROM [dbo].[MaterialSupplier]
SELECT * FROM [dbo].[ProductType]
SELECT * FROM [dbo].[Product]
SELECT * FROM [dbo].[ProductCostHistory]
SELECT * FROM [dbo].[ProductMaterial]
SELECT * FROM [dbo].[ProductSale]
SELECT * FROM [dbo].[Employees]
SELECT * FROM [dbo].[EmployeeMovements]
SELECT * FROM [dbo].[EmployeeAttendance]
SELECT * FROM [dbo].[Orders]
SELECT * FROM [dbo].[OrderItems]
SELECT * FROM [dbo].[SupplierDeliveries]
