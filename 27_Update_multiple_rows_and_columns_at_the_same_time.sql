--Update multiple rows and columns at the same time
--We want to increase the price of the tennis courts for both members and guests. Update the costs to be 6 for members, and 30 for guests.
UPDATE cd.facilities SET  guestcost=30, membercost = 6
WHERE name like 'Tennis Court %';
