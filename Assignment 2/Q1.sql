-- PostgreSQL

create or replace function chk_room(Room in integer, Arrival in date, Departure in date)
returns integer as $temp$
declare temp integer;
begin
    select count(*) into temp
    from HotelStays
    where roomNum = Room and 
 ((Arrival > depDate) or (Departure > arrDate));
    return temp;
end;
$temp$ LANGUAGE plpgsql;
 
create table HotelStays (
    roomNum integer not null,
    arrDate date not null,
    depDate date not null,
    guestName varchar(30) not null,
    primary key (roomNum, arrDate),
    constraint check_date check(depDate > arrDate),
    constraint check_function check(chk_room(roomNum, arrDate, depDate) = 0)
);


-- Correct insertions
insert into HotelStays(roomNum, arrDate, depDate, guestName) values (123, to_date('20160310', 'YYYYMMDD'), to_date('20160318','YYYYMMDD'), 'A');
insert into HotelStays(roomNum, arrDate, depDate, guestName) values (123, to_date('20160320', 'YYYYMMDD'), to_date('20160325','YYYYMMDD'), 'B');
-- Incorrect (violates arrDate > depDate)
insert into HotelStays(roomNum, arrDate, depDate, guestName) values (201, to_date('20160217', 'YYYYMMDD'), to_date('20160209','YYYYMMDD'), 'C');
-- Incorrect (violates overlapping dates)
insert into HotelStays(roomNum, arrDate, depDate, guestName) values (123, to_date('20160308', 'YYYYMMDD'), to_date('20160311','YYYYMMDD'), 'B');

select *
from HotelStays;

select *
from HotelStays;