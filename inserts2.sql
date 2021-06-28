Use ChageitDB

Insert into Severity(Name) Values ('Info')
Insert into Severity(Name) Values ('Error')
Insert into Severity(Name) Values ('Warning')

Insert into EntityTypes(Name) Values ('User')
Insert into EntityTypes(Name) Values ('Invoice')

Insert into AppSources(Name) Values ('App')
Insert into AppSources(Name) Values ('Server')

Insert into LogTypes(Name) Values ('Habit Checkin')
Insert into LogTypes(Name) Values ('Habit Sponsored')
Insert into LogTypes(Name) Values ('Post posted')
Insert into LogTypes(Name) Values ('Ad sponsored')

Select * from LogTypes
Delete from dbo.LogTypes where Name=Name
-- Transtypes
INSERT INTO TransType(Name) VALUES('Credit')
INSERT INTO TransType(Name) VALUES('Debit')
INSERT INTO TransType(Name) VALUES('Game Points')

-- Transubtypes para pruebas
INSERT INTO TransSubType(Name) VALUES('Ad sposnsored')
INSERT INTO TransSubType(Name) VALUES('Habit Sponsored')
INSERT INTO TransSubType(Name) VALUES('Sponsor Boost')


-- Merchants
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Paypal','https://www.paypal.com/',1,'https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-0.png')
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Google Pay','https://pay.google.com/",1,"https://www.gstatic.com/pay/images/logo_3x_v1.png')
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Apple Pay','https://www.apple.com/apple-pay/',1,'https://logodownload.org/wp-content/uploads/2019/09/apple-pay-logo-0.png')

-- PaymentStatuses para pruebas
INSERT INTO PaymentStatuses(Name) VALUES('Accepted')
INSERT INTO PaymentStatuses(Name) VALUES('Rejected')
INSERT INTO PaymentStatuses(Name) VALUES('Invalid')
INSERT INTO PaymentStatuses(Name) VALUES('Communication Error')

INSERT INTO auth_providers(Name) values ('Facebook'), ('Twitter'), ('Tumblr'), ('Instagram')
Select * from auth_providers

INSERT INTO Interactions(Name) VALUES('Like'),
('Me divierte'),
('Me entristece'),
('Me Asombra'),
('Me Enoja'),
('Me Encanta'),
('Me Importa'),
('Retweet'),
('Share'),
('Comment'),
('Reblog')


INSERT INTO Benefits(Name, Description) values ('Tigres salvados', 'Thanks for helping the enviornment'), ('Cachalotes salvados', 'Thanks for helping the enviornment'),
('Tigres marinos salvados', 'Thanks for helping the enviornment'),
('Hectareas forestales salvadas', 'Thanks for helping the enviornment'),
('Litros de agua ahorrados', 'Thanks for helping the enviornment'),
('Kilometros cuadrados de suelo sanados', 'Thanks for helping the enviornment'),
('Santuarios de aves salvados', 'Thanks for helping the enviornment'),
('Volumen de emisiones de gas mitigados', 'Thanks for helping the enviornment'),
('Osos pandas salvados', 'Thanks for helping the enviornment'),
('Gorilas de monta�a protegidos', 'Thanks for helping the enviornment'),
('Volumen de oxigeno salvado', 'Thanks for helping the enviornment'),
('Pandas rojos salvados', 'Thanks for helping the enviornment')


INSERT INTO Habits(Title, Description, ActionUrl, HabitURL) values ('No uso pajilla', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Llevo bolsa de tela al super', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Reciclo', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Cerro la llave del tubo', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Lavo con balde el carro', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Se ba�o con agua de lluvia', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('No uso aire acondicionado', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('No uso calefaccion', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Recogio basura de la calle', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand()))),
('Se ba�o con agua fria', 'Good Job','action.com/'+CONVERT(VARCHAR,floor(999999*rand())), 'habit.com/'+CONVERT(VARCHAR,floor(999999*rand())))


INSERT INTO UTMTags(Name) VALUES('Tag1'),
('Tag2'),
('Tag3'),
('Tag4'),
('Tag5'),
('Tag6'),
('Tag7'),
('Tag8'),
('Tag9'),
('Tag0'),
('Tag10')

Select floor(99*rand())+1

Declare @count int
Set  @count = 1
WHILE (SELECT COUNT(*) FROM Habits) >= @count
BEGIN  
   Insert into BenefitsxHabit (BenefitId, HabitId, Value, Measurement) Values (@count, @count, floor(99*rand())+1, 'm2'),(@count+1, @count, floor(99*rand())+1, 'm3'),(@count+2, @count, floor(99*rand())+1, 'units')
	Set @count = @count+1;
END 


Declare @countPictures int
Set  @countPictures = 1
WHILE (SELECT COUNT(*) FROM Habits) >= @countPictures
BEGIN  
	Insert into Pictures(ImageURL, Deleted) Values ( CONCAT('https://www.shutterstock.com/es/image-photo/',CONVERT(VARCHAR,floor(999999*rand()))), 0)
   Insert into PicturesxHabit (HabitId, PictureId, Date) Values (@countPictures, (SELECT TOP 1 PictureId FROM Pictures ORDER BY PictureId DESC ), GETDATE())
	Set @countPictures = @countPictures+1;
END 


Select * from Pictures
Delete from BenefitsxHabit where BenefitxHabitId > 30
DECLARE @cant INT
SET @cant = 1
WHILE (@cant <= 100000)
BEGIN
    insert into Users(Email,Name,Apellido1,Apellido2,BirthDay)
    values
    (CONCAT('Estudiantec@itcr.cr',CONVERT(VARCHAR,@cant)), CONCAT('Juan',CONVERT(VARCHAR,floor(999999*rand()))), CONCAT('Arias',CONVERT(VARCHAR,floor(999999*rand()))), CONCAT('Perez',CONVERT(VARCHAR,floor(999999*rand()))), getdate())
SET @cant = @cant + 1
END

DECLARE @cantLogs INT
DECLARE @cdesc varchar(100)
SET @cantLogs = 0
WHILE (@cantLogs <= 10000)
BEGIN
	Set @cdesc = Concat('Description', CONVERT(VARCHAR,floor(999999*rand())))
    insert into Logs(LogTypeId,SeverityId,AppSourceId,EntityTypeId,Posttime, Description, Checksum)
    values
    ((SELECT TOP 1 LogTypeId FROM LogTypes ORDER BY NEWID()),
	(SELECT TOP 1 SeverityId FROM Severity ORDER BY NEWID()),
	(SELECT TOP 1 AppSourceId FROM AppSources ORDER BY NEWID()),
	(SELECT TOP 1 EntityTypeId FROM EntityTypes ORDER BY NEWID()),
	DATEADD(YEAR,-(floor(3*rand())),    (DateAdd(Month,-(floor(12*rand())),     (DateAdd(Day,  -(floor(25*rand())), GetDate() )) )) ),
	@cdesc,
	CONVERT(varbinary, HashBytes('MD5', @cdesc))
	)
SET @cantLogs = @cantLogs + 1
END

Select * from Logs

--UsuariosxProviders
DECLARE @cant INT
SET @cant = 1
WHILE (@cant <= 100000)
BEGIN
	insert into UsersxProviders(UserId,AuthProviderId,AuthCode,ExpDate,PorDefecto)
	values
	(@cant, floor(4*rand())+1, CONVERT(varbinary,floor(999999*rand())), '2022-06-25 09:20:01.153', 1)
SET @cant = @cant + 1
END
GO

select * from UsersxProviders