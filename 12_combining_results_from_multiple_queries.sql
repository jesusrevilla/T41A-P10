--Combining results from multiple queries
--You, for some reason, want a combined list of all surnames and all facility names. Yes, this is a contrived example :-). Produce that list!
select surname from cd.members
union
select name from cd.facilities
