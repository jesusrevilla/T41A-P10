SELECT  b.starttime FROM cd.bookings b JOIN cd.members m ON b.memid=m.memid WHERE m.surname='Farrell' AND m.firstname='David'; 
