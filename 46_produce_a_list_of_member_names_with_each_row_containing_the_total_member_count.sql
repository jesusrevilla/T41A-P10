--Produce a list of member names, with each row containing the total member count
SELECT (SELECT COUNT(*) FROM cd.members), firstname, surname FROM cd.members ORDER BY joindate;
