WITH name_cte AS (SELECT * FROM person
WHERE (address = 'Moscow' OR address = 'Samara') and gender = 'male')

SELECT name FROM name_cte
JOIN person_order po on po.person_id = name_cte.id
JOIN menu m on m.id = po.menu_id
WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
ORDER BY name DESC