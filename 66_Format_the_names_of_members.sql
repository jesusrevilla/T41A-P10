--Format the names of members
--Output the names of all members, formatted as 'Surname, Firstname'

select surname || ', ' || firstname as name from cd.members
