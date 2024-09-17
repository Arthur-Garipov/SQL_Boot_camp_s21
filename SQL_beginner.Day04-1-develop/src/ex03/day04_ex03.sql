SELECT * FROM v_generated_dates
except
SELECT visit_date FROM person_visits
ORDER BY generated_date;