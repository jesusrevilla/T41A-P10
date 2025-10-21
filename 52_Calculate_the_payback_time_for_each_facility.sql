WITH rev_3m AS (
  SELECT
    f.facid,
    f.name,
    SUM(
      b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END
    ) AS revenue_3m
  FROM cd.facilities f
  LEFT JOIN cd.bookings b
         ON b.facid = f.facid
        AND b.starttime >= DATE '2012-07-01'
        AND b.starttime <  DATE '2012-10-01'   -- 3 meses completos: Jul–Sep 2012
  GROUP BY f.facid, f.name
)
SELECT
  f.name,
  f.initialoutlay / ((COALESCE(r.revenue_3m,0) / 3.0) - f.monthlymaintenance) AS months
FROM cd.facilities f
LEFT JOIN rev_3m r USING (facid)
WHERE (COALESCE(r.revenue_3m,0) / 3.0) - f.monthlymaintenance > 0   -- payback positivo
ORDER BY f.name;
