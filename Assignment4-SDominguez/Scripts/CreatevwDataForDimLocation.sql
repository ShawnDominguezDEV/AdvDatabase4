-- View to extract DimLocation data from DB for transport to DW
use [DWTaxiService-sdd65]

go
Create View vwDataForDimLocation
as
SELECT 
	[CityKey] = [DimCity].[CityKey],
	[StreetId] = [Street_Code],
	[Street] = [StreetName]
FROM ([TaxiServiceDB-sdd65].[dbo].[Street] INNER JOIN DimCity
ON [TaxiServiceDB-sdd65].[dbo].[Street].[City_Code] = DimCity.CityId)



