create database dbCompany17Aug

use dbCompany17Aug

create table Areas
(area varchar(20),
zip char(5)
)
sp_help Areas

alter table Areas
alter column area varchar(20) not null

alter table Areas
add constraint pk_area primary key(area)
drop table Areas

create table Areas
(area varchar(20) constraint pk_area primary key,
zip char(5)
)

create table employees
(id int identity(101,1) primary key,
name varchar(20),
phone varchar(15),
area varchar(20) foreign key references Areas(area)
)
sp_help employees

create table skills
(skill varchar(20) primary key,
skill_description varchar(30)
)
sp_help skills

create table employeeskills
(employee_id int foreign key references employees(id),
skill_name varchar(20) foreign key references skills(skill),
skill_level float default(5),
primary key(employee_id,skill_name)
)
sp_help employeeskills
select * from areas
insert into areas values('AAA','12345')
insert into areas values('BBB','12345')
insert into areas(area,zip) values('CCC','12345')
insert into areas(zip,area) values('12345','DDD')

insert into employees(name,phone,area) values('raja','8608731263','AAA')
insert into employees(name,phone,area) values('rajadurai','8608731273','CCC')

select * from employees

insert into skills(skill,skill_description) values('SQL','RDBMS')
insert into skills(skill,skill_description) values('C','PLT')
insert into skills(skill,skill_description) values('JAVA','WEB')
select * from skills

insert into employeeskills values(101,'SQL',8),(101,'JAVA',default),(102,'C',6)
select * from employeeskills

create table pic
(pic_id int primary key,
pic_link varchar(20))

create table itemspic
(item_id int foreign key references items(id),
pic_id int foreign key references pic(pic_id),
primary key(item_id,pic_id))

create table suppliers
(id int primary key,
name varchar(20),
phone varchar(20),
email varchar(25),
address varchar(50))

create table categories
(cat_id int primary key,
name varchar(20),
description varchar(50)
)
create table items
(id int primary key,
name varchar(20),
price float,
quantityinstock int,
description varchar(50),
supplier_id int foreign key references suppliers(id),
category_id int foreign key references categories(cat_id),
rating int
)
sp_help items

create table occations
(id int identity(1,1) primary key,name varchar(20),start_date datetime,end_date datetime,description varchar(50))
create table occation_item
(occation_id int foreign key references occations(id),
item_id int foreign key references items(id),
discountPercent int,primary key(occation_id,item_id))
drop table occation_item
create table customers
(id int primary key,
dateofbirth date,
address varchar(40),
phone varchar(20),
email varchar(20),
pass varchar(8))
