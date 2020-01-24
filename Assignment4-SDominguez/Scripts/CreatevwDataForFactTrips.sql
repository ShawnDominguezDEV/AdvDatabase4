--View for FactTrips
use[DWTaxiService-sdd65]

go
CREATE VIEW vwDataForFactTrips
as
SELECT
	[TripNumber] = CAST ([number] AS nchar(50)),
	[DateKey] = [DimDates].[DateKey],
	[LocationKey] = [DimLocation].[LocationKey],
	[DriverKey] = [DimDriver].[DriverKey],
	[TripMileage] = CAST(isNull([milage], -1) AS decimal(18,4)),
	[TripCharge] = CAST (isNull([charge], -1) AS decimal(18,4))
FROM
	((([TaxiServiceDB-sdd65].[dbo].[Trip] INNER JOIN DimLocation ON [TaxiServiceDB-sdd65].[dbo].[Trip].[Street_Code] = DimLocation.StreetId)
	Inner Join DimDriver on DimDriver.DriverID = [TaxiServiceDB-sdd65].[dbo].[Trip].[Driver_Id])
	Inner Join DimDates on DimDates.[Date] = [TaxiServiceDB-sdd65].[dbo].[Trip].[Date])

