--Pad zip codes with leading zeroes
SELECT LPAD(CAST(zipcode AS TEXT), 5, '0') AS zip FROM cd.members;
