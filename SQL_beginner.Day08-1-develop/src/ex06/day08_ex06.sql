-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1
SELECT SUM(rating) FROM pizzeria;
-- Session #2
INSERT INTO pizzeria (id, rating, name) VALUES (11, 4.0, 'Kazan Pizza 2');
COMMIT;
-- Session #1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
-- Session #2
SELECT SUM(rating) FROM pizzeria;
