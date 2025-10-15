
select facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE membercost >0 and membercost < (monthlymaintenance/50);
