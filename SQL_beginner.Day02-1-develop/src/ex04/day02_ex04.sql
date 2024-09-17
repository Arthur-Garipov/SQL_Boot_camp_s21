SELECT menu.pizza_name, pizzeria.name AS pizza_name, menu.price
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE menu.pizza_name = 'mushroom pizza' OR menu.pizza_name = 'pepperoni pizza'
ORDER BY menu.pizza_name, pizzeria.name