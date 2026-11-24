-- DVD Rental database (PostgreSQL)
-- Topic: set operations (INTERSECT, EXCEPT, UNION)

-- 1. Customers who rented films from BOTH Action and Comedy categories
SELECT DISTINCT r.customer_id
FROM rental r
JOIN inventory i      ON i.inventory_id = r.inventory_id
JOIN film_category fc ON fc.film_id = i.film_id
JOIN category c       ON c.category_id = fc.category_id
WHERE c.name = 'Action'

INTERSECT

SELECT DISTINCT r.customer_id
FROM rental r
JOIN inventory i      ON i.inventory_id = r.inventory_id
JOIN film_category fc ON fc.film_id = i.film_id
JOIN category c       ON c.category_id = fc.category_id
WHERE c.name = 'Comedy';


-- 2. Customers who rented Action films but NEVER Comedy films
SELECT DISTINCT r.customer_id
FROM rental r
JOIN inventory i      ON i.inventory_id = r.inventory_id
JOIN film_category fc ON fc.film_id = i.film_id
JOIN category c       ON c.category_id = fc.category_id
WHERE c.name = 'Action'

EXCEPT

SELECT DISTINCT r.customer_id
FROM rental r
JOIN inventory i      ON i.inventory_id = r.inventory_id
JOIN film_category fc ON fc.film_id = i.film_id
JOIN category c       ON c.category_id = fc.category_id
WHERE c.name = 'Comedy';


-- 3. All names that appear in the database as either an actor or a customer
SELECT first_name, last_name FROM actor
UNION
SELECT first_name, last_name FROM customer
ORDER BY last_name, first_name;
