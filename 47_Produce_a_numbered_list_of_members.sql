--Produce a numbered list of members
--Produce a monotonically increasing numbered list of members (including guests), ordered by their date of joining. 
--Remember that member IDs are not guaranteed to be sequential.
SELECT row_number() over(ORDER BY joindate), firstname,surname FROM cd.members
ORDER BY joindate;
