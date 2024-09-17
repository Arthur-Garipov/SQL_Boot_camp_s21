WITH dat_cte AS (
    SELECT visit_date AS dat 
    FROM person_visits
    WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10') AND (person_id = 1 or person_id = 2)
    ORDER BY dat
)

SELECT visit_date FROM person_visits
LEFT JOIN dat_cte ON person_visits.visit_date = dat_cte.dat
WHERE dat_cte.dat IS NULL