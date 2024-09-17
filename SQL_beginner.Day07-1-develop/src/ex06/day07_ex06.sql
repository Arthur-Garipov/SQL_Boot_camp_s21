SELECT pizzeria.name, 
    count(menu.pizzeria_id) AS count_of_orders, 
    ROUND((sum(menu.price) / count(menu.pizzeria_id)), 2) AS average_price,
    max(menu.price) AS max_price,
    min(menu.price) AS min_price
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name
ORDER BY pizzeria.name