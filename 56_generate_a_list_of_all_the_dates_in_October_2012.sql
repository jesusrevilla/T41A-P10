--Generate a list of all the dates in October 2012
SELECT GENERATE_SERIES(timestamp '2012-10-01', timestamp '2012-10-31', INTERVAL '1 day');
