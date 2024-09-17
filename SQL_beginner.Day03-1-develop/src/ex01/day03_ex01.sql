SELECT id AS menu_id FROM menu
except
SELECT menu_id from person_order
ORDER BY menu_id