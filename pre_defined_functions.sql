--soundex
--evaluate the similarity of two strings and return a four character code
select soundex('raja'),soundex('rajadurai');

--cross join
--used to generate a paired combination of each row first table with each row of second table
create table meals(mealname varchar(10))
create table drinks(drinkname varchar(10))
insert into meals values ('omlet')
insert into meals values ('fried egg')
insert into meals values ('sausage')
insert into drinks values ('applejuice')
insert into drinks values ('tea')
insert into drinks values ('coffee')
select * from meals cross join drinks

--pre defined functions
--numeric functions
--floor
select floor(5.23456);
select floor(120.23456);
--LOG
select log(30.41);
--power
select power(18, 4);
--PI
select pi();
--mod
select {fn MOD(23,8)}
--SQRT
select sqrt(25);
select sqrt(49);
--string functions
select ascii('R');
SELECT LEN('Hello Everyone');
SELECT LOWER ('Hello Everyone'); 
SELECT REPLACE ('Hiiiiiiii','H','A');
SELECT REVERSE('Hello Everyone');
--date functions
SELECT GETDATE() AS currentdatetime
select * from orders
select datepart(yyyy,orderdate) as orderyear from orders
select orderid,dateadd(day,30,orderdate) as orderpaydate from orders
select datediff(day,'2021-06-05','2021-08-04') as differencedate
select convert (varchar(19),getdate())