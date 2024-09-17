WITH RECURSIVE points AS (
    SELECT point1 AS start, point2 AS next, cost AS total_cost, ARRAY[point1, point2]::character varying[] AS path
    FROM routes
    WHERE point1 = 'a'
    UNION ALL
    SELECT p.start, r.point2 AS next, p.total_cost + r.cost AS total_cost, array_append(p.path, r.point2)
    FROM points p
    JOIN routes r ON p.next = r.point1
    WHERE NOT r.point2 = ANY(p.path[2:array_length(p.path, 1)])
)
SELECT total_cost, path
FROM points
WHERE cardinality(path) = 5 AND path[array_length(path, 1)] = 'a'
order by total_cost, path;