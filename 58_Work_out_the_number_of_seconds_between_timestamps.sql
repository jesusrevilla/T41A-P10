--Work out the number of seconds between timestamps
--Work out the number of seconds between the timestamps '2012-08-31 01:00:00' and '2012-09-02 00:00:00'
select extract(epoch from (timestamp '2012-09-02 00:00:00' - '2012-08-31 01:00:00'));  
