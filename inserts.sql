

Insert into Severity(Name) Values ('Info')
Insert into Severity(Name) Values ('Error')
Insert into Severity(Name) Values ('Warning')

Insert into EntityTypes(Name) Values ('User')
Insert into EntityTypes(Name) Values ('Invoice')


Insert into AppSources(Name) Values ('App')
Insert into AppSources(Name) Values ('Server')

Insert into LogTypes(Name) Values ('Match completed')
Insert into LogTypes(Name) Values ('Matchmaking started')
Insert into LogTypes(Name) Values ('Matchtracing analysis')


-- Transtypes
INSERT INTO TransType(Name) VALUES('Credit')
INSERT INTO TransType(Name) VALUES('Debit')
INSERT INTO TransType(Name) VALUES('Game Points')

-- Transubtypes para pruebas
INSERT INTO TransSubType(Name) VALUES('Font Color')
INSERT INTO TransSubType(Name) VALUES('Skins')
INSERT INTO TransSubType(Name) VALUES('Bot Analysis')

-- Merchants
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Paypal','https://www.paypal.com/',1,'https://logodownload.org/wp-content/uploads/2014/10/paypal-logo-0.png')
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Google Pay','https://pay.google.com/',1,'https://www.gstatic.com/pay/images/logo_3x_v1.png')
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Apple Pay','https://www.apple.com/apple-pay/',1,'https://logodownload.org/wp-content/uploads/2019/09/apple-pay-logo-0.png')

-- PaymentStatuses para pruebas
INSERT INTO PaymentStatuses(Name) VALUES('Accepted')
INSERT INTO PaymentStatuses(Name) VALUES('Rejected')
INSERT INTO PaymentStatuses(Name) VALUES('Invalid')
INSERT INTO PaymentStatuses(Name) VALUES('Communication Error')

INSERT INTO auth_providers(Name) values ('Facebook'), ('Twitter'), ('Tumblr'), ('Instagram')

--Locations
INSERT INTO dbo.Locations(Name,Population,Location) values ('Detroit',23213,
geography::Point(42.36581778709666, -83.11569407248047, 4326)),
('Pigeon Forge',34567,geography::Point(35.793082770368876, -83.5630877477627, 4326)),
('Thibodaux',34674,geography::Point(29.791545815421, -90.81698047895732, 4326)),
('Akron',12345,geography::Point(41.063059053774225, -81.52603394619926, 4326)),
('Toledo',97453,geography::Point(41.655251172644356, -83.55537577977427, 4326)),
('Orlando',45677,geography::Point(28.539624638901497, -81.35374374863383, 4326)),
('Phoenix',23231,geography::Point(33.571923208701406, -112.09762868084333, 4326)),
('Milwaukee',45678,geography::Point(43.04977816786706, -87.93791376190747, 4326)),
('Denver',76423,geography::Point(39.722544936307315, -104.97253781224705, 4326)),
('Houston',34578,geography::Point(29.776363398597137, -95.43429593586099, 4326));


--Campañas
INSERT INTO dbo.Campañas(Name,Description) values('Campaña1', 'Campaña1'),
('Campaña2', 'Campaña2'),
('Campaña3', 'Campaña3'),
('Campaña4', 'Campaña4'),
('Campaña5', 'Campaña5'),
('Campaña6', 'Campaña6'),
('Campaña7', 'Campaña7'),
('Campaña8', 'Campaña8');

--Ads

DECLARE @cant INT
SET @cant = 1
WHILE (@cant <= 1000)
BEGIN
	insert into Ads(AdRefId,AdURL,CampañaId,ActionURL,ComputerName,IpAdress,Checksum)
	values
	(@cant, CONVERT(VARCHAR,floor(999999*rand())),floor(7*rand())+1, CONVERT(VARCHAR,floor(999999*rand())), 'Computadora', Convert(varbinary,'1234453'), HASHBYTES('MD5', convert(nvarchar,@cant+@cant+6)))
SET @cant = @cant + 1
END
GO

--Usuarios
DECLARE @cant INT
SET @cant = 1
WHILE (@cant <= 100000)
BEGIN
	insert into Users(Email,Name,Apellido1,Apellido2,BirthDay)
	values
	(CONCAT('Estudiantec@itcr.cr',CONVERT(VARCHAR,@cant)), CONCAT('Juan',CONVERT(VARCHAR,floor(999999*rand()))), CONCAT('Arias',CONVERT(VARCHAR,floor(999999*rand()))), CONCAT('Perez',CONVERT(VARCHAR,floor(999999*rand()))), getdate())
SET @cant = @cant + 1
END


select * from dbo.Users

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



