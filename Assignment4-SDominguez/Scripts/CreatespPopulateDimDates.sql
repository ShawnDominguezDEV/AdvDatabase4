--spPopulateDimDates to pop DimDates table with provided start/end dates

CREATE PROCEDURE spPopulateDimDates @StartDate datetime, @EndDate datetime
AS
BEGIN


Declare @DateInProcess datetime	--Loop Counter

Set @DateInProcess = @StartDate

WHILE @DateInProcess <= @EndDate
BEGIN
INSERT INTO DimDates
(
	[Date],
	[DateName],
	[Month],
	[MonthName],
	[Year],
	[YearName]
)
VALUES
(
	@DateInProcess,
	DateName ( weekday, @DateInProcess ),
	Month( @DateInProcess ),  
	DateName( month, @DateInProcess ),
	Year( @DateInProcess ),
	Cast( Year(@DateInProcess ) as nVarchar(50) )
)
Set @DateInProcess = DateAdd(d, 1, @DateInProcess)
END

Set Identity_Insert [DWTaxiService-sdd65].[dbo].[DimDates] On
Insert Into [DWTaxiService-sdd65].[dbo].[DimDates] 
  ( 
	[DateKey],
	[Date],
	[DateName],
	[Month],
	[MonthName],
	[Year], 
	[YearName] 
  )
  (
	Select 
    [DateKey] = -1, 
	[Date] =  Cast('01/01/1900' as nVarchar(50) ),
	[DateName] = Cast('Unknown Day' as nVarchar(50) ),
	[Month] = -1, 
	[MonthName] = Cast('Unknown Month' as nVarchar(50) ),
	[Year] = -1,
	[YearName] = Cast('Unknown Year' as nVarchar(50) )
)
Insert Into [DWTaxiService-sdd65].[dbo].[DimDates] 
  ( 
	[DateKey],
	[Date],
	[DateName],
	[Month],
	[MonthName],
	[Year], 
	[YearName] 
  )
  (
    Select 
    [DateKey] = -2
  , [Date] = Cast('01/01/1900' as nVarchar(50) )
  , [DateName] = Cast('Corrupt Day' as nVarchar(50) )
  , [Month] = -2
  , [MonthName] = Cast('Corrupt Month' as nVarchar(50) )
  , [Year] = -2
  , [YearName] = Cast('Corrupt Year' as nVarchar(50) )
  )

Set Identity_Insert [DWTaxiService-sdd65].[dbo].[DimDates] OFF

END
