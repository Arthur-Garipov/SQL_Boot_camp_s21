SELECT p.name, 
    m.pizza_name, 
    m.price, 
    m.price*(100-pd.discount)/100 AS discount_price, 
    -- m.price*0.8 AS discount_price,
    piz.name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria piz ON piz.id = m.pizzeria_id
JOIN person_discounts pd ON pd.person_id = p.id
ORDER BY p.name, m.pizza_name