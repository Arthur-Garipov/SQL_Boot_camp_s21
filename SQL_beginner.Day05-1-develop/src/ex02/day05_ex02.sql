CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person
where UPPER(name) = 'ANDREY';