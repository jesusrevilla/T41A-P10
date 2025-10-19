--Clean up telephone numbers
SELECT memid, TRANSLATE(telephone, '-() ', '') FROM cd.members;
