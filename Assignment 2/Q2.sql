-- Oracle

CREATE TABLE CLASS ( 
SID NUMERIC, 
ClassName VARCHAR2(6) NOT NULL, 
Grade CHAR(1), 
PRIMARY KEY (SID, ClassName) 
);


insert all 
    into CLASS values (123, 'ART123', 'A')
    into CLASS values (123, 'BUS456', 'B')
    into CLASS values (666, 'REL100', 'D')
    into CLASS values (666, 'ECO966', 'A')
    into CLASS values (666, 'BUS456', 'B')
    into CLASS values (345, 'BUS456', 'A')
    into CLASS values (345, 'ECO966', 'F')
select * from dual;

select * from CLASS;

select ClassName, count(SID) as Total
from CLASS
group by ClassName
order by Total;
