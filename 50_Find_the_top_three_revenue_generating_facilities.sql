WITH revenue AS (
  SELECT
    f.facid,
    f.name,
    SUM(b.slots * CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END) AS revenue
  FROM cd.bookings b
  JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY f.facid, f.name
),
ranked AS (
  SELECT
    name,
    RANK() OVER (ORDER BY revenue DESC) AS rank
  FROM revenue
)
SELECT name, rank
FROM ranked
WHERE rank <= 3
ORDER BY rank, name;
