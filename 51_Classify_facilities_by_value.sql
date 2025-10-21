WITH revenue AS (
  SELECT
    f.facid,
    f.name,
    SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END) AS rev
  FROM cd.bookings b
  JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY f.facid, f.name
),
ranked AS (
  SELECT
    name,
    NTILE(3) OVER (ORDER BY rev DESC) AS tile
  FROM revenue
)
SELECT
  name,
  CASE tile WHEN 1 THEN 'high'
            WHEN 2 THEN 'average'
            ELSE 'low'
  END AS revenue
FROM ranked
ORDER BY tile, name;
