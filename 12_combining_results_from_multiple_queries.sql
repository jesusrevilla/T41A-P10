--Combining results from multiple queries
SELECT surname FROM cd.members UNION SELECT name FROM cd.facilities;
