--Insert calculated data into a table
--Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the 
--value for the next facid, rather than specifying it as a constant. Use the following values for everything else:
--Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800.
INSERT INTO cd.facilities SELECT
(SELECT MAX(facid) FROM cd.facilities)+1, 'Spa', 20, 30, 100000, 800;  
