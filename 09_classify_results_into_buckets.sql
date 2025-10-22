--Classify results into buckets
--How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly 
--maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.

select name,
case 
	when monthlymaintenance>100 then 'expensive'
	else 'cheap'
end as cost
from cd.facilities
