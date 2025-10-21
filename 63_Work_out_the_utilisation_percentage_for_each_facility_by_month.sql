WITH per_fac_month AS (
  SELECT
    f.name,
    date_trunc('month', b.starttime) AS month,
    SUM(b.slots) AS slots                    -- slots are 30 mins each
  FROM cd.bookings b
  JOIN cd.facilities f ON f.facid = b.facid
  GROUP BY f.name, date_trunc('month', b.starttime)
)
SELECT
  name,
  month,
  ROUND(
    (slots::numeric) /
    ((( (month + INTERVAL '1 month')::date - month::date) * 25)::numeric) * 100,
    1
  ) AS utilisation
FROM per_fac_month
ORDER BY name, month;
