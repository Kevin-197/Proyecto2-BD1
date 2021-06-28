Use ChageitDB
Drop procedure if exists sp_GenerateAds
Create procedure sp_GenerateAds
	(
	@pTitle varchar(100),
	@pStartDate datetime,
	@pTitleC varchar(50)
	)
	as
	begin

	SET NOCOUNT ON
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT
	
	Declare @CampañaId bigint
	Declare @habitId int
	Declare @Sponsors int

	Set  @habitId = (Select HabitId from dbo.Habits where @pTitle=Title)
	Set  @CampañaId= (Select CampañaId from dbo.Campañas where @pTitleC=Name)
	Set  @Sponsors = (Select count(HabitSbUId) from dbo.HabitsSponsoredbyUsers WHERE Date BETWEEN @pStartDate AND GETDATE() )
	

	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001


		if @Sponsors >= 1 begin
			insert into dbo.Ads (AdRefId,AdURL,CampañaId, ActionURL, ComputerName, IpAdress, Checksum,HabitId)
			Values (floor(999999*rand()), CONVERT(VARCHAR,floor(999999*rand())),@CampañaId, CONVERT(VARCHAR,floor(999999*rand())), 'Computadora', Convert(varbinary,'1234453'), HASHBYTES('MD5', convert(nvarchar,@CampañaId+@habitId+6)), @habitId)
        end

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
select GETDATE()2021-06-28 14:55:44.167
EXEC sp_GenerateAds 'Reciclo','2021-06-25 00:00:00.000', 'Campaña1'
select * from HabitsSponsoredbyUsers
select * from LocationsxHabit
select * from PaymentAttempts
select * from Ads