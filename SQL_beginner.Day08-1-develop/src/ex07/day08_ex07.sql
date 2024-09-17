-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- Session #1
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
-- Session #2
UPDATE pizzeria SET rating = 4.9 WHERE id = 2;
-- Session #1
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;
-- Session #2
UPDATE pizzeria SET rating = 4.9 WHERE id = 1;
-- Session #1
COMMIT;
-- Session #2
COMMIT;
-- Измененния из второй сессии не получается произвести, 
-- так как уровень изоляции REPEATABLE READ не дает внести изменения второй сессии, 
-- которые уже были сделаны в первой сессии.
-- DEADLOCK: Обе транзакции блокируют друг друга, и PostgreSQL обнаруживает дедлок, откатывая одну из транзакций.