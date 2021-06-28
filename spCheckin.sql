Create procedure sp_Checkin
	(
	@pLongitude Float,
	@pLatitude Float,
	@pEmail varchar(60),
	@pHabitTitle varchar(60),
	@pFecha datetime
	)
	as
	begin
	Declare @userId bigint
	Declare @habitId int
	DECLARE @location geography
	Set  @userId = (Select UserId from dbo.Users where @pEmail=Email)
	Set  @habitId = (Select HabitId from dbo.Habits where @pHabitTitle=Title)

	Set  @location = geography::Point(@pLatitude, @pLongitude, 4326)
	Insert into dbo.HabitsPraticedbyUsers(UserId, HabitId, Date, Location, IpAdress, ComputerName, Checksum) Values (@userId, @habitId, @pFecha, @location, Convert(varbinary,'172.0.0.1'), 'Some computer', Convert(varbinary,'checksum'+Convert(varchar,@userId)))
	
END
EXEC sp_Checkin 10.29496224052007, -84.48524001735488, 'Estudiantec@itcr.cr109',  'No uso pajilla', '2021-06-25 12:28:36.237'
Select * from HabitsPraticedbyUsers
Drop procedure if exists sp_Checkin
Create procedure testsp
	
	as
	begin
	Insert into dbo.LogTypes (Name) Values ('Test1')
	
END

Exec testsp	
Use ChageitDB
Select * from dbo.LogTypes
Delete from dbo.LogTypes where Name=Name

Select Getdate()

2021-06-24 22:35:40.527