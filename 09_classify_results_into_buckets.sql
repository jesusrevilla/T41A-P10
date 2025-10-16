SELECT name, 
	case when (monthlymaintenance > 100) then
		'expensive'
	else
		'cheap'
	end AS cost
	FROM cd.facilities;
