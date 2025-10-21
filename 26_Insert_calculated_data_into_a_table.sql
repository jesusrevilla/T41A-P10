INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
VALUES ((SELECT MAX(facid) + 1 FROM cd.facilities), 'Spa', 20, 30, 100000, 800);
