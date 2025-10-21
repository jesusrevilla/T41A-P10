SELECT
  EXTRACT(MONTH FROM d)::int AS month,
  (( (d + INTERVAL '1 month')::date - d::date) * INTERVAL '1 day') AS length
FROM generate_series(
       TIMESTAMP '2012-01-01',
       TIMESTAMP '2012-12-01',
       INTERVAL '1 month'
     ) AS g(d)
ORDER BY month;
