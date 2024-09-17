WITH cte_count_order AS (
SELECT po.person_id, menu.pizzeria_id, COUNT(po.person_id) AS order_count from person_order po
JOIN menu ON po.menu_id = menu.id
GROUP BY po.person_id, menu.pizzeria_id
ORDER BY po.person_id
),
cte_discounts AS (
    SELECT 
        ROW_NUMBER() OVER (ORDER BY person_id) AS id,
        person_id, 
        pizzeria_id, 
        CASE 
            WHEN order_count = 1 THEN 10.5
            WHEN order_count = 2 THEN 22.0
            ELSE 30.0
        END AS discount
    FROM 
        cte_count_order
)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    id, 
    person_id, 
    pizzeria_id, 
    discount
FROM 
    cte_discounts;

-- SELECT * FROM person_discounts