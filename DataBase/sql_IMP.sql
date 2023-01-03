Create database testDB;
show databases;
select * from ashish0074.test;
drop database ashish0074;
show databases;
create table Persons (PersonsID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255) );
show tables ; 
use ashu ;
Create table Persons (PersonsID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255) );
# drop table Persons
# Truncate table Persons

# "drop" command delete "whole Structure" of data in one go .
# "truncate" delete the whole row of releation in one go but structure mentain
# in both case "Drop and Truncate" we cannot restore the tuple of the tabel

# "Alter"
use ashu ;
Alter table Persons add Email varchar(255);   # add col email
Alter table Persons drop column LastName;
use ashu;
Alter table Persons add DateOfBirth date ; # add dateofbirth col with date type
use ashu;
# alter table Persons Alter column DateOfBirth years
select * from ashu.Persons;
use ashu;
alter table Persons drop column DateOfBirth;
Alter table Persons add DateOfBirth year ;
Alter table Persons modify column DateOfBirth date;

# create another tabel using same database
use ashu;
create table Student(
ID int NOT NULL,
LastName varchar(255) Not null,
FirstName Varchar(255) not null,
age int
);
# in case we make tabel of age(int )---> change or modify the it 
Alter table Student Modify column age int  Not null;

# Unique
use ashu;
create table Jobs (
ID int Not null,
LastName varchar(255) Not null,
FirstName varchar(255),
age int,
unique(ID)   # declare the single unique element
# Constraint UC_Jobs Unique (LastName, Phone_no)  # unique constraint on multiple columns
);

# alter 
alter table Jobs add Phone_no varchar(25);
Alter table Student add unique(ID);
Alter table Jobs add constraint UC_Jobs unique (LastName, Phone_no);

# drop the unique constainst jobs- UC jobs
Alter table Jobs Drop Index UC_Jobs;

# primary key
show databases;
use testDB;
create table Person1 (
ID int not null,
LastName varchar(255) not null,
FirstName varchar(255),
Age int,
Primary key (ID)
);

# Priamary key constaint
# Note :::--"IN table only "1"Single Primary key is defined if already then drop"
alter table Person1 Drop primary key;
# now pk is drop

# constraint
Alter table Person1
add constraint PK_Person primary key(ID,LastName);

# Foreign key 

# # The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.
use testDB;
create table Orders (
	orderID int not null,
	orderNo int not null,
	PersonID int,
	Primary key (orderID),
	constraint fk_id Foreign key (PersonID) references Person1(ID)
);

SELECT DISTINCT
    TABLE_NAME,
    INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'Orders';
  
show index from Orders;

