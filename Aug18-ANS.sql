--1) Print all the customer details
select * from customers
--2) Prin the product name and unit price
select ProductName, UnitPrice from Products 

--3) For a given supplier name print all the products
select productname from products
where SupplierID =(
select SupplierID from Suppliers
where ContactName='charlotte cooper')

--4) Print the number of order for every customer
select CustomerID ,count(*) 'Number of orders' from Orders
group by CustomerID

--5) For a given shipping company name print number of orders for every customer
select CustomerID,count(orderid)  'number of orders'
from Orders
where Shipvia =
(select ShipperID from Shippers
where CompanyName='speedy express')
group by CustomerID

--6) Print teh customer ID and the number of orders placed sorderd by the orders in descending order
select CustomerID, count(*) as 'Number Of Orders' 
from Orders group by CustomerID order by count(*) desc

--7) print the average price of items supplied by every supplier
select s.CompanyName, avg(p.unitPrice)as 'Average pirce' 
from Products p join Suppliers s on p.SupplierID = s.SupplierID 
group by s.CompanyName
--8) Print the avertage price of products supplied by every supplier
select avg(unitprice) as average,SupplierID  
from products group by SupplierID
select s.CompanyName, avg(p.UnitPrice) 'The average price of a products' from Suppliers s join Products p on s.SupplierID = p.SupplierID
group by s.CompanyName

--9) Print the total price of every order
select orderid,sum((UnitPrice*Quantity) - ((UnitPrice*Quantity) * discount)) 'total bill'
from [Order Details]
group by OrderID


--10) Given a category name print the prodcts in it
select ProductName 'ProductName in Confections category' from Products where CategoryID in 
(select CategoryID from Categories where CategoryName = 'Confections')

--11) Print the product name, supplier name for all the products
Select P.ProductName, S. CompanyName 
from Products P join Suppliers S on P.SupplierID=S.SupplierID


--12) Print the customer name and the total sales done by the customer
select ContactName 'customer name',count(orderid) 'number of orders'
from Customers c join Orders o on c.CustomerID = o.CustomerID
group by o.CustomerID,ContactName
--13) Print the customer name, product name,category name and supplier name
select c.contactName 'customerName' ,p.productName,ct.categoryName,s.companyName'SupplierName' from 
products p 
join Categories ct on p.CategoryID=ct.CategoryID 
join Suppliers s on p.SupplierID=s.SupplierID
join [Order Details] od on od.ProductID=p.ProductID
join Orders o on o.OrderID=od.OrderID
join Customers c on c.CustomerID=o.CustomerID

--14) Print the shipper name, customer name, product name and the full name of employee who took the order

--15) Print the product name and the total order price for every product
select ProductName, sum(od.UnitPrice*od.Quantity) 'total order price for every product'
from Products p join [Order Details] od on p.ProductID=od.ProductID 
group by ProductName
