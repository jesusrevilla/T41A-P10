SELECT surname
FROM cd.members
UNION
SELECT name
FROM cd.facilities
ORDER BY surname;
