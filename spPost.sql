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
	Insert into dbo.Posts(UserId, PracticeStart, PracticeEnd, PostURL, ActionURL, IpAdress,  ComputerName, Checksum) Values (@userId, DATEADD(DAY, -14, @pTimespan), @pTimespan, Concat('www.',@Socialmedia,'.com/post/', +CONVERT(VARCHAR,floor(999999*rand()))),Concat('www.',@Socialmedia,'.com/action/', +CONVERT(VARCHAR,floor(999999*rand()))), Convert(varbinary,'172.0.0.1'), 'Some computer', Convert(varbinary,'checksum'+Convert(varchar,@userId)))
	
END
EXEC sp_Post '2021-06-25 2013:20:26.203', 'Estudiantec@itcr.cr109'
Select * from Posts

Select GETDATE()