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
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Google Pay','https://pay.google.com/",1,"https://www.gstatic.com/pay/images/logo_3x_v1.png')
INSERT INTO Merchants(Name,Url,Enabled,IconUrl) VALUES('Apple Pay','https://www.apple.com/apple-pay/',1,'https://logodownload.org/wp-content/uploads/2019/09/apple-pay-logo-0.png')

-- PaymentStatuses para pruebas
INSERT INTO PaymentStatuses(Name) VALUES('Accepted')
INSERT INTO PaymentStatuses(Name) VALUES('Rejected')
INSERT INTO PaymentStatuses(Name) VALUES('Invalid')
INSERT INTO PaymentStatuses(Name) VALUES('Communication Error')

INSERT INTO auth_providers(Name) value ('Facebook'), ('Twitter'), ('Tumblr'), ('Instagram')