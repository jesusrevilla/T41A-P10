SELECT LPAD(zipcode::text, 5, '0') AS zip
FROM cd.members
ORDER BY zip;
