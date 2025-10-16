-- Control which rows are retrieved - part 2
-- How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.
select facid, name, membercost, monthlymaintenance from cd.facilities where membercost > 0 and membercost < (monthlymaintenance/50);
