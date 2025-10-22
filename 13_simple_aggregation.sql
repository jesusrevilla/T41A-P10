--Simple aggregation
--You'd like to get the signup date of your last member. How can you retrieve this information?
select joindate as latest from cd.members order by memid desc limit 1
