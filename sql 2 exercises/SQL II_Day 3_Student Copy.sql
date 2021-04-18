# Datasets used: AirlineDetails.csv, passengers.csv and senior_citizen.csv
-- -----------------------------------------------------
-- Schema Airlines
-- -----------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. Create a table Airline_Details. Follow the instructions given below: 
-- -- Q1. Values in the columns Flight_ID should not be null.
-- -- Q2. Each name of the airline should be unique.
-- -- Q3. No country other than United Kingdom, USA, India, Canada and Singapore should be accepted
-- -- Q4. Assign primary key to Flight_ID
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create database in3;
use in3;
create table air_line_details (Flight_ID int not null primary key,Airline varchar(20) unique,
Country varchar(20) check (Country in('united kingdom','usa','India','canada','singapore')),
Punctuality float not null ,Service_Quality float not null ,AirHelp_score float not null);
select * from air_line_details;
desc air_line_details;
-- 2. Create a table Passengers. Follow the instructions given below: 
-- -- Q1. Values in the columns Traveller_ID and PNR should not be null.
-- -- Q2. Only passengers having age greater than 18 are allowed.
-- -- Q3. Assign primary key to Traveller_ID
create table Passengers (Traveller_ID varchar(10) not null primary key,PNR varchar(10) not null unique
,Name varchar(10) ,Flight_ID int(10) not null , Ticket_Price int(10) not null, age int(10) check(age>18)
default null );
desc passengers;
select * from passengers;
-- Questions for table Passengers:  
-- -- Q3. PNR status should be unique and should not be null.
alter table passengers modify column PNR varchar(10) unique not null;
-- -- Q4. Flight Id should not be null.
alter table passengers modify column Flight_ID int not null;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 5. Create a table Senior_Citizen_Details. Follow the instructions given below: 
-- -- Q1. Column Traveller_ID should not contain any null value.
-- -- Q2. Assign primary key to Traveller_ID
-- -- Q3. Assign foreign key constraint on Traveller_ID such that if any row from passenger table is updated, then the Senior_Citizen_Details table should also get updated.
-- -- --  Also deletion of any row from passenger table should not be allowed.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table senior_citizen_details (traveller_id varchar(10) primary key not null,
foreign key(traveller_id) references passengers(traveller_id) on update cascade ,
 senior_citizen varchar(10) default null,discounted_price float default 0.0);
 select * from senior_citizen_details;
-- -----------------------------------------------------
-- Table Senior_Citizen_Details
-- -- Q6. Create a new column Age in Passengers table that takes values greater than 18. 
 alter table senior_citizen_details add age int check(age>18);
 desc senior_citizen_details;
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 7. Create a table books. Follow the instructions given below: 
-- -- Columns: books_no, description, author_name, cost
-- -- Qa. The cost should not be less than or equal to 0.
-- -- Qb. The cost column should not be null.
-- -- Qc. Assign a primary key to the column books_no.
-- ---------------------------------------------------------------------------------------------------------------------------------------------------
create table books
(
books_no int,
description varchar(20),
author_name varchar(20),
cost decimal not null check(cost>0),
primary key(books_no)
);
desc books;
# Q8. Update the table 'books' such that the values in the columns 'description' and author' must be unique.
alter table books modify column description varchar(20) unique;
alter table books modify column author_name varchar(20) unique;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Create a table bike_sales. Follow the instructions given below: 
-- -- Columns: id, product, quantity, release_year, release_month
-- -- Q1. Assign a primary key to ID. Also the id should auto increment.
-- -- Q2. None of the columns should be left null.
-- -- Q3. The release_month should be between 1 and 12 (including the boundries i.e. 1 and 12).
-- -- Q4. The release_year should be between 2000 and 2010.
-- -- Q5. The quantity should be greater than 0.
create table bike_sales (ID int primary key auto_increment not null, product varchar(20) not null default 'n/a',
quantity int not null check(quantity>0),
release_year int not null check(release_year>2000 and release_year<2010),
release_month int not null check(release_month between 1 and 12)
);
desc bike_sales;
-- --------------------------------------------------------------------------
-- Use the following comands to insert the values in the table bike_sales
insert into bike_sales values ('1','Pulsar','1','2001','7');
insert into bike_sales values('2','yamaha','3','2002','3');
insert into bike_sales values('3','Splender','2','2004','5');
insert into bike_sales values('4','KTM','2','2003','1');
insert into bike_sales values('5','Hero','1','2005','9');
insert into bike_sales values('6','Royal Enfield','2','2001','3');
insert into bike_sales values('7','Bullet','1','2005','7');
insert into bike_sales values('8','Revolt RV400','2','2010','7');## doesnt get inserted because year is equal to 2010
insert into bike_sales values('9','Jawa 42','1','2011','5');## doesnt get inserted because year is greater than 2010
select * from bike_sales;
-- --------------------------------------------------------------------------



