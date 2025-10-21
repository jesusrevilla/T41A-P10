UPDATE cd.facilities 
SET membercost = membercost * 1.1,
    guestcost = guestcost * 1.1
WHERE name = 'Tennis Court 2';
