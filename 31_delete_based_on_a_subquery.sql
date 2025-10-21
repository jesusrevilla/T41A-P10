--delete_based_on_a_subquery.sql
delete from cd.members where memid not in (select memid from cd.bookings);
