select bks.starttime
        from
                cd.bookings bks,
                cd.members mems
        where
                mems.firstname='David'
                and mems.surname='Farrell'
                and mems.memid = bks.memid;
