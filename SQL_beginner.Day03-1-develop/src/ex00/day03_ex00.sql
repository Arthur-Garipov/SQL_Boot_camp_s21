SELECT menu.pizza_name, 
    menu.price, 
    pizzeria.name AS pizzeria_name, 
    person_visits.visit_date
FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
WHERE person.name = 'Kate' AND menu.price between 800 AND 1000
ORDER BY 1, 2, 3, 4