INSERT INTO menu
VALUES (
    (select max(id) + 1 from menu), 
    (select id from pizzeria where name = 'Dominos'), 
    'sicilian pizza', 
    900);