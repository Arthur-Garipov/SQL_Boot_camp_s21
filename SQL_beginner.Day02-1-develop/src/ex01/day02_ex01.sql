SELECT visit_date FROM person_visits
LEFT JOIN 
    (SELECT visit_date AS dat 
    FROM person_visits
    WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10') AND (person_id = 1 or person_id = 2)) AS visits 
ON person_visits.visit_date = visits.dat
WHERE visits.dat IS NULL;
