INSERT INTO person_order (id, person_id, menu_id, order_date)
values (
    generate_series(
        (select max(id) + 1 FROM person_order), 
        (select max(id) + (select max(id) FROM person_order) FROM person), 
        1),
    generate_series(1, (select max(id) FROM person), 1), 
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), 
    '2022-02-25');
-- delete from person_order where order_date = '2022-02-25';
-- SELECT * FROM person_order;