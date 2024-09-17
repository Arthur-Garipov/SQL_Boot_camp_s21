SELECT name, count(visit_date) as count_of_visits
FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY name
having count(visit_date) > 3