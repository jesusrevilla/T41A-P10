--List each member's first booking after September 1st 2012
SELECT cdm.surname, cdm.firstname, cdm.memid, MIN(cdb.starttime) FROM cd.bookings cdb INNER JOIN cd.members cdm ON cdb.memid = cdm.memid WHERE starttime >= '2012-09-01' GROUP BY cdm.surname, cdm.firstname, cdm.memid ORDER BY memid;
