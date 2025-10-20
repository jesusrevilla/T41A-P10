--Count the number of expensive facilities
--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(facid) FROM cd.facilities WHERE guestcost>=10;
