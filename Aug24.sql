--trigger
create table table_trigger_example
(f1 int identity(1,1) primary key,
f2 varchar(20))
create trigger trigger_insert_check
on table_trigger_example
for insert
as
begin
	print 'hello from insert trigger'	
end
insert into table_trigger_example values('one')

alter trigger trigger_insert_check
on table_trigger_example
for insert
as
begin
	declare
		@name varchar(20)
		set @name = (select f2 from inserted)
		print 'hello '+@name	
end
insert into table_trigger_example values('Raja')

--
create table employeesSample
(empId int identity(1,1) primary key,
empname varchar(20))
create table salarys
(salid varchar(4) primary key,
basic float,
hra float,
da float,
deductions float)

create table employeesal
(empid int foreign key references employeesSample(empid),
salid varchar(4) foreign key references salarys(salid),
totalsalary float)

insert into employeesSample values ('Raja')
insert into employeesSample values ('Durai')
insert into salarys values ('S002',12000,6000,4500,1800)

create trigger tri_total_salary
on employeesal
for insert
as
begin
declare
	@totalsalary float
	set @totalsalary = (select (basic+hra+da-deductions) from salarys where salid = (select salid from inserted))
	update employeesal set totalsalary = @totalsalary where empid = (select empid from inserted) and salid = (select salid from inserted)
end
insert into employeesal(empid,salid) values(2,'S002')
select * from employeesal


--cursor
declare
@empid int,@salid varchar(4),@totalsalary float,@empname varchar(20)
print 'salary details'
print'-----------------'
declare cur_sal cursor for
select * from employeesal
open cur_sal
fetch next from cur_sal into @empid,@salid,@totalsalary
while (@@FETCH_STATUS = 0)
	begin
		set @empname = (select empname from employeesSample where empid = @empid)
		print 'Employee Id '+cast(@empid as varchar(2))
		print 'Employee Name'+@empname
		print 'Salary Id '+@salid
		print 'total salary '+cast(@totalsalary as varchar(8))
		print '**************************'
		fetch next from cur_sal into @empid,@salid,@totalsalary
	end
close cur_sal
deallocate cur_sal
--trigger another example
create table tblanotheremp(id int ,name varchar(100)) 
ALTER trigger insert_into_anothertable 
on tblemp 
for insert 
as 
begin 
declare 
@id int,@name varchar(100) 
set @id=(select id from inserted) 
set @name=(select name from inserted) 
insert into tblanotheremp(id,name) values(@id,@name) 
end


--cursor example

select * from authors
declare @bookname varchar(30),@bookprice float,@au_lname varchar(30),@au_fname varchar(30),@quantity float,@totalprice float
print 'Book details'
print'-----------------'
declare cur_book_detail cursor for
select title,price,au_lname,au_fname,ytd_sales from titles t join titleauthor ta on t.title_id = ta.title_id join authors a on ta.au_id = a.au_id group by t.title_id,a.au_id
open cur_book_datail
fetch next from cur_book_datail into @bookname,@bookprice,@au_lname,@au_fname,@quantity,@totalprice
while (@@FETCH_STATUS = 0)
	begin
		declare @author varchar(50)
		set @author = concat(@au_fname,' ',@au_lname)
		set @totalprice = @quantity * @bookprice
		print 'Book Name '+@bookname
		print 'Book price '+@bookprice
		print 'Author name '+@author
		print 'Quantity '+@quantity
		print 'Total Price'+@totalprice
		print '**************************'
		fetch next from cur_sal into @bookname,@bookprice,@au_lname,@au_fname,@quantity,@totalprice
	end
close cur_book_detail
deallocate cur_book_datail