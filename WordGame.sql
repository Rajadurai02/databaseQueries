create database WordGame
use WordGame

create table UserDetails(
UserName varchar(20) primary key,
Name varchar(20),
Password varchar(20),
Phone varchar(20))

create table UserWord(
UserId int identity(1,1) primary key,
UserName varchar(20) foreign key references UserDetails(UserName),
Word varchar(20))
insert into ScoreBoard values ('Raja2472000',0)
insert into ScoreBoard values ('Rajadurai',0)

select *  from UserDetails
create table ScoreBoard(
ScoreId int identity(1,1) primary key,
UserName varchar(20) foreign key references UserDetails(UserName),
Score int)

create table Words(
WordId int identity(1,1) primary key,
RandomWord varchar(10))

insert into Words(RandomWord) values ('test')
insert into Words(RandomWord) values ('hello')
insert into Words(RandomWord) values ('user')
insert into Words(RandomWord) values ('word')
insert into Words(RandomWord) values ('table')
insert into Words(RandomWord) values ('name')
insert into Words(RandomWord) values ('bank')
insert into Words(RandomWord) values ('space')
insert into Words(RandomWord) values ('wind')
insert into Words(RandomWord) values ('video')

select * from UserWord