Drop procedure if exists sp_Sponsor
Use ChageitDB
Create procedure sp_Sponsor
	(@pEmail varchar(124),
	@pExp datetime,
	@pTitle varchar(100),
	@pLatitude decimal(18,14),
	@pLongitude decimal(18,14),
	@pAmount Money,
	@pRadio float
	)
	as
	begin

	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	Declare @locid int
	DECLARE @existentloc BIT
	DECLARE @punto geography;
	
	Declare @userId bigint
	
	Declare @habitId int
	Set  @existentloc =1;
	Set  @habitId = (Select HabitId from dbo.Habits where @pTitle=Title)
	SET @punto = geography::Point(9.938170343080436, -84.10527301683693, 4326)
	Set  @userId = (Select UserId from dbo.Users where @pEmail=Email)
	Set  @locid = (Select LocationId from dbo.Locations loc where loc.Location.ToString()= 'POINT ('+convert(nvarchar(20), @pLongitude)+' '+ convert(nvarchar(20), @pLatitude) +')')

	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001


		insert into PaymentAttempts(Posttime, Amount, CurrencySymbol, ReferenceNumber, MerchantTransNumber, Description, ComputerName, UserName, IpAdress, Checksum, UserId, PaymentStatusId, HabitId) Values (GETDATE(), @pAmount, 'USD', floor(999999*rand()), floor(999999*rand()), @pTitle +' sponsored', 'Some computer'+CONVERT(VARCHAR,floor(999999*rand())) , 'Some User'+CONVERT(VARCHAR,floor(999999*rand())), Convert(varbinary,'172.0.0.1'),CONVERT(varbinary, HashBytes('MD5', CONVERT(VARCHAR,@userId))), @userId,1,@habitId )	
		
		insert into Transactions( Amount, Description, Checksum, ComputerName, IpAdress, TransTypeId, TransSubTypeId) Values (@pAmount, @pTitle +' sponsored',CONVERT(varbinary, HashBytes('MD5', CONVERT(VARCHAR,@userId))), 'Some computer'+CONVERT(VARCHAR,floor(999999*rand())) , Convert(varbinary,'172.0.0.1'), 1, 2)	
		insert into HabitsSponsoredbyUsers (UserId, HabitId, Amount, radio, ExpDate, LocationId) Values (@userId, @habitId, @pAmount, @pRadio, @pExp, @locid)	
		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
	

END
EXEC sp_Sponsor '2021-06-25 12:28:36.237', 'Estudiantec@itcr.cr109'