-- Nonclustered index to retrieve given acenterLocation  
create nonclustered index IX__SegCenter_CenterLocation
on dbo.SegCenter (CenterLocation)
include ([CenterID],[TotalWaste])
go

select *from SegCenter where CenterLocation='Popova'


-- composite nonclustered index to retrieve data given company state and companyname
create nonclustered index IX_Company_CompanyState_CompanyName
on dbo.Company (CompanyState asc,CompanyName desc)
include ([CompanyID],[CompanyCity])
go

select *from Company where CompanyState='NY' and CompanyName='ABC Inc.'

-- create nonclustered index for driver's phone number as it is used more often
create nonclustered index IX_Driver_DriverPhoneNumber
on dbo.Driver (DriverPhoneNumber)
include ([DriverID],[DriverFirstName],[DriverLastName])
go

select *from Driver where DriverPhoneNumber='1234567890'  


select *from Bin