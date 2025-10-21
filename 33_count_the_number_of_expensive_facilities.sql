--count_the_number_of_expensive_facilities.sql
select count(*) from cd.facilities where guestcost >= 10; 
