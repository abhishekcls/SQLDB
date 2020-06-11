CREATE TABLE [Currency](
	[CurrencyCode] [nchar](3) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Currency_ModifiedDate] DEFAULT (getdate()) 
	);
GO

BULK INSERT Currency
FROM 'c:\data\Currency.csv'
WITH 
      (
         FIELDTERMINATOR =',',
         ROWTERMINATOR ='\n'
      );


select * from currency

--Another Example

CREATE TABLE ExchangeRate
( ExchangeRateID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
  CurrencyCode char(3) NOT NULL,
  ExchangeRate decimal(18, 5) NOT NULL,
  ConversionDate datetime NOT NULL,
);

BULK INSERT ExchangeRate
FROM 'C:\Program Files\Microsoft Learning\20462\Allfiles\Demofiles\Mod06\ExchangeRates.csv' 
WITH ( FORMATFILE='C:\Program Files\Microsoft Learning\20462\Allfiles\Demofiles\Mod06\ExchangeRates.xml',
       BATCHSIZE=10000,
       FIRSTROW=2
     );
GO

select * from ExchangeRate
