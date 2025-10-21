select substr(surname,1,1) as letter,count(*) as count from cd.members
group by letter
order by letter
