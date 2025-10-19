--Work out the number of seconds between timestamps
SELECT CAST(EXTRACT(EPOCH FROM timestamp '2012-09-02 00:00:00' - timestamp '2012-08-31 01:00:00') AS INT);
