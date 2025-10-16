SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
FROM cd.facilities
WHERE facid IN (1, 5);
