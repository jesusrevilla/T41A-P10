SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities WHERE membercost < (monthlymaintenance
/50) AND membercost>0; 
