-- DVD Rental database (PostgreSQL)
-- Topic: JOINs, GROUP BY, HAVING

-- 1. Top 5 categories by number of films
SELECT c.name AS category, COUNT(*) AS films_count
FROM category c
JOIN film_category fc ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY films_count DESC
LIMIT 5;


-- 2. Customers with more than 30 rentals
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rentals
FROM customer c
JOIN rental r ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 30
ORDER BY rentals DESC;
