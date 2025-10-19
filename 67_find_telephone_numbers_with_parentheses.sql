--Find telephone numbers with parentheses
SELECT memid, telephone FROM cd.members WHERE telephone LIKE '(%)%';
