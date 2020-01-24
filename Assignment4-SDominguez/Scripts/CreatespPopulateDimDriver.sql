--Stored Procedure spPopulateDimDriver to populate DimDriver table

use [DWTaxiService-sdd65]
go

CREATE PROCEDURE spPopulateDimDriver
AS
BEGIN
INSERT INTO dbo.DimDriver
(
	[DriverId],
	[DriverName]
)
(
	SELECT
		[DriverId]  =  CAST ( [Driver_Id] AS nchar(8) ),
		[DriverName] = CAST ( isNull(RTRIM([FirstName]) + ' ' + RTrim([LastName]), 'Unknown' ) as nvarchar(50) )		
	FROM [TaxiServiceDB-sdd65].[dbo].[Driver]
)
END
