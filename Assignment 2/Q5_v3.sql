-- Oracle

-- There are two tables, "Desserts" (containing names of chef with the dishes they can make) and "Dishes" (Names the dishes requested by client).This is an example of implementing SET DIVISION.
--The innermost query selects those rows from the "Desserts" table that can make any of the required dishes. However this has multiple chef name duplicates. The query outside uses a "not exist" operator which leads to selecting those dishes that are not in the inner query. The outer query selects distinct chefs which successfully give the chef's names that can make the dishes since it uses another not exists and deselects the dishes.

create table Desserts (  
    Chef varchar2(1) not null,  
    Dish varchar2(30) not null,
    primary key(Chef, Dish)
);
create table Dishes (  
    Dish varchar2(30) not null constraint dishes_pk primary key  
);

insert all 
into Desserts values('A', 'Mint chocolate brownie') 
into Desserts values('B', 'Upside down pineapple cake') 
into Desserts values('B', 'Creme brulee') 
into Desserts values('B', 'Mint chocolate brownie') 
into Desserts values('C', 'Upside down pineapple cake') 
into Desserts values('C', 'Creme brulee') 
into Desserts values('D', 'Apple pie') 
into Desserts values('D', 'Upside down pineapple cake') 
into Desserts values('D', 'Creme brulee') 
into Desserts values('E', 'Apple pie') 
into Desserts values('E', 'Upside down pineapple cake') 
into Desserts values('E', 'Creme brulee') 
into Desserts values('E', 'Bananas Foster') 
select * from dual;
insert all 
into Dishes values ('Apple pie') 
into Dishes values ('Upside down pineapple cake') 
into Dishes values ('Creme brulee') 
select * from dual;

select * from Desserts;
select * from Dishes;

select distinct x.Chef
from Desserts x
where not exists (
select *
from Dishes y
where not exists (
select *
from Desserts z
where (z.Chef=x.Chef)
and (z.Dish=y.Dish)));

