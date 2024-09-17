WITH name_cte AS (SELECT id from person
WHERE name = 'Anna' OR name = 'Denis')

SELECT menu.pizza_name, pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON menu.id = person_order.menu_id
WHERE person_order.person_id IN (SELECT * FROM name_cte)
ORDER BY pizza_name, pizzeria_name