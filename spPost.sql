Drop procedure if exists sp_Post
Create procedure sp_Post
	(@pTimespan INT,
	@pEmail varchar(60)
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
EXEC sp_Post 11000, 52,514, 'Another Computer', 'UsEr','20.20.20.20','Gorillaz_125011', 'Visa'