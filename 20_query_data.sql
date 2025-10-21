WITH RECURSIVE recommendation_chain AS (
    -- Caso base: el miembro inicial (ID 27)
    SELECT memid, firstname, surname, recommendedby
    FROM cd.members
    WHERE memid = 27
    
    UNION ALL
    
    -- Caso recursivo: encontrar quien recomendó al miembro actual
    SELECT m.memid, m.firstname, m.surname, m.recommendedby
    FROM cd.members m
    INNER JOIN recommendation_chain rc ON m.memid = rc.recommendedby
)
SELECT memid, firstname, surname
FROM recommendation_chain
WHERE memid != 27  -- Excluir al miembro original
ORDER BY memid DESC;
