create database Student_Database_Management_System;  /*Creating a database*/
use Student_Database_Management_System;

/*Creating tables - Student, Course, Enrollment */
create table Course(
	Course_ID int not null auto_increment ,  
    Course_Name varchar(255) not null,  /*ensures that a column cannot have a NULL value.*/
    Professor varchar(255) not null,
    Credit int not null,
    primary key (Course_ID)       /*Creating a primary key to uniquely identifies each record in a table*/
);
    
create table Student(
	Student_ID int not null auto_increment, /*generate a unique value when a new record is inserted*/
    Student_Name varchar(255) not null,
    Phone_No varchar(15) not null,
    Email_ID varchar(255),
    Date_Of_Birth date not null,
    primary key (Student_ID),
    unique (Phone_No) /*ensures that all values in a column are distinct*/
);

create table Enrollment(
	Enrollment_ID int not null auto_increment,
    Student_ID int,
    Course_ID int,
    Date_Of_Enrollment date not null,
    Grade varchar(5),
    primary key (Enrollment_ID),
    foreign key (Student_ID) references Student (Student_ID),
    foreign key (Course_ID) references Course (Course_ID) /*to create a relationship between two tables*/
);
 /*Inserting data in the table*/
insert into Course (Course_Name ,Professor,Credit)
values 
("INFT","Vipul Dalal",1),
("CMPN", "Vidya Chitre",4),
("AIDS","Sonali Borkar",2),
("EXTC","Vikram Chandra",6);

insert into Student (Student_Name,Phone_No,Email_ID,Date_Of_Birth)
values
('Tisha Chaurasiya','874125963','tisha@gmail.com','2003-05-26'),
('Shrishti Chaurasiya','987412563','shrishti@gmail.com','2006-02-24'),
('Suraj Chaurasiya','741258963','suraj@gmail.com','2003-05-27');

insert into Enrollment(Student_ID,Course_ID,Date_Of_Enrollment,Grade)
values (1,1,'2005-07-01','A'),(2,2,'2005-11-11','A');

update Enrollment   /*to modify existing records in a table*/
set Date_Of_Enrollment = "2024-10-21"   /*specifies the columns and their new values*/
where Enrollment_ID = 4;   /*identifies which records should be updated*/

update Student
set Phone_No='967-325-6854',Email_ID='email@example.com'
where Student_ID=1;

update Enrollment
set Grade= case   /*Updating multiple grades using CASE and enrollment_id*/
	when Enrollment_ID=1 then 'A' 
	when Enrollment_ID=2 then 'A+' 
	when Enrollment_ID=3 then 'B-' 
	when Enrollment_ID=4 then 'B+' 
    else Grade
end
where Enrollment_ID in (1,2,3,4);

/*Delete the data from the database*/
delete from Course
where Course_ID=3;

delete from Student
where Student_ID=4;

select distinct *
from Course;

select *  /*To retrieve data from tables*/
from Student;

select *
from Enrollment;

select *
from Course
join Student on Course.Course_ID=Student.Student_ID;

select s.student_name,c.course_name,c.professor,c.credit,e.grade
from student s /*the main table*/
left join enrollment e on s.student_id=e.student_id  /*to combine rows from students and enrollments including all the students*/
left join course c on e.course_id=c.course_id; /*to combine rows from the resulting table and courses*/