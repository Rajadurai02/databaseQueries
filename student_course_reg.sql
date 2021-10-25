create database student_course_registration

use student_course_registration

create table courses
(courseId int identity(101,1) primary key,
name varchar(40),
description varchar(40))

alter table courses
add totalhours int
alter table courses
add categoryid int foreign key references category(categoryid)
alter table courses
add instituteid int foreign key references institutions(instituteid)

create table students
(studentId int identity(1001,1) primary key,
firstName varchar(20),
lastName varchar(20),
dateOfBirth date,
email varchar(40),
Address varchar(40),
courseId int foreign key references courses(courseid))

create table instructors
(instructorId int,
firstname varchar(20),
lastname varchar(20),
email varchar(40),
city varchar(20),
courseid int foreign key references courses(courseid),primary key(instructorid,courseid))

create table schedules
(courseid int foreign key references courses(courseid),
courseTime varchar(20),
courseStartTime datetime,
courseEndTime datetime,primary key(courseid,courseTime))

create table category
(categoryId int identity(1,1) primary key,
categoryName varchar(30))

create table institutions
(instituteId int identity(10001,1) primary key,
instituteName varchar(20),
city varchar(20))

--inserting values into table institutions

insert into institutions(instituteName,city) values ('AAA','Chennai')
insert into institutions(instituteName,city) values ('BBB','Mumbai')
insert into institutions(instituteName,city) values ('CCC','Delhi')
select * from institutions

--inserting values into table category

insert into category values ('Science and Technology')
insert into category values ('Management')
insert into category values ('Arts and social science')
select * from category
--inserting values into table courses
sp_help courses
insert into courses values ('Object Oreineted Programming with JAVA','object oreiented concept using JAVA',120,1,10001)
insert into courses values ('Data Structures','data structure concepts',120,1,10001)
insert into courses values ('Computer Networks','Types and usage of network',90,1,10001)
insert into courses values ('Database Management','creation and using database',120,1,10001)
insert into courses values ('Programming with Python','learn concepts of python',120,1,10001)
insert into courses values ('Operating Systems','working of operating system',90,1,10001)
insert into courses values ('Bachelors in Management','basics of managemnet',70,2,10002)
insert into courses values ('Masters in Management','advance concept of managemnet',90,2,10002)
insert into courses values ('Bachelors in Arts','basics of arts',70,3,10003)
insert into courses values ('Masters in Arts','advance concept of arts',90,3,10003)
select * from courses
--inserting values into students
sp_help students

insert into students values ('Abraham','Bennet','2000-07-24','abr.bet@gmail.com','Cheenai',101)
insert into students values ('Green','Marjorie','1999-10-23','gree.mar@gmail.com','Cheenai', 101)
insert into students values ('Carson','Cheryl','2000-03-20','car.che@gmail.com','Delhi', 101)
insert into students values ('Ringer','Alberts','1999-04-22','rin.albe@gmail.com','Cheenai', 102)
insert into students values ('Ringer','Anee','2000-02-04','rin.ane@gmail.com','Mumbai', 102)
insert into students values ('Michel','Defrance','1999-10-23','mic.def@gmail.com','Delhi', 103)
insert into students values ('Heather','Mac','2000-07-4','hea.mac@gmail.com','Mumbai', 103)
insert into students values ('Jon','snow','1999-10-2','jon.snow@gmail.com','Cheenai', 103)
insert into students values ('Robb','Stark','2000-07-24','robb.st@gmail.com','Mumbai', 104)
insert into students values ('Bran','Stark','1999-10-3','bran.st@gmail.com','Delhi', 104)
insert into students values ('Tony','Stark','2000-07-24','tony.st@gmail.com','Mumbai', 106)
insert into students values ('Sansa','Stark','1999-1-23','san.st@gmail.com','Cheenai', 107)
insert into students values ('Robert','Lan','2000-07-24','rob.lan@gmail.com','Delhi', 107)
insert into students values ('Ned','Lan','1999-10-23','ned.lan@gmail.com','Mumbai', 106)
insert into students values ('Renly','Bar','2000-07-24','ren.bar@gmail.com','Cheenai', 103)
insert into students values ('Thoen','Grey','1999-10-23','the.gre@gmail.com','Mumbai', 104)
insert into students values ('Steve','Smith','2000-07-24','ste.sim@gmail.com','Delhi', 110)
insert into students values ('Greme','Smith','1999-10-23','gre.sim@gmail.com','Mumbai', 101)
insert into students values ('Virat','kholi','2000-07-24','vir.ko@gmail.com','Cheenai', 109)
insert into students values ('Dhoni','Ms','1999-10-23','dhoni.ms@gmail.com','Delhi', 101)

select * from students

--inserting values into instructors
sp_help instructors
insert into instructors values (1111,'Adam','Cole','adam.cole@gmail.com','Chennai',101)
insert into instructors values (1111,'Adam','Cole','adam.cole@gmail.com','Chennai',106)
insert into instructors values (2222,'William','Regal','will.regal@gmail.com','Chennai',102)
insert into instructors values (3333,'Jhonny','Gargeno','jhonny.gar@gmail.com','Cheenai',103)
insert into instructors values (4444,'Candice','Larae','can.larae@gmail.com','Chennai',104)
insert into instructors values (5555,'Indi','Hartwell','indi.hart@gmail.com','Chennai',107)
insert into instructors values (6666,'Dexter','Lumis','dex.lumis@gmail.com','Mumbai',108)
insert into instructors values (6666,'Dexter','Lumis','dex.lumis@gmail.com','Mumbai',109)
insert into instructors values (7777,'Jon','Arryn','jon.arryn@gmail.com','Delhi',110)
insert into instructors values (7777,'Jon','Arryn','jon.arryn@gmail.com','Delhi',111)
select * from  courses

--inserting values into schedules
sp_help schedules
insert into schedules values (101,'9AM-1PM','2021-08-16','2021-10-15')
insert into schedules values (102,'9AM-1PM','2021-10-16','2021-12-15')
insert into schedules values (103,'2PM-6PM','2021-08-16','2021-10-15')
insert into schedules values (104,'2PM-6PM','2021-10-16','2021-12-15')
insert into schedules values (106,'9AM-1PM','2021-08-16','2021-10-15')
insert into schedules values (107,'2PM-6PM','2021-10-16','2021-12-15')
insert into schedules values (108,'9AM-1PM','2021-09-16','2021-11-15')
insert into schedules values (109,'2PM-6PM','2021-10-16','2021-12-15')
insert into schedules values (110,'2PM-6PM','2021-09-16','2021-11-15')
insert into schedules values (111,'9AM-1PM','2021-12-16','2022-02-15')

select * from schedules