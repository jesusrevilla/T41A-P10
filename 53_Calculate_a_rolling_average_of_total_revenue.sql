WITH dates AS (
  /* build a calendar so days with no revenue appear as zero */
  SELECT gs::date AS d
  FROM generate_series(date '2012-07-18', date '2012-08-31', interval '1 day') AS gs
),
daily AS (
  SELECT
    d.d AS day,
    COALESCE(SUM(b.slots *
                 CASE WHEN b.memid = 0 THEN f.guestcost ELSE f.membercost END), 0) AS revenue
  FROM dates d
  LEFT JOIN cd.bookings b
         ON b.starttime >= d.d
        AND b.starttime <  d.d + interval '1 day'
  LEFT JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY d.d
),
rolling AS (
  /* rolling 15-day average including the current day */
  SELECT
    day::date AS date,
    AVG(revenue) OVER (ORDER BY day ROWS BETWEEN 14 PRECEDING AND CURRENT ROW) AS revenue
  FROM daily
)
SELECT date, revenue
FROM rolling
WHERE date >= date '2012-08-01' AND date < date '2012-09-01'
ORDER BY date;
