--We want to increase the price of the tennis courts for both members and guests. Update the costs to be 6 for members, and 30 for guests.
update cd.facilities
    set
        membercost = 6,
        guestcost = 30
    where facid in (0,1);    
