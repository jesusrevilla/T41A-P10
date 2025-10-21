--Clean up telephone numbers
--The telephone numbers in the database are very inconsistently formatted. You'd like to print a list of member ids and numbers that have had '-','(',')', and ' ' characters removed. Order by member id.

select memid, translate(telephone, '-() ', '') as telephone
    from cd.members
    order by memid;
