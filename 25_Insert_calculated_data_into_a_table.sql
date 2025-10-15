INSERT INTO cd.facilities
  (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance)
SELECT MAX(facid) + 1, 'Spa', 20, 30, 100000, 800
FROM cd.facilities;
