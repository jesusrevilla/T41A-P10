--Perform a case-insensitive search
--Perform a case-insensitive search to find all facilities whose name begins with 'tennis'. Retrieve all columns.

select * from cd.facilities where upper(name) like 'TENNIS%';
