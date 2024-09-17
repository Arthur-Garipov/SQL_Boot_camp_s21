SELECT round(sum(rating)/ count(rating), 4) as global_rating
FROM pizzeria;

SELECT round(avg(rating), 4) as global_rating
FROM pizzeria;