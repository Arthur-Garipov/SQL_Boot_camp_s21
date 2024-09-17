WITH 
    name_cte AS 
    (SELECT id FROM person
    WHERE gender = 'female'),

    pizza_cte AS 
    (SELECT po.person_id, m.pizza_name FROM person_order po
    JOIN menu m on m.id = po.menu_id
    WHERE m.pizza_name IN ('pepperoni pizza', 'cheese pizza'))

SELECT p.name FROM name_cte
JOIN person p ON name_cte.id = p.id
JOIN pizza_cte ON pizza_cte.person_id = name_cte.id
GROUP BY p.name
HAVING COUNT(DISTINCT pizza_cte.pizza_name) = 2
ORDER BY p.name
