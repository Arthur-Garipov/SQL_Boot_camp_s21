WITH pizzeria_cte AS (SELECT pizzeria_id FROM person_visits pv
JOIN person ON pv.person_id = person.id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08')

SELECT pizzeria.name FROM pizzeria
JOIN pizzeria_cte ON pizzeria.id = pizzeria_cte.pizzeria_id
JOIN menu ON pizzeria.id = menu.pizzeria_id
WHERE menu.price < 800;