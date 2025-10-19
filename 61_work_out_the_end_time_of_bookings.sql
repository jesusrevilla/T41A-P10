--Work out the end time of bookings
SELECT starttime, starttime + slots*(INTERVAL '30 minutes') endtime FROM cd.bookings ORDER BY endtime DESC, starttime DESC LIMIT 10;
