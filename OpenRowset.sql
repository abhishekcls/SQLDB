CREATE TABLE [SalesTaxRate](
	[SalesTaxRateID] [int] NOT NULL PRIMARY KEY,
	[StateProvinceID] [int] NOT NULL,
	[TaxType] [tinyint] NOT NULL,
	[TaxRate] [smallmoney] NOT NULL CONSTRAINT [DF_SalesTaxRate_TaxRate]  DEFAULT ((0.00)),
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SalesTaxRate_rowguid]  DEFAULT (newid()),
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesTaxRate_ModifiedDate]  DEFAULT (getdate()),
 );
GO

INSERT INTO SalestaxRate
SELECT * FROM OPENROWSET (BULK 'C:\Program Files\Microsoft Learning\20462\Allfiles\Demofiles\Mod06\SalesTaxRate.csv',
FORMATFILE = 'C:\Program Files\Microsoft Learning\20462\Allfiles\Demofiles\Mod06\TaxRateFmt.xml') AS rows;


select * from [SalesTaxRate]