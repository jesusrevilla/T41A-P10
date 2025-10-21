SELECT recommendedby, COUNT(*) AS count
FROM cd.members
WHERE recommendedby != 0
GROUP BY recommendedby
ORDER BY recommendedby;
