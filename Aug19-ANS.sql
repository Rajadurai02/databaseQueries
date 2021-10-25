--1 For each order, calculate a subtotal for each Order (identified by OrderID). 

select orderid, count(orderid) as 'sub total' from [Order Details] group by OrderID

--2 get the year part from Shipped_Date column.

select year(shippeddate) as year from orders

--3 For each employee, get their sales amount, broken down by country name.
select * from Employees
select sum(unitprice) as 'total sales amount' from [Order Details] group by OrderID
select concat(firstname,' ',lastname) as employeename, e.EmployeeID,country,orderid from employees e
join orders o on e.EmployeeID = o.EmployeeID
--4 What does this query do?

select distinct b.*, a.CategoryName
from Categories a 
inner join Products b on a.CategoryID = b.CategoryID
where b.Discontinued = 1
order by b.ProductName;

--5 What is the diff between the query a and b
--a
 select distinct a.CategoryID, 
    a.CategoryName,  
    b.ProductName, 
    sum(round(y.UnitPrice * y.Quantity * (1 - y.Discount), 2)) as ProductSales
from [Order Details] y
inner join Orders d on d.OrderID = y.OrderID
inner join Products b on b.ProductID = y.ProductID
inner join Categories a on a.CategoryID = b.CategoryID
where d.OrderDate between ('1997/1/1') and ('1997/12/31')
group by a.CategoryID, a.CategoryName, b.ProductName
order by a.CategoryName, b.ProductName, ProductSales;

--b 
 select a.CategoryName, 
    b.ProductName, 
    sum(c.ExtendedPrice) as ProductSales
from Categories a 
inner join Products b on a.CategoryID = b.CategoryID
inner join 
(
    select distinct y.OrderID, 
        y.ProductID, 
        x.ProductName, 
        y.UnitPrice, 
        y.Quantity, 
        y.Discount, 
        round(y.UnitPrice * y.Quantity * (1 - y.Discount), 2) as ExtendedPrice
    from Products x
    inner join [Order Details] y on x.ProductID = y.ProductID
    order by y.OrderID
) c on c.ProductID = b.ProductID
inner join Orders d on d.OrderID = c.OrderID
where d.OrderDate between ('1997/1/1') and ('1997/12/31')
group by a.CategoryID, a.CategoryName, b.ProductName
order by a.CategoryName, b.ProductName, ProductSales;




