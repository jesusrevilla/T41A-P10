--Count the number of members whose surname starts with each letter of the alphabet
SELECT SUBSTR(surname, 1, 1) AS letter, COUNT(*) FROM cd.members GROUP BY letter ORDER BY letter;
