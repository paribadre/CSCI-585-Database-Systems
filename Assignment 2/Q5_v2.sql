-- Oracle

-- There are two tables, "Desserts" (containing names of chef with the dishes they can make) and "Dishes" (Names the dishes requested by client).This is an example of implementing SET DIVISION.
-- 1. WHERE: This operation returns names of chefs who can make any of the dishes listed in the table "Dishes". It returns multiple rows of chef names.
-- 2. GROUP BY: In order to resolve the issue, it is necessary to group all queries by the Chef's names.
-- 3. HAVING: The WHERE condition returns names of Chefs who can make any of the dishes. Since we want chefs who can make all of the dishes, we count the number of Dishes in the "Dishes" table and also count the number of dishes each chef can make. If they are equal, the Chef's name is selected.


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

select Chef
from Desserts
where Dish in (select * from Dishes)
group by Chef
having Count(Dish)=(select count(*) from Dishes)
;
