-- Find the film_title of all films which feature both UMA WOOD and FRED COSTNER
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box 
--  to figure out how to get a table that shows pairs of actors in movies.

-- Put your query for Q5 here.

SELECT film.title AS film_title FROM film 
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE (actor.first_name = 'UMA' AND actor.last_name = 'WOOD') 
OR
(actor.first_name = 'FRED' AND actor.last_name = 'COSTNER')
GROUP BY film.film_id, film.title
HAVING COUNT(DISTINCT actor.actor_id) = 2
ORDER BY film.title DESC; 