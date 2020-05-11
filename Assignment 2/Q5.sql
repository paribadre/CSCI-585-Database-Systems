-- Oracle

-- There are two tables, "Desserts" (containing names of chef with the dishes they can make) and "Dishes" (Names the dishes requested by client).This is an example of implementing SET DIVISION.
-- We implement this using the 'minus' operator. The idea is to select all chefs from the "Desserts" table and remove the chefs that do not make the dishes. The innermost query makes a product of the chef column from "Desserts" and the "Dishes" table. This gives all possible combinations of chefs and the dishes required. We then, find the difference between this newly produced table and the main "Desserts" table which gives a list of chefs and the required dishes they cannot create. From this, we select only the names of chefs (These are the chefs that do not satisfy the criteria of producing all the dishes) and subtract it from all the chef's names in the "Desserts" table.


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


SELECT Chef FROM Desserts
minus
SELECT Chef FROM (
SELECT *
FROM (select Chef FROM Desserts), Dishes
minus
SELECT * FROM Desserts);

