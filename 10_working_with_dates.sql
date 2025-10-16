--Working with dates
--How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
select memid, surname, firstname, joindate from cd.members where joindate >= '2012-09-01'
