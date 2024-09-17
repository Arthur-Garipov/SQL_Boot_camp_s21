-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT SUM(rating) FROM pizzeria;
-- Session #2
INSERT INTO pizzeria (id, rating, name) VALUES (10, 5.0, 'Kazan Pizza');
COMMIT;
-- Session #1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
-- Session #2
SELECT SUM(rating) FROM pizzeria;