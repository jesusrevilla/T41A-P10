SELECT m.firstname, m.surname, m.joindate FROM cd.members m
JOIN (SELECT MAX(joindate) AS latest_date FROM cd.members) max_date
  ON m.joindate = max_date.latest_date;
