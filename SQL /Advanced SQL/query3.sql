-- Find the actor_id, first_name, last_name and total_combined_film_length of Drama films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Drama films)
-- and the total length of Drama films they have been in.
-- Look at the category table to figure out how to filter data for Drama films.
-- Order your results by all the actors first_name in ascending order.

-- Put query for Q3 here


SELECT actor.actor_id, actor.first_name, actor.last_name, SUM(CASE WHEN category.name = 'Drama' THEN film.length ELSE 0 END) AS total_combined_film_length
FROM actor
LEFT JOIN film_actor ON actor.actor_id = film_actor.actor_id
LEFT JOIN film ON film_actor.film_id = film.film_id
LEFT JOIN film_category ON film.film_id = film_category.film_id
LEFT JOIN category ON film_category.category_id = category.category_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name
ORDER BY actor.first_name; 