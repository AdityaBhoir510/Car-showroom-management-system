DROP database IF EXISTS car_showroom;
CREATE database IF NOT EXISTS car_showroom;

/*-----------tables creation-----------------*/

CREATE TABLE `dealers` (
  `DealerID` int NOT NULL AUTO_INCREMENT,
  `D_FirstName` varchar(20) DEFAULT NULL,
  `D_LastName` varchar(20) DEFAULT NULL,
  `D_PhoneNo` varchar(10) DEFAULT NULL,
  `D_email` varchar(255) DEFAULT NULL,
  `D_DOB` date DEFAULT NULL,
  `Designation` varchar(255) DEFAULT NULL,
  `MID` int DEFAULT NULL,
  `D_sal` int DEFAULT NULL,
  PRIMARY KEY (`DealerID`)
);

CREATE TABLE `customers` (
  `custid` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) DEFAULT NULL,
  `LastName` varchar(20) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Pincode` varchar(6) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone_no` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `DL_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`custid`)
);

CREATE TABLE `cars` (
  `Car_ID` int NOT NULL AUTO_INCREMENT,
  `Serial_no` int NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Colour` varchar(50) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `Car_price` int DEFAULT NULL,
  `DealerID` int DEFAULT NULL,
  `CustID` int DEFAULT NULL,
  `vin` varchar(40) NOT NULL,
  `year` year DEFAULT NULL,
  PRIMARY KEY (`Car_ID`),
  UNIQUE KEY `vin` (`vin`),
  KEY `DealerID` (`DealerID`),
  KEY `CustID` (`CustID`),
  CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`DealerID`) REFERENCES `dealers` (`DealerID`),
  CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`CustID`) REFERENCES `customers` (`custid`)
);

CREATE TABLE `sales` (
  `SaleID` int NOT NULL AUTO_INCREMENT,
  `Invoice_no` int DEFAULT NULL,
  `Sales_date` date DEFAULT NULL,
  `CarID` int DEFAULT NULL,
  `CustID` int DEFAULT NULL,
  `DealerID` int DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `Other_fees` int DEFAULT NULL,
  `Mode_of_payment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SaleID`),
  KEY `CarID` (`CarID`),
  KEY `CustID` (`CustID`),
  KEY `DealerID` (`DealerID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`Car_ID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`CustID`) REFERENCES `customers` (`custid`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`DealerID`) REFERENCES `dealers` (`DealerID`)
);

/*---------------------------END TABLE creation------------------*/

/*---------------data insertion in tables----------*/

/*---dealers table---*/
INSERT INTO dealers(DealerID,D_FirstName,D_LastName,D_PhoneNo,D_email,D_DOB,Designation,MID,D_sal) VALUES
 (201,'Ravi','Kumar',9876543210,'ravi.kumar@gmail.com','1990-01-01','owner',200,50000)
,(202,'Priya','Sharma',8765432109,'priya.sharma@yahoo.com','1992-02-15','manager',201,45000)
,(203,'Rajesh','Singh',7654321098,'rajesh.singh@outlook.com','1989-03-30','salesman',202,55000)
,(204,'Neha','Patel',6543210987,'neha.patel@hotmail.com','1991-04-10','salesman',202,40000)
,(205,'Amit','Gupta',5432109876,'amit.gupta@bing.com','1993-05-25','salesman',202,60000)
,(206,'Pooja','Jain',4321098765,'pooja.jain@gmail.com','1994-06-05','salesman',202,50000)
,(207,'Rohit','Sharma',3210987654,'rohit.sharma@yahoo.com','1990-07-20','salesman',202,45000)
,(208,'Anjali','Verma',2109876543,'anjali.verma@outlook.com','1992-08-12','HR',201,55000)
,(209,'Suresh','Reddy',1098765432,'suresh.reddy@hotmail.com','1989-09-18','Sr Mechanic',201,40000)
,(210,'Meena','Roy',987654321,'meena.roy@bing.com','1991-10-24','Co-owner',201,60000);

/*---customers table--- */
INSERT INTO customers(custid,FirstName,LastName,City,Pincode,Address,Phone_no,email,DOB,DL_no) VALUES
 (301,'Ravi','Kumar','Mumbai',400001,'andheri',9820123456,'ravi.kumar@gmail.com','1990-01-01','MH01 20100000001')
,(302,'Priya','Sharma','Delhi',110001,'sardar chuk',9811123456,'priya.sharma@yahoo.in','1992-05-15','DL01 20100000002')
,(303,'Anita','Patel','Ahmedabad',380001,'gandhi nagar',9825123456,'anita.patel@rediffmail.com','1993-02-10','GJ01 20100000004')
,(304,'Suresh','Jain','Chennai',600001,'ooti',9840123456,'suresh.jain@hotmail.com','1991-12-25','TN01 20100000005')
,(305,'Ravi','Sharma','Mumbai',400001,'andheri',9820123456,'ravi.sharma@mail.com','1990-01-01','MH012345678901')
,(306,'Priya','Patel','Ahmedabad',380001,'sardar chuk',9876543210,'priya.patel@mail.com','1992-03-15','GJ098765432109')
,(307,'Rajesh','Singh','Delhi',110001,'gandhi nagar',9812345678,'rajesh.singh@mail.com','1989-05-20','DL020202020202')
,(308,'Pooja','Jain','Jaipur',302001,'ooti',9789012345,'pooja.jain@mail.com','1991-07-10','RJ101010101010')
,(309,'Amit','Kumar','Kolkata',700001,'andheri',9834567890,'amit.kumar@mail.com','1993-09-25','WB252525252525')
,(310,'Neha','Gupta','Lucknow',226001,'sardar chuk',9798765432,'neha.gupta@mail.com','1994-11-05','UP050505050505')
,(311,'Anil','Mehta','Surat',395001,'gandhi nagar',9901234567,'anil.mehta@mail.com','1988-12-30','GJ303030303030')
,(312,'Sunita','Roy','Chennai',600001,'ooti',9845678901,'sunita.roy@mail.com','1995-02-14','TN141414141414')
,(313,'Vijay','Reddy','Hyderabad',500001,'andheri',9867890123,'vijay.reddy@mail.com','1990-10-31','TS313131313131');

/*---cars table---*/
INSERT INTO cars(Car_ID,Serial_no,Name,Colour,Manufacturer,type,Car_price,DealerID,CustID,vin,year) VALUES
 (101,123456,'Swift','Gray','Maruti','Hatchback',573000,201,301,'1G1ZT53826F123456',2015)
,(102,234567,'City','White','Honda','Sedan',1099000,205,304,'2T1BU4EE9DC098765',2020)
,(103,345678,'Creta','Black','Hyundai','SUV',999000,206,302,'3N1AB6AP3AL432109',2019)
,(104,456789,'Polo','Silver','Volkswagen','Hatchback',601000,204,305,'4S3BMHB68B3214567',2018)
,(105,567890,'EcoSport','Blue','Ford','SUV',799000,201,306,'5FNRL5H49BB654321',2017)
,(106,678901,'Tiago','Red','Tata','Hatchback',485000,205,307,'6G2EC57Y99L876543',2014)
,(107,789012,'Verna','Green','Hyundai','Sedan',910000,206,308,'7FARW2H55JE123456',2013)
,(108,890123,'Nexon','Gray','Tata','SUV',709000,208,309,'8T3ZF19VX8W012345',2015)
,(109,901234,'Rapid','White','Skoda','Sedan',779000,201,310,'9BWDE61JX24098765',2020)
,(110,12345,'Kwid','Black','Renault','Hatchback',312000,205,311,'WBA3A9C50DF098765',2019)
,(111,123890,'Baleno','Silver','Maruti','Hatchback',598000,206,312,'WDDHF8JB3EA876543',2018)
,(112,234901,'Amaze','Blue','Honda','Sedan',622000,204,313,'1C4RJFAG0FC123456',2018)
,(113,345012,'Seltos','Green','Kia','SUV',995000,206,301,'2HGFB2F59CH654321',2017)
,(114,456123,'Altroz','Gray','Tata','Hatchback',569000,208,304,'3VW2K7AJ1EM098765',2014)
,(115,567234,'Duster','White','Renault','SUV',957000,201,302,'4T1BF1FK9EU432109',2013);

/*---sales---*/
INSERT INTO sales(SaleID,Invoice_no,Sales_date,CarID,CustID,DealerID,Price,Other_fees,Mode_of_payment) VALUES
 (501,901,'2023-01-05',101,301,203,573000,8595,'Net Banking')
,(502,902,'2023-01-02',103,302,204,999000,16485,'Credit Card')
,(503,903,'2023-01-03',105,303,205,799000,14985,'Debit Card')
,(504,904,'2023-01-04',107,304,203,910000,9015,'EMI')
,(505,905,'2023-01-05',109,305,204,779000,11985,'Net Banking')
,(506,906,'2023-01-06',111,310,205,598000,7275,'Cash')
,(507,907,'2023-01-07',113,311,203,995000,13650,'Credit Card')
,(508,908,'2023-01-08',115,312,201,957000,10635,'Debit Card')
,(509,909,'2023-01-09',102,313,202,1099000,11685,'EMI')
,(510,910,'2023-01-10',108,303,205,709000,4680,'Net Banking');

/*---------END populating table----------*/

/* ------------sample question based on following database-------------*/

/*Q. a special discount of Rs 50000 is given to the customers, write a query to get cost of cars after deduction in a new column named as special discount*/
select car_id,name,manufacturer,car_price,car_price-50000 as special_discount from cars;

/*Q. write a query to find perday salary of all dealers */
select d_firstname,d_sal/30 as perday_sal from dealers;

/*Q. write a query to find the maximum salary of a dealer*/
select * from dealers where d_sal=(select max(d_sal) from dealers);

/*Q. write a query to find dealers whose salary is less than 50000*/
select * from dealers where d_sal>50000;

/*Q. write a query to find salesman whose salary is greater than 30000*/
select * from dealers where designation ="salesman" or d_sal<=30000;

/*Q. write a query to find the cars whose manufacturer is honda, tata, and skoda*/
select * from cars where manufacturer in ("honda","tata","skoda");

/*Q. write a query to find the details of customer whose birthday month is december*/
select * from customers where dob like '_____12%';

/*Q. write a query to find the cheapest car in the showroom*/
select * from cars where car_price=(select min(car_price) from cars);

/*Q. write a query to find how many cars are there in the showroom	*/
select count(*) as total_cars from cars;

/*Q. find the year of manufacturing of all cars which are hatchback's*/
select name,type,year from cars where type="hatchback" order by year;

/*Q. list the details of dealers according to there salary*/
select * from dealers order by d_sal desc;

/*Q. find the sales record of the customers based on there customer id*/
select c.custid,c.name,c.colour,s.sales_date,s.mode_of_payment from cars c inner join sales s on c.custid = s.custid;

/*Q. find the sales record of customers based on the sales data*/
select c.custid,c.name,c.colour,s.sales_date,s.mode_of_payment from sales s left join cars c on c.custid = s.custid; 

/*Q. find the sales record on customers based on cars purchased*/
select c.custid,c.name,c.colour,s.sales_date,s.mode_of_payment from sales s right join cars c on c.custid =s.custid;

/*Q. list the dealers full name and there manager full name which they are working under from the dealers table*/
select concat(e.d_firstname,'',e.d_lastname)as fullname,concat(o.d_firstname,'',o.d_lastname)as manager from dealers e,dealers o where e.mid=o.dealerid;

/*Q. find the details of dealer whose salary is greater than average salary of all dealers and whose is working as an HR in the showroom*/
select * from dealers where d_sal>(select avg(d_sal) from dealers) and designation=(select designation from dealers where designation="hr"); 
 
 /*Q. find the details of dealers whose designation is same as the person whose dealer id is 207*/
 select * from dealers where designation=(select designation from dealers where dealerID=207);
 
 /*Q. find the details of cars who has the price less than the 4th highest priced car in the showroom */
 select * from cars where car_price<
 (select max(car_price) from cars where car_price<
 (select max(car_price) from cars where car_price<
 (select max(car_price) from cars where car_price<
 (select max(car_price) from cars)))) order by car_price desc;
 
 /*Q. find the details of dealers whose has the 2nd highest salary in the showroom*/
 select * from dealers where d_sal=
 (select max(d_sal) from dealers where d_sal<
 (select max(d_sal) from dealers));
 
 /*Q. combine the sales and the dealers table */
 select * from dealers union select * from sales;
 
 /*Q. list the types of cars in the showroom */
 select distinct(type) from cars;