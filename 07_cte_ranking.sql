-- DVD Rental database (PostgreSQL)
-- Topic: CTEs, subqueries, RANK with PARTITION BY

-- 1. Top 3 films by revenue in each category
WITH film_revenue AS (
    SELECT c.name AS category, f.title, SUM(p.amount) AS revenue
    FROM payment p
    JOIN rental r         ON r.rental_id = p.rental_id
    JOIN inventory i      ON i.inventory_id = r.inventory_id
    JOIN film f           ON f.film_id = i.film_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category c       ON c.category_id = fc.category_id
    GROUP BY c.name, f.title
),
ranked AS (
    SELECT *, RANK() OVER (PARTITION BY category ORDER BY revenue DESC) AS rnk
    FROM film_revenue
)
SELECT category, title, revenue
FROM ranked
WHERE rnk <= 3
ORDER BY category, rnk;


-- 2. Customers who spent more than the average customer
WITH spend AS (
    SELECT customer_id, SUM(amount) AS total
    FROM payment
    GROUP BY customer_id
)
SELECT c.first_name, c.last_name, s.total
FROM spend s
JOIN customer c ON c.customer_id = s.customer_id
WHERE s.total > (SELECT AVG(total) FROM spend)
ORDER BY s.total DESC;
