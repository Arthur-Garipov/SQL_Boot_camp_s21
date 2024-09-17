CREATE VIEW v_symmetric_union AS (
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-02'
    except
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-06'
)
UNION 
(
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-06'
    except
    SELECT person_id FROM person_visits
    WHERE visit_date = '2022-01-02'
);

-- SELECT * from v_symmetric_union