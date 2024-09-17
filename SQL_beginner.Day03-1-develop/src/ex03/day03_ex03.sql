WITH all_pizzerias AS (
    SELECT name AS pizzeria_name
    FROM pizzeria
),
male_visits AS (
    SELECT
        pizzeria.name AS pizzeria_name,
        COUNT(DISTINCT person.id) AS male_count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.gender = 'male'
    GROUP BY pizzeria.name
),
female_visits AS (
    SELECT
        pizzeria.name AS pizzeria_name,
        COUNT(DISTINCT person.id) AS female_count
    FROM pizzeria
    JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.gender = 'female'
    GROUP BY pizzeria.name
)
SELECT
    p.pizzeria_name
FROM all_pizzerias p
LEFT JOIN male_visits m ON p.pizzeria_name = m.pizzeria_name
LEFT JOIN female_visits f ON p.pizzeria_name = f.pizzeria_name
WHERE male_count <> female_count
ORDER BY p.pizzeria_name;
