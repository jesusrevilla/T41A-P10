SELECT memid, telephone
FROM cd.members
WHERE telephone LIKE '%(%)%'
ORDER BY memid;
