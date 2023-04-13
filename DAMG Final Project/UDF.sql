-- UDF to get total waste by centerID 
use WasteManagement1
CREATE FUNCTION dbo.GetTotalWasteByCenterID (@CenterID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalWaste DECIMAL(10,2)
    SELECT @TotalWaste = SUM(GarbageWeight)
    FROM Serviced s
    JOIN Bin b ON s.BinID = b.BinID
    JOIN SegCenter c ON b.CustomerID = c.CompanyID
    WHERE c.CenterID = @CenterID
    RETURN @TotalWaste
END

select * from SegCenter
select * from Serviced

ALTER TABLE SegCenter
ADD TotalWaste AS dbo.GetTotalWasteByCenterID(CenterID)


SELECT dbo.GetTotalWasteByCenterID(5) AS TotalWaste

