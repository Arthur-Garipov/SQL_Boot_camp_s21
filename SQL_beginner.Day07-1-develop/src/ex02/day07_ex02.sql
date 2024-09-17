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
),
ranked_visits AS (
    SELECT name, count, action_type,
           ROW_NUMBER() OVER (ORDER BY count DESC) AS rn
    FROM visit_act
),
ranked_orders AS (
    SELECT name, count, action_type,
           ROW_NUMBER() OVER (ORDER BY count DESC) AS rn
    FROM orders
)
SELECT name, count, action_type
FROM (
    SELECT name, count, action_type
    FROM ranked_visits
    WHERE rn <= 3
    UNION ALL
    SELECT name, count, action_type
    FROM ranked_orders
    WHERE rn <= 3
) AS combined
ORDER BY action_type, count DESC;