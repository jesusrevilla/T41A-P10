--Simple aggregation
--You'd like to get the signup date of your last member. How can you retrieve this information?

SELECT MAX(joindate) FROM cd.members AS latest;
