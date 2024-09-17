SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name, p.name AS pizzeria_name
FROM menu m
join pizzeria p ON m.pizzeria_id = p.id