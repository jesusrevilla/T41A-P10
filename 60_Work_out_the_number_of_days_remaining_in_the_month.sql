SELECT (
  (date_trunc('month', TIMESTAMP '2012-02-11 01:00:00') + INTERVAL '1 month')::date
  - (TIMESTAMP '2012-02-11 01:00:00')::date
) * INTERVAL '1 day' AS remaining;
