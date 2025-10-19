--Insert calculated data into a table
INSERT INTO cd.facilities VALUES ((SELECT MAX(facid) FROM cd.facilities)+1, 'Spa', 20, 30, 100000, 800);
