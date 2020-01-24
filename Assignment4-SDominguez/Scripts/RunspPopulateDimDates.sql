--Query to test spPopulateDimDates

EXEC spPopulateDimDates @StartDate = '1/1/2010', @EndDate = '12/31/2020'

SELECT * FROM DimDates