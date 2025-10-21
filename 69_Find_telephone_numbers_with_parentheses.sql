--Find telephone numbers with parentheses
--You've noticed that the club's member table has telephone numbers with very inconsistent formatting. You'd like to find all the telephone numbers that contain parentheses, returning the member ID and telephone number sorted by member ID.

select memid, telephone from cd.members where telephone ~ '[()]';
