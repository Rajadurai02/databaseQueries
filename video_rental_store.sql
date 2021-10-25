create database video_rental_store
use video_rental_store
create table movie_categories 
(
id int identity(100,1) primary key,
category_name varchar(20) not NULL,
)

create table member_type 
(
id int identity(1,1) primary key,
type_name varchar(20) not NULL,
)

create table movie_list 
(
id int identity (1,1) primary key,
movie_title varchar(50) not NULL,
movie_format varchar(10) CHECK(movie_format in ('VHS', 'DVD', 'VCD')),
pk_category_id int Foreign key  references movie_categories(id)
)
alter table movie_list add description varchar(50)
sp_help movie_list

create table member
(
id int identity Primary key ,
member_name varchar(20) not NULL,
pk_member_type int Foreign key  references member_type(id),
pk_favorite_category int Foreign key references movie_categories(id))

create table gold_member(
id  int identity (1,1) primary key,
member_id int,
movie_in_use_id int foreign key references movie_list(id))


create table bronze_member( id int identity (1000,1) primary key,
member_id int unique,
movie_in_use_id int foreign key references movie_list(id))

create table dependent(depid int identity(1,1) primary key,
member_id int Foreign key  references member_type(id),
name varchar(10))

create table Movie_rentdetails(rentid int identity(1,1) primary key,
movies_id int foreign key references movie_list(id),
Bronze_Member int foreign key references Bronze_Member(id),
gold_members int foreign key references gold_member(id),
dependent_id int Foreign key  references dependent(depid ),
rent  datetime,
return_date datetime
 )

 -- inserting the category values
insert into movie_categories(category_name) values('comedy')

insert into movie_categories(category_name) values('action')
insert into movie_categories(category_name) values('adventures')
insert into movie_categories(category_name) values('comedy')
insert into movie_categories(category_name) values('family drama')


-- inserting member type

insert into member_type(type_name) values('goldmember')



insert into member_type(type_name) values('bronze')


insert into member_type(type_name) values('goldmember')


insert into member_type(type_name) values('goldmember')


--inserting members

insert into member(member_name,pk_member_type,pk_favorite_category) values ('yarik','3',100)

insert into member(member_name,pk_member_type,pk_favorite_category) values ('vitalii','2',100)

insert into member(member_name,pk_member_type,pk_favorite_category) values ('chandan','3',100)

insert into member(member_name,pk_member_type,pk_favorite_category) values ('raja','3',100)

select * from member



--inserting movies

insert into movie_list (movie_title,movie_format,pk_category_id,description) values ('fast and furious ','VHS',101,'action film')
insert into movie_list (movie_title,movie_format,pk_category_id,description) values ('fast and furious1 ','VHS',101,'action film')
insert into movie_list (movie_title,movie_format,pk_category_id,description) values ('fast and furious 2','VHS',101,'action film')

select * from movie_list


-- inserting o bronze members

insert into bronze_member(member_id,movie_in_use_id) values ('3',2)


insert into bronze_member(member_id,movie_in_use_id) values ('2',2)


-- inserting to gold members


insert into gold_member(member_id,movie_in_use_id) values ('3',2)

select * from gold_member

-- insert into rental details

insert into Movie_rentdetails(movies_id,Bronze_Member,gold_members,rent ,return_date) values ('2','1000',null,'1997/1/1','1997/1/2')

insert into Movie_rentdetails(movies_id,Bronze_Member,gold_members,rent,return_date) values ('2',null ,3,'1997/1/1','1997/1/2')


insert into Movie_rentdetails(movies_id,Bronze_Member,gold_members,rent,return_date) values ('2',1002 ,3,'1997/1/1','1997/1/2')

select * from Movie_rentdetails








