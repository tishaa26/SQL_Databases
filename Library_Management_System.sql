create database Library_Management_System;  /*Creating a database*/
use Library_Management_System;

/*Creating tables - Books , Members, Transactions */
create table Books(
	Book_ID int not null auto_increment ,  
    Book_Name varchar(255) not null,  /*ensures that a column cannot have a NULL value.*/
    Author varchar(255) not null,
    Genre varchar(255) not null,
    Publication_Year year not null,
    primary key (Book_ID)       /*Creating a primary key to uniquely identifies each record in a table*/
);
    
create table Members(
	Member_ID int not null auto_increment, /*generate a unique value when a new record is inserted*/
    Member_Name varchar(255) not null,
    Phone_No varchar(15) not null,
    Email_ID varchar(255),
    Membership_date date not null,
    primary key (Member_ID),
    unique (Phone_No) /*ensures that all values in a column are distinct*/
);

create table Transactions(
	Transaction_ID int not null auto_increment,
    Book_ID int,
    Member_ID int,
    Borrow_Date date not null,
    Return_Date date null,
    primary key (Transaction_ID),
    foreign key (Book_ID) references Books (Book_ID), /*to create a relationship between two tables*/
	foreign key (Member_ID) references Members (Member_ID)
);
 /*Inserting data in the table*/
insert into Books (Book_Name,Author,Genre,Publication_Year)
values 
("Midnight's Children"," Salman Rushdie","Historical Fiction",1981),
("The God of Small Things", "Arundhati Roy","Fiction",1997),
("Palace of Illusions","Chitra Banerjee Divakaruni","Mythological Fiction",2008),
("Sacred Games","Vikram Chandra",'Crime Thriller',2006);

insert into Members (Member_Name,Phone_No,Email_ID,Membership_date)
values
('TISHA','852369741','tisha@gmail.com','2024-05-29'),
('SHISHTI','987654321','shrishti@gmail.com','2024-02-24'),
('SURAJ','875421369','suraj@gmail.com','2024-05-27'),
('MANISHA','789654123','manisha@gmail.com','2024-10-09');

insert into Transactions( Book_ID,Member_ID,Borrow_Date,Return_Date)
values (1,1,'2024-07-01',null),(2,2,'2024-07-10',null);

update transactions   /*to modify existing records in a table*/
set Return_date = "2024-10-21"   /*specifies the columns and their new values*/
where Transaction_ID = 1;   /*identifies which records should be updated*/

update members
set Phone_No='324-176-8379',Email_ID='callto@example.com'
where Member_ID=2;
/*Delete the data from the database*/
delete from books
where Book_ID=3;

delete from members
where Member_ID=4;

select distinct *
from books;

select *  /*To retrieve data from tables*/
from members;

select *
from transactions;

select b.Book_Name , b.Author 
from books b
where Book_ID = 1;

select b.Book_Name , b.Author , t.Borrow_Date , t.Return_Date  /*Selects columns from the Books and Transactions table*/
from books b , transactions t /*the Books table aliased as 'b' and the Transactions table aliased as 't'*/
where b.Book_ID=Transaction_ID; /*Join condition*/