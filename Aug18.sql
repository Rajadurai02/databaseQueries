select * from titles
select title,price,type from titles
select title book_name ,price book_price from titles
select * from titles where price > 20
select * from titles where price < 5
select * from titles where price > 5 and price < 10
select * from titles where price between 10 and 20
select * from titles where price > 10 and type = 'psychology'
select title,price from titles where advance > 3500
select title from titles where type = 'business' or type = 'mod_cook'
select title from titles where type in('business','mod_cook')
select * from titles where pubdate > '1900-03-12'
select title, price from titles where price is null
select title, price from titles where price is not null
select min(price) 'minumum price' from titles
select max(price) 'maximum price' from titles
select avg(price) 'average price' from titles
select avg(price) 'average price' from titles where type in('business','mod_cook')
select type from titles
select distinct type from titles
select type,avg(price) from titles group by type
select pub_id,count(*) as 'count', avg(price) as 'price' from titles group by pub_id
select type,avg(price) from titles group by type having avg(price) > 10
select pub_id,count(title_id) as 'no of books sold' from titles where type in('business','mod_cook') group by pub_id having count(title_id) > 2
select * from titles order by price
select * from titles order by price desc
select * from titles where price > 15 order by pubdate


select * from authors
select * from authors where state = 'CA' 
select * from authors where city in('Oakland','Salt Lake City')
select count(au_id) 'authors from CA' from authors where state = 'CA' 
select count(au_id)  from authors where state = 'CA'
select city,count(au_id) 'no of authors' from authors group by city

select * from sales
select * from sales where qty > 2
select title_id,min(qty) from sales group by title_id
select title_id,avg(qty) as 'average' from sales group by title_id having avg(qty) > 4

select * from employee
select pub_id,min(hire_date) as 'first hiring date' from employee group by pub_id
select pub_id,count(emp_id) as 'no of employees' from employee group by pub_id having count(emp_id) > 2
select pub_id,count(emp_id) as 'no of employees' from employee group by pub_id having count(emp_id) > 2 order by count(emp_id)
-- in order by 2 represents the column that present in number 2 
select pub_id,count(emp_id) as 'no of employees' from employee group by pub_id having count(emp_id) > 2 order by 2



----------Sub query------------
select * from publishers
select pub_id from publishers where country = 'USA'

select * from titles where pub_id in (select pub_id from publishers where country = 'USA')

select title_id from titles where price > 10

select * from sales where title_id in (select title_id from titles where price > 10)

select city from publishers where pub_name = 'Algodata Infosystems'

select * from authors where city in (select city from publishers where pub_name = 'Algodata Infosystems')

select pub_id from titles where title = 'Straight Talk About Computers'

select pub_id from publishers where pub_id = (select pub_id from titles where title = 'Straight Talk About Computers')

select concat(fname,'',lname) from employee where pub_id in (select pub_id from publishers where pub_id = (select pub_id from titles where title = 'Straight Talk About Computers'))


-------joins------ 
select title, pub_name from publishers join titles on publishers.pub_id = titles.pub_id

select title, pub_name from publishers p join titles t on p.pub_id = t.pub_id

select concat(au_fname,'',au_lname) 'Author name', title 'Book name' from titles t join titleauthor ta on t.title_id = ta.title_id
join authors a on a.au_id = ta.au_id
select title, t.price*s.qty as 'total price' from titles t join sales s on t.title_id = s.title_id

select concat(fname,'',lname) 'Author name', p.pub_name from employee e join publishers p on e.pub_id = p.pub_id