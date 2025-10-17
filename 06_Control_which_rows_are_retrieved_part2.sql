SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE membercost > 0 AND monthlymaintenance/50 > membercost;
