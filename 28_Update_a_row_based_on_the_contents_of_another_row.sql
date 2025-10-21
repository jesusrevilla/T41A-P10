--Update a row based on the contents of another row
--We want to alter the price of the second tennis court so that it costs 10% more than the first one. 
--Try to do this without using constant values for the prices, so that we can reuse the statement if we want to.
UPDATE cd.facilities SET 
membercost=(SELECT membercost FROM cd.facilities WHERE name = 'Tennis Court 1')*1.1,
guestcost=(SELECT guestcost FROM cd.facilities WHERE name ='Tennis Court 1')*1.1
WHERE name='Tennis Court 2';
