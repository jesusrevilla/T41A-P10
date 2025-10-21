SELECT
	mems.surname,
	mems.firstname,
	bks.memid,
	bks.starttime
FROM
	cd.members mems
INNER JOIN (
	SELECT
		memid,
		MIN(starttime) AS starttime
	FROM
		cd.bookings
	WHERE
		starttime >= '2012-09-01'
	GROUP BY
		memid
) bks ON mems.memid = bks.memid
ORDER BY
	mems.memid;
