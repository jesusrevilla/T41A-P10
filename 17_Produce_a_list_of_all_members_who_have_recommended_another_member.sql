SELECT firstname, surname FROM cd.members WHERE memid IN (SELECT recommendedby FROM cd.members) 
ORDER BY surname ;
