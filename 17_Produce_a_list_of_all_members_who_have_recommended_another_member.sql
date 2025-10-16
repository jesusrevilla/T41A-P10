SELECT DISTINCT m1.firstname, m1.surname
FROM cd.members AS m1
JOIN cd.members AS m2
  ON m2.recommendedby = m1.memid
ORDER BY m1.surname, m1.firstname;
