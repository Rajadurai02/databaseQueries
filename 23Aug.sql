---procedure
create procedure proc_first
as
begin
	print('I just created a procedure')
end
execute proc_first
--adding parameters
create procedure proc_param(@username varchar(20))
as
begin
	print'I just created a procedure by '+@username
end
execute proc_param 'Rajadurai'

--adding out parameters
create procedure proc_param_out(@username varchar(20),@msg varchar(100) out)
as
begin
	set @msg = 'I just created a procedure by '+@username
end
declare
	@mymsg varchar(100)
	execute proc_param_out 'Rajadurai',@mymsg out
	print @mymsg

--adding query into procedure
create proc proc_getAllDetails
as
	select * from authors
exec proc_getAllDetails

create proc proc_author_specific_details(@aid varchar(20))
as
	select * from authors where au_id = @aid

exec proc_author_specific_details '409-56-7008'
select * from titles
create proc proc_getTitle (@titleid varchar(10))
as
	select title from titles where title_id = @titleid
exec proc_getTitle 'MC2222'

alter proc proc_getName(@aid varchar(20),@afname varchar(50) out)
as
	set @afname = (select concat(au_fname,' ',au_lname) from authors where au_id = @aid)
declare
	@fullname varchar(50)
	exec proc_getName '409-56-7008',@fullname out
	print @fullname


--insert a value using procedure
create table smpl
(id int identity(101,1) primary key,
name varchar(30),
age int)

create proc proc_smpl (@name varchar(30),@age int)
as
	insert into smpl(name,age) values(@name,@age)
exec proc_smpl 'Raja',21
select * from smpl

create table Sampletable
(id int identity(101,1) primary key,
name varchar(30),
age int)

create proc proc_sampleTable1(@name varchar(30),@age int)
as
	insert into Sampletable(name,age) values(@name,@age)
exec proc_sampleTable1'Raja',21
select * from SampleTable

--updating data
create proc update_values(@id int,@age int)
as 
	update sampleTable set age=@age where id=@id
exec update_values 101,20
	select * from sampleTable

--function creation
create function fn_sample()
returns varchar(20)
as
begin
	return 'Rajadurai'
end

select dbo.fn_sample()

--adding parameters into function
create function fn_sample_with_value(@name varchar(20))
returns varchar(20)
as
begin
	return 'Hello '+@name
end

select dbo.fn_sample_with_value('Coders')

--using tables in function
create function fn_calculate_tax(@value float)
returns float
as
begin
declare
	@netValue float
	set @netValue = @value+(@value*12.3/100)
	return @netValue
end
select dbo.fn_calculate_tax(advance) from titles

select * from titles
create function fn_calculate_adv_sub_price(@advance float,@price float)
returns float
as
begin
declare
	@net float
	set @net = @advance - @price
	return @net
end
select dbo.fn_calculate_adv_sub_price(advance,price) from titles

--table valued functions
create function fn_table_valued(@id int,@name varchar(20))
returns @mytable table (id int,name varchar(20))
as
begin
	insert into @mytable values(@id,concat('hi ',@name))
	return
end
select * from dbo.fn_table_valued(1,'raja')

--join in function
create function fn_getsalesdetails(@tid varchar(20))
returns @saletable table (ordernumber varchar(10), quantity int,price float)
as
begin
	insert into @saletable
	select ord_num, qty,price from sales join titles on sales.title_id = titles.title_id
	where sales.title_id = @tid
	return 
end
select * from titles
select * from dbo.fn_getsalesdetails('BU7832')


---23 aug work
create table employees
(empId int identity(101,1) primary key,
empname varchar(20),
address varchar(40))
create table salary
(salid int identity(1,1) primary key,
basic float,
hra float,
da float,
deductions float)

create table employeesalary
(empid int foreign key references employees(empid),
salid int foreign key references salary(salid),
extra float,
saldate date,primary key(empid,salid))
--procedure to insert the values
create proc insert_into_employees(@name varchar(20),@address varchar(40))
as
	insert into employees(empname,address) values (@name,@address)
exec insert_into_employees 'james','chennai'
exec insert_into_employees 'john','mumbai'
exec insert_into_employees 'josesph','delhi'
select * from employees

create proc insert_into_salary(@basic float,@hra float,@da float,@deductions float)
as
	insert into salary(basic,hra,da,deductions) values (@basic,@hra,@da,@deductions)

drop proc insert_into_salary
exec insert_into_salary 12000,4000,1200,800 
exec insert_into_salary 15000,5000,1500,1000 
exec insert_into_salary 18000,6000,1800,1400 
create proc insert_into_employeesalary(@empid int,@salid int,@extra float,@saldate date)
as
	insert into employeesalary values (@empid,@salid,@extra,@saldate)
drop proc insert_into_employeesalary

exec insert_into_employeesalary 101,1,5000,'2021-08-30'
exec insert_into_employeesalary 102,2,7000,'2021-08-30'
exec insert_into_employeesalary 103,3,9000,'2021-08-30'

create function cal_total_salary(@basic float,@hra float,@ba float,@deductions float,@extra float)
returns float
as
begin
declare
	@total_salary float
	set @total_salary = @basic+@hra+@ba+@extra-@deductions
	return @total_salary
end
select dbo.cal_total_salary(basic,hra,da,deductions,extra) from salary s join employeesalary e on s.salid = e.salid

--procedure for total salary
alter proc proc_total_sal(@empid int,@totalsalary float out)
as
begin
	set @totalsalary = (select (basic+hra+da+extra-deductions) as 'total salery' from salary s join employeesalary e on s.salid = e.salid where empid = @empid)
declare
	@totalsal float
	exec proc_total_sal 101,@totalsal out
	print @totalsal
end










-------------------------------------------------------
--IF Statement, it evaluates the expressions
--The IF statement can evaluate the expression in  depending upon the conditional expressions
						

--1) IF statement:
        
		--IF satement it just evaluate the condition if expression is true then it will print single block of satement,If the expression evaluates to FALSE, it does not return any output.

		--Syntax:
		                         if(boolean_expression) 
								 BEGIN
										statement(s) will execute if the boolean expression is true 
								 END
   
   
   --Example:
								DECLARE @StudentMarks int=65;
										if @StudentMarks > 35
										PRINT 'student  is passed ';

 --Example with query:

									 Declare @qty int = 50
									if @qty >= 40
									select  s.title_id,t.title 'Title Name' from titles t join sales s on t.title_id=s.title_id

--------------------------------------------------------------------------------------------------------------------------------------

--2) IF- Else statement :

    --if the condition is true, then it executes the statement mentioned in IF block otherwise statements within ELSE clause is executed.

-- syntax : 
								IF (boolean_expression)
								BEGIN
										If the condition is TRUE then execute the following statement;
								ELSE
										If the condition is False then execute the following statement;
								END
								
	--Example : 

													DECLARE @StudentMarks int=25;
													if @StudentMarks >= 35
													PRINT 'student  is passed ';
													ELSE
													print 'student is failed '

-- example in query

														Declare @qty int = 10
														if @qty >= 40
														select  s.title_id,t.title 'Title Name' from titles t join sales s on t.title_id=s.title_id

														else

														print 'Sales of quantity is decreased '

-----------------------------------------------------------------------------------------------------------------------------------------

--3)  Multiple-IF statement or Nested if:
  
	--A nested if is an if statement that is the target of another if statement. Nested if statements mean an if statement inside another if statement

--syntax:							

									if(boolean_expression) 
								       BEGIN
										statement(s) will execute if the boolean expression is true 
										IF (boolean_expression)
											BEGIN
													If the condition is TRUE then execute the following statement;
											ELSE
													If the condition is False then execute the following statement;
											END
                              


--Example:	
								DECLARE @StudentMarks INT= 91;
								IF @StudentMarks >= 90
									PRINT 'Congratulations, You are in Merit list!!';
								IF @StudentMarks >= 80 
								 PRINT 'Congratulations, You are in First division list!!';
								  ELSE
									PRINT 'Failed, Try again ';

									-------------------------------------------------------------------------------


--2) FOR:

    --For loop shall be used to run code inside the loop for the number of times . 

	syntax:

											FOR counter IN initial_value .. final_value LOOP 
										     sequence_of_statements; 
										    END LOOP;

		--Example :
												DECLARE 
											        a int ; 
											    BEGIN 
													FOR a in 10 .. 20 LOOP 
														dbms_output.put_line('value of a: ' || a); 
													END LOOP; 
												END;
												
--simulating  for loop using while loop
declare
 @a int = 0;
 while @a < 5
 begin
	print 'Hello'
	set @a = @a + 1
end


