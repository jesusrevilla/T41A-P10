--Perform a case-insensitive search
--Perform a case-insensitive search to find all facilities whose name begins with 'tennis'. Retrieve all columns.
SELECT * FROM cd.facilities WHERE upper(name) like 'TENNIS%';
