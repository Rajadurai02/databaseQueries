insert into Flowers values ('Purple Orchid Bouquet','bunch of 6 Purple Orchids',649,5,'/assets/Images/purple.PNG')
insert into Flowers values ('Red Velevt Roses','bunch of 12 red roses in red paper packing',549,10,'/assets/Images/red.PNG')
insert into Flowers values ('Pleasing Lily Rose Vase','Arrangement of 5 pink Lilies and 10 pink cyclinder vase roses',1799,2,'/assets/Images/lilly.PNG')
insert into Flowers values ('Happy to Felicitate','bunch of 12 yellow Gerberas',499,5,'/assets/Images/yellow.PNG')
insert into Flowers values ('Peaceful white roses Bouquet','Bunch of 12 white roses in white paper packing',599,5,'/assets/Images/white.PNG')

update Flowers set FlowerPrice = 150,FlowerQty = 10 where FlowerID = 6;
delete from Flowers where FlowerID = 8;




--------------------------------------------------------------------------------------------------------------------
select * from Users
select * from Flowers
select * from Orders
--select * from FlowerOrders