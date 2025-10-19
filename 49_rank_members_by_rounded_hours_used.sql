--Rank members by (rounded) hours used
SELECT firstname, surname, ((SUM(cdb.slots)+10)/20)*10 AS hours,
	RANK() over (ORDER BY ((SUM(cdb.slots)+10)/20)*10 DESC) AS rank	FROM cd.bookings cdb
	INNER JOIN cd.members cdm ON cdb.memid = cdm.memid group BY cdm.memid ORDER BY rank, surname, firstname;
