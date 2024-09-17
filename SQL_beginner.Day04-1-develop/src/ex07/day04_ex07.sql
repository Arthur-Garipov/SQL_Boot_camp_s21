INSERT INTO person_order VALUES (
    (SELECT max(id) from person_order) + 1, 
    (SELECT id from person WHERE name = 'Dmitriy'), 
    (SELECT id from menu WHERE pizza_name = 'cheese pizza' AND price = 780), 
    '2022-01-08');

INSERT INTO person_visits VALUES (
    (SELECT max(id) from person_visits) + 1, 
    (SELECT id from person WHERE name = 'Dmitriy'), 
    (SELECT pizzeria_id from menu WHERE pizza_name = 'cheese pizza' AND price = 780), 
    '2022-01-08');

REFRESH materialized view mv_dmitriy_visits_and_eats;