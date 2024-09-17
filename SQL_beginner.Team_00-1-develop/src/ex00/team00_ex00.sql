CREATE TABLE routes (
    ID SERIAL PRIMARY KEY,  -- нам это надо??
    point1 VARCHAR(1),
    point2 VARCHAR(1),
    cost INT
);

INSERT INTO routes(point1, point2, cost) 
VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'd', 20),
('d', 'a', 20),
('a', 'c', 15),
('c', 'a', 15),
('b', 'd', 25),
('d', 'b', 25),
('d', 'c', 30),
('c', 'd', 30),
('b', 'c', 35),
('c', 'b', 35);

-- SELECT *
-- FROM routes;


WITH RECURSIVE points (passed, last_point, total_cost) AS (
    SELECT 
        ARRAY[point1, point2]::character varying[] AS passed,
        point2 AS last_point,
        cost AS total_cost
    FROM routes 
    WHERE point1 = 'a'

    UNION ALL

    SELECT
        array_append(p.passed, r.point2) AS passed,
        r.point2 AS last_point,
        p.total_cost + r.cost AS total_cost
    FROM points AS p
    JOIN routes AS r ON p.last_point = r.point1 -- в это части находим все пути из нашей таблицы routes которые можно соединить к {a,b,d} 
                                                 --опираясь на последнюю посещенную вершину "d", если глянуть на таблицу то от "d" можно пройти к ('d', 'a', 20) или ('d', 'b', 25), или ('d', 'c', 30),
    WHERE NOT r.point2 = ANY(p.passed)  -- ANY(p.passed) — функция, проверяющая, содержится ли r.point2(куда мы хотим пойти дальше) в массиве уже пройденных точек p.passed.
        OR (array_length(p.passed, 1) = 4 AND r.point2 = 'a') -- array_length(p.passed, 1) — функция, возвращающая длину массива. Это чтобы мы прошли все 4 точки и вернулись в 'a' 
)

SELECT total_cost, passed AS tour
FROM points
WHERE array_length(passed, 1) = 5 
    AND total_cost = (
        SELECT MIN(total_cost) 
        FROM points 
        WHERE array_length(passed, 1) = 5)
ORDER BY total_cost, tour

-- DROP TABLE routes