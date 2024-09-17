SELECT order_date, (
  SELECT CONCAT(name, ' (age:', age, ')') AS person_information)
FROM person_order
NATURAL JOIN
  (SELECT id AS person_id, name, age FROM person) AS temp_person
ORDER BY order_date, person_information;