--Update multiple rows and columns at the same time
UPDATE cd.facilities SET membercost = 6, guestcost = 30 WHERE name IN ('Tennis Court 1', 'Tennis Court 2');
