COMMENT ON TABLE person_discounts IS 'Discounts for customers by different pizzerias';
COMMENT ON COLUMN person_discounts.discount IS 'Discount size for person from each pizzeria';
COMMENT ON COLUMN person_discounts.person_id IS 'ID every person who made order';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'ID every pizzeria which did discount';

SELECT * FROM person_discounts