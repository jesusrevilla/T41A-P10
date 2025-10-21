--Produce a count of the number of facilities that have a cost to guests of 10 or more.
select count(*) from cd.facilities where guestcost >= 10;          
