-- DVD Rental database (PostgreSQL)
-- Topic: data quality checks (NOT EXISTS, EXPLAIN)

-- 1. Films that have never been rented
SELECT f.film_id, f.title
FROM film f
WHERE NOT EXISTS (
    SELECT 1
    FROM inventory i
    JOIN rental r ON r.inventory_id = i.inventory_id
    WHERE i.film_id = f.film_id
);


-- 2. Same check, with the execution plan
EXPLAIN ANALYZE
SELECT f.film_id, f.title
FROM film f
WHERE NOT EXISTS (
    SELECT 1
    FROM inventory i
    JOIN rental r ON r.inventory_id = i.inventory_id
    WHERE i.film_id = f.film_id
);


-- 3. Same check with LEFT JOIN ... IS NULL (should return the same films)
SELECT f.film_id, f.title
FROM film f
LEFT JOIN inventory i ON i.film_id = f.film_id
LEFT JOIN rental r    ON r.inventory_id = i.inventory_id
WHERE r.rental_id IS NULL;


-- 4. Customers with no rentals at all (empty result is a valid answer)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer c
WHERE NOT EXISTS (
    SELECT 1 FROM rental r WHERE r.customer_id = c.customer_id
);
