--Control which rows are retrieved - part 2
SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities 
WHERE membercost > 0 AND membercost < (monthlymaintenance/50);
