select convert(varbinary(50),'Malaysia');



create database Inventory;
use Inventory;

create table dbo.Cities(
ID_City INT IDENTITY(1,1) not null primary key,
City nchar(10) NOT NULL
);

create table dbo.Clients(
ID_Client INT IDENTITY(1,1) not null primary key,
Name varchar(50) not null,
ContactPerson varchar(50) not null,
ContactPhone varchar(12) not null,
ContactEmail varchar(50) not null,
StreetAddress1 varchar(50) not null,
StreetAddress2 varchar(50) null,
City int not null,
Province int not null,
Country int not null
);

create table dbo.Countries(
ID_Country INT IDENTITY(1,1) not null primary key,
Country varbinary(50) not null
);

create table dbo.Items(
ID_Item INT IDENTITY(1,1) not null primary key,
Name varchar(50) not null,
Description varchar(50) not null,
Quantity int not null
)

create table dbo.JunInventory(
ID_Inventory INT IDENTITY(1,1) not null primary key,
ID_Item int not null,
ID_Client int not null,
Quantity int not null
)

create table dbo.Provinces(
ID_Province INT IDENTITY(1,1) not null primary key,
Province varchar(50) not null
)

set IDENTITY_INSERT dbo.Cities on;
INSERT INTO dbo.Cities (ID_City, City)
VALUES (1,'Toronto'),(2,'New York'),(3,'Beijing'),(4,'Tokyo'),(5,'KualaLumpu');
set IDENTITY_INSERT dbo.Cities off;

set IDENTITY_INSERT dbo.Clients ON;
INSERT INTO dbo.Clients (ID_Client,Name,ContactPerson,ContactPhone,ContactEmail,StreetAddress1,City,Province,Country)
VALUES (1,'Achoo Inc.','Achuser1','26577755654','Achuser1@achoo.ca','123 Example St',1,1,1),
(2,'Springhill ENT','SHENTUser2','22697866332','SHENTUser2@shent.ca','456 Example St',2,2,2),
(3,'Childrens Health Center','CHCUser2','51977784726','CHCUser2@chc.ca','789 Example St',3,3,3),
(4,'Dyna Labs','DLUser1','13988765479','DLUser1@dlabs.ca','112 Example St',4,4,4),
(5,'Pharma Plus','PPUser2','15688681604','PPUser@pplus.ca','233 Example St',5,5,5);
set IDENTITY_INSERT dbo.Clients off;

set IDENTITY_INSERT dbo.Countries on;
INSERT INTO dbo.Countries (ID_Country, Country)
VALUES (1,0x43616E616461),(2,0x555341),(3,0x4368696E61),(4,0x4A6170616E),(5,0x4D616C6179736961);
set IDENTITY_INSERT dbo.Countries off;

set IDENTITY_INSERT dbo.Items ON;
INSERT INTO dbo.Items (ID_Item, Name,Description,Quantity)
VALUES (1,'Cardboard Box','Cardborad Box',500),
(2,'Paper','A4 Paper',10000),
(3,'China','China from China',2),
(4,'Covid 19 Vaccine','Covid 19 Vaccine',100),
(5,'Pens','Pens',500);
set IDENTITY_INSERT dbo.Items off;

set IDENTITY_INSERT dbo.Juninventory ON;
INSERT INTO dbo.JunInventory (ID_Inventory,ID_Item,ID_Client,Quantity)
VALUES (1,5,4,100),
(2,4,3,50),
(3,3,2,50),
(4,2,1,50),
(5,1,5,50);
set IDENTITY_INSERT dbo.Juninventory Off;

set IDENTITY_INSERT dbo.Provinces ON;
INSERT INTO dbo.Provinces (ID_Province,Province)
VALUES (1,'Ontairo'),
(2,'New York'),
(3,'Beijing'),
(4,'Tokyo Metropolis'),
(5,'Kuala Lumpur');
set IDENTITY_INSERT dbo.Provinces off;

ALTER TABLE dbo.Clients
ADD constraint FK_Clients_Cities FOREIGN KEY (City)
REFERENCES dbo.Cities (ID_City);

ALTER TABLE dbo.Clients
ADD constraint FK_Clients_Country foreign key (Country)
REFERENCES dbo.Countries (ID_Country);

ALTER TABLE dbo.Clients
ADD constraint FK_Clients_Provinces FOREIGN KEY (Province)
REFERENCES dbo.Provinces (ID_Province);

ALTER TABLE dbo.JunInventory
ADD constraint FK_JunInventory_Items FOREIGN KEY (ID_Item)
REFERENCES dbo.Items (ID_Item);

ALTER TABLE dbo.JunInventory
ADD constraint FK_JunInventory_Client FOREIGN KEY (ID_Client)
REFERENCES dbo.Clients (ID_Client);