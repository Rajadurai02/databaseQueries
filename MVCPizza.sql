Select * from PizzaDetails
sp_help PizzaDetails

insert into PizzaDetails(PizzaName,PizzaPrice,PizzaType) values ('Margherita',20,'Plain')
insert into PizzaDetails(PizzaName,PizzaPrice,PizzaType) values ('Cheese N Corn',30,'Cheezy')
insert into PizzaDetails(PizzaName,PizzaPrice,PizzaType) values ('Cheese N Tomato',30,'Cheezy')
insert into PizzaDetails(PizzaName,PizzaPrice,PizzaType) values ('Chicken Pepperoni',50,'Spicy')
insert into PizzaDetails(PizzaName,PizzaPrice,PizzaType) values ('Indi Tandoori',45,'Spicy')

insert into Toppings(ToppingName,ToppingPrice) values ('Olives',2)
insert into Toppings(ToppingName,ToppingPrice) values ('Tomato',5)
insert into Toppings(ToppingName,ToppingPrice) values ('Onion',4)
insert into Toppings(ToppingName,ToppingPrice) values ('Cheese',6)
select * from UserLoginDetails
insert into UserLoginDetails values ('raja@gmail.com','raja','1234','Thoothukudi','1234567890')
insert into Orders values (1,500,25,'Confirmed')