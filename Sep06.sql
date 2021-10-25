create database dbCompany06Sep21

use dbCompany06Sep21

create table Employees
(id int identity(101,1) primary key,
name varchar(20),
age int)

insert into Employees(name,age) values('Jack',22)
insert into Employees(name,age) values('Jill',32)
insert into Employees(name,age) values('Jim',28)
update Employees SET name = 'Durai' where id = 104;

select * from Employees