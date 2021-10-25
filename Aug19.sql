select concat(fname,'',lname) 'Author name', p.pub_name from employee e join publishers p on e.pub_id = p.pub_id
---publishers not in the publish the a book

select pub_id from publishers where pub_id not in( select distinct pub_id from titles )

--inner join
select pub_name,count(title_id) from publishers p
join titles t on p.pub_id = t.pub_id
group by pub_name

--outer join
select pub_name as 'publication',count(title_id) as 'no of books published' from publishers p
left outer join titles t on p.pub_id = t.pub_id
group by pub_name order by 2

select title, concat(au_fname,'',au_lname) as 'auther name' from 
titleauthor ta right outer join authors a
on ta.au_id = a.au_id
left outer join titles t on ta.title_id = t.title_id
order by 1

select * from titles
select title, (price * ytd_sales) as 'total sales price' from titles

select title 'Title', count(*) 'Amount' from titles t left join sales s on t.title_id = s.title_id group by title order by 2

select title 'Book Name', t.price*s.qty as 'Total Sales Amount' from titles t left join sales s on t.title_id=s.title_id order by 2

--slef join
create table cust
(id  int identity(1,1) primary key,
name varchar(20),
refferby int)

alter table cust
add constraint fk_reff foreign key(refferby) references cust(id)

insert into cust(name,refferby) values('James',null)
insert into cust(name,refferby) values('Jill',1)
insert into cust(name,refferby) values('Jack',1)
insert into cust(name,refferby) values('Jonas',2)
select * from cust
select cus.name 'name', ref.name 'reffered by' from
cust cus left outer join cust ref on cus.refferby = ref.id


---union
select city from authors union select city from publishers order by 1

select city from authors union all select city from publishers order by 1