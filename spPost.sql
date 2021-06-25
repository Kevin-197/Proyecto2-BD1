Drop procedure if exists sp_Post
Create procedure sp_Post
	(@pTimespan Datetime,
	@pEmail varchar(60)
	)
	as
	begin
	Declare @userId bigint
	Declare @weeksago int
	Declare @Socialmedia varchar(100)
	Set  @userId = (Select UserId from dbo.Users where @pEmail=Email)
	Set @Socialmedia = (Select social.Name from dbo.Auth_Providers social INNER JOIN dbo.UsersxProviders rel on rel.AuthProviderId = social.AuthProviderId Inner Join dbo.Users usu on usu.UserId =  rel.UserId Where rel.UserId = @userId and rel.PorDefecto = 1)
	Insert into dbo.Posts(UserId, PracticeStart, PracticeEnd, PostURL, ActionURL) Values (@userId, DATEADD(DAY, -14, @pTimespan), @pTimespan, Concat('www.',@Socialmedia,'.com/post/', +CONVERT(VARCHAR,floor(999999*rand()))),Concat('www.',@Socialmedia,'.com/action/', +CONVERT(VARCHAR,floor(999999*rand()))))
	
END
EXEC sp_Post 11000, 52,514, 'Another Computer', 'UsEr','20.20.20.20','Gorillaz_125011', 'Visa'