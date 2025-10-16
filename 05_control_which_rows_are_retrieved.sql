-- Control which rows are retrieved
-- How can you produce a list of facilities that charge a fee to members?
select * from cd.facilities where membercost > 0;
