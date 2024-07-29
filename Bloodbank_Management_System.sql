CREATE DATABASE bloodbank_management_system;
USE bloodbank_management_system;

CREATE TABLE BB_Manager(
  m_id INT NOT NULL,
  mName VARCHAR(255) NOT NULL,
  m_phNo VARCHAR(15)
);
INSERT into BB_Manager
VALUES
(1,'Tisha', 987654321),
(2,'Shrishti', 852147963),
(3,'Manisha', 936825714),
(4,'Suraj', 285396174),
(5,'Rajveer', 897564231),
(6,'Virat', 235689741),
(7,'Durva', 231546789),
(8,'Advika', 987412563);
select * from BB_Manager;

CREATE TABLE Blood_Donor (
  bd_ID INT NOT NULL,
  bd_name VARCHAR(255) NOT NULL,
  bd_age VARCHAR(10),
  bd_sex VARCHAR(10),
  bd_Bgroup VARCHAR(10),
  bd_reg_date DATE,
  reco_ID INT NOT NULL,
  City_ID INT NOT NULL
);
INSERT into Blood_Donor
VALUES
(101,'Mark',25,'M','B+','2015-12-17',101212,1100),
(102,'Anha',35,'F','A+','2016-11-22',101212,1100),
(103,'Smith',22,'M','O+','2016-01-04',101312,1200),
(104,'Pat',29,'M','O+','2015-07-19',101412,1300),
(105,'Jessica',42,'F','A-','2015-12-24',101412,1300),
(106,'Suzan',44,'M','AB+','2015-08-28',101212,1200),
(107,'Doceia',33,'F','AB-','2016-02-06',101212,1400),
(108,'Elisa',31,'F','AB+','2016-09-10',101312,1200),
(109,'Carrol',24,'M','B-','2016-10-15',101312,1500),
(110,'Barack',29,'M','O-','2016-12-17',101212,1200);
select * from Blood_Donor;

CREATE TABLE BloodSpecimen
( specimen_number int NOT NULL,
b_group varchar(10) NOT NULL,
status int,
dfind_ID int NOT NULL,
M_id int NOT NULL,
CONSTRAINT specimenumber_pk PRIMARY KEY (specimen_number)
);
INSERT into BloodSpecimen
VALUES
(1001, 'B+', 1,11,101),
(1002, 'O+', 1,12,102),
(1003, 'AB+', 1,11,102),
(1004, 'O-', 1,13,103),
(1005, 'A+', 0,14,101),
(1006, 'A-', 1,13,104),
(1007, 'AB-', 1,15,104),
(1008, 'AB-', 0,11,105),
(1009, 'B+', 1,13,105),
(1010, 'O+', 0,12,105),
(1011, 'O+', 1,13,103),
(1012, 'O-', 1,14,102),
(1013, 'B-', 1,14,102),
(1014, 'AB+', 0,15,101);
SELECT * FROM BloodSpecimen;

CREATE TABLE City(
City_ID int NOT NULL,
City_name varchar(80) NOT NULL
);
INSERT INTO City (City_ID, City_name)
VALUES
(11, 'Mumbai'),
(12, 'Pune'),
(13, 'Thane'),
(14, 'Solapur'),
(15, 'Nanded'),
(16, 'Kolhapur'),
(17, 'Aurangabad'),
(18, 'Nashik'),
(19, 'Nagpur');
select * from City;

CREATE TABLE DiseaseFinder(
dfind_ID int PRIMARY KEY NOT NULL,
dfind_name varchar(50) NOT NULL,
dfind_PhNo bigint
);
INSERT into DiseaseFinder
VALUES
(61,'Peter',4693804223),
(62,'Park',4693804223),
(63,'Jerry',4693804223),
(64,'Mark',4693804223),
(65,'Monika',4693804223),
(66,'Ram',4693804123),
(67,'Swathi',4693804223),
(68,'Gautham',4693804323),
(69,'Ashwin',4693804423),
(70,'Yash',4693804523);
select * from DiseaseFinder;

CREATE TABLE CityHospital(
  hosp_ID INT NOT NULL PRIMARY KEY,
  hosp_name VARCHAR(255) NOT NULL,
  City_ID INT NOT NULL,
  m_id INT NOT NULL
);
INSERT into CityHospital
VALUES
(00,'MayoClinic',1100,101),
(01,'CleavelandClinic',1200,103),
(02,'NYU',1300,103),
(03,'Baylor',1400,104),
(04,'Charlton',1800,103),
(05,'Greenoaks',1300,106),
(06,'Forestpark',1300,102),
(07,'Parkland',1200,106),
(08,'Pinecreek',1500,109),
(09,'WalnutHill',1700,105);
SELECT * FROM CityHospital;

CREATE TABLE OurHospital(
hosp_ID int Primary Key NOT NULL,
hosp_name varchar(255) NOT NULL,
hosp_needed_Bgrp varchar(10),
hosp_needed_qnty int
);
INSERT into OurHospital
VALUES
(001,'MayoClinic','A+',20),
(002,'MayoClinic','AB+',0),
(003,'MayoClinic','A-',40),
(004,'MayoClinic','B-',10),
(005,'MayoClinic','AB-',20),
(006,'CleavelandClinic','A+',40),
(007,'CleavelandClinic','AB+',20),
(008,'CleavelandClinic','A-',10),
(009,'CleavelandClinic','B-',30),
(010,'CleavelandClinic','B+',0),
(011,'CleavelandClinic','AB-',10),
(012,'NYU','A+',0),
(013,'NYU','AB+',0),
(014,'NYU','A-',0),
(015,'NYU','B-',20),
(016,'NYU','B+',10),
(017,'NYU','AB-',0),
(018,'Baylor','A+',10),
(019,'Charlton','B+',30),
(020,'Baylor','A-',40),
(021,'Forestpark','B-',40),
(022,'Parkland','B+',10),
(023,'Pinecreek','AB-',20);
select * from OurHospital;

CREATE TABLE Recipient(
reci_ID int PRIMARY KEY NOT NULL,
reci_name varchar(50) NOT NULL,
reci_age varchar(3),
reci_Brgp varchar(3),
reci_Bqnty float,
reco_ID int NOT NULL,
City_ID int NOT NULL,
M_id int NOT NULL,
reci_sex varchar(15),
reci_reg_date date
);
INSERT into Recipient
VALUES
(21,'Mogambo',25,'B+',1.5,101212,1100,101,'M','2015-12-17'),
(22,'Dan',60,'A+',1,101312,1100,102,'M','2015-12-16'),
(23,'Steve',35,'AB+',0.5,101312,1200,102,'M','2015-10-17'),
(24,'Joe',66,'B+',1,101212,1300,104,'M','2016-11-17'),
(25,'Albert',53,'B-',1,101412,1400,105,'M','2015-04-17'),
(26,'Issac',45,'O+',1.5,101512,1500,105,'M','2015-12-17'),
(27,'Alia',22,'AB-',1,101212,1500,101,'F','2015-05-17'),
(28,'Aisha',25,'B+',2,101412,1300,103,'F','2015-12-14'),
(29,'Justin',30,'A+',1.5,101312,1100,104,'M','2015-02-16'),
(30,'Donald',25,'AB+',3.5,101212,1200,107,'M','2016-10-17');
select * from Recipient;

CREATE TABLE Recording_Staff(
reco_ID int PRIMARY KEY NOT NULL,
reco_Name varchar(50) NOT NULL,
reco_phNo bigint
);
INSERT into Recording_Staff
VALUES
(1010,'Walcot',4045806553),
(1011,'Henry',4045806553),
(1012,'Silva',4045806553),
(1013,'Adrian',4045806553),
(1014,'Mark',4045806553),
(1015,'Abdul',4045816553),
(1016,'Jerry',4045826553),
(1017,'Tim',4045836553),
(1018,'Lekha',4044846553),
(1019,'Mark',4045856553);

/* SAMPLE QUERIES */
-- Create a View of recipients and donors names having the same blood group registered on the same date --
CREATE VIEW Blood_Recipient_SameBGrp;
select Blood_Donor.bd_name,Recipient.reci_name,reco_Name from
Recording_Staff
inner join Blood_Donor on Recording_Staff.reco_ID = Blood_Donor.reco_ID
inner join Recipient on Recording_Staff.reco_ID = Recipient.reco_ID
where Blood_Donor.bd_Bgroup = Recipient.reci_Brgp and
Blood_Donor.bd_reg_date = Recipient.reci_reg_date;

-- Show the pure blood specimen handled by BB_Manager who also handles a recipient needing the same blood group along with the details of the BB_Manager and Recipient.
select BB_Manager.M_id,mName,Recipient.reci_name, Recipient.reci_Brgp,b_group
from BB_Manager,Recipient,BloodSpecimen
where Recipient.M_id = BloodSpecimen.M_id and Recipient.reci_Brgp =
BloodSpecimen.b_group
and status = 1;

-- Show the donors having the same blood groups required by the recipient staying in the same city along with recipient details.
SELECT Blood_Donor.bd_ID, 
  Blood_Donor.bd_name, 
  Recipient.reci_ID, 
  Recipient.reci_name 
FROM Blood_Donor
JOIN Recipient ON Blood_Donor.bd_Bgroup = Recipient.reci_Brgp 
AND Blood_Donor.City_ID = Recipient.City_ID;

-- Show the blood specimen verified by disease finder Mark which are pure (status=1).
Select specimen_number,b_group from BloodSpecimen,DiseaseFinder
WHERE BloodSpecimen.dfind_ID= DiseaseFinder.dfind_ID AND
dfind_name='Mark' AND status=1;