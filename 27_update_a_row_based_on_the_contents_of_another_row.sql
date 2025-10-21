--Update a row based on the contents of another row
UPDATE cd.facilities SET membercost = (membercost*1.1), guestcost = (guestcost*1.1) WHERE name IN ('Tennis Court 2');
