-- Retrieve everything from a table
-- How can you retrieve all the information from the cd.facilities table?

SELECT * FROM cd.facilities;

-- Retrieve specific columns from a table
-- You want to print out a list of all of the facilities and their cost to members. 
-- How would you retrieve a list of only facility names and costs?
SELECT name, membercost FROM cd.facilities;
