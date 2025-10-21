SELECT gs::timestamp AS ts
FROM generate_series(
  TIMESTAMP '2012-10-01 00:00:00',
  TIMESTAMP '2012-10-31 00:00:00',
  INTERVAL '1 day'
) AS gs;
