WITH visit_act AS (
    SELECT name, COUNT(visit_date) AS count, 'visit' AS action_type
    FROM person_visits
    JOIN pizzeria p ON p.id = person_visits.pizzeria_id
    GROUP BY name
), 
orders AS
( 
    SELECT name, COUNT(order_date) AS count, 'order' AS action_type
    FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria p ON p.id = menu.pizzeria_id
    GROUP BY name
)
SELECT visit_act.name, (visit_act.count + orders.count) AS total_count
FROM visit_act
JOIN orders ON orders.name = visit_act.name
ORDER BY total_count DESC, name;