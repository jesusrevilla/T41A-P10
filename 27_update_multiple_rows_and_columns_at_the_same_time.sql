--update_multiple_rows_and_columns_at_the_same_time.sql
update cd.facilities
    set
        membercost = 6,
        guestcost = 30
    where facid in (0,1);  
