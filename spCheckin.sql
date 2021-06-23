Drop procedure if exists sp_Checkin
Create procedure sp_Checkin
	(
	@pLongitude Long,
	@pLatitude Long,
	@pEmail varchar(60),
	@pHabitTitle varchar(60)
	)
	as
	begin
	Declare @userId bigint
	Declare @habitId int
	DECLARE @location geography
	Set  @userId = (Select UserId from dbo.Users where @pEmail=Email)
	Set  @habitId = (Select HabitId from dbo.Jugadores where @pHabitTitle=Title)

	Set  @location = geography::Point(@pLatitude, @pLongitude, 4326)
	Insert into dbo.HabitsPraticedbyUsers(UserId, HabitId, Date, Location) Values (@userId, @habitId, GETDATE(), @location)
	
END
EXEC sp_Checkin 11000, 52,514, 'Another Computer', 'UsEr','20.20.20.20','Gorillaz_125011', 'Visa'