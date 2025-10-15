-- Retrieve everything from a table
-- How can you retrieve all the information from the cd.facilities table?

SELECT * FROM cd.facilities;
select * from cd.facilities;
select name, membercost from cd.facilities;    
select * from cd.facilities where membercost > 0;   
select facid, name, membercost, monthlymaintenance 
	from cd.facilities 
	where 
		membercost > 0 and 
		(membercost < monthlymaintenance/50.0);
select *
	from cd.facilities 
	where 
		name like '%Tennis%';  
