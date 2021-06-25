Drop procedure if exists sp_Checkin
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
	Set  @habitId = (Select HabitId from dbo.Jugadores where @pHabitTitle=Title)

	Set  @location = geography::Point(@pLatitude, @pLongitude, 4326)
	Insert into dbo.HabitsPraticedbyUsers(UserId, HabitId, Date, Location) Values (@userId, @habitId, @pFecha, @location)
	
END
EXEC sp_Checkin 11000, 52,514, 'Another Computer', 'UsEr','20.20.20.20','Gorillaz_125011', 'Visa'


Create procedure testsp
	
	as
	begin
	Insert into dbo.LogTypes (Name) Values ('Test1')
	
END

Exec testsp	
Use ChageitDB
Select * from dbo.LogTypes

Select Getdate()

2021-06-24 22:35:40.527