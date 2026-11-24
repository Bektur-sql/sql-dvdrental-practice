-- DVD Rental database (PostgreSQL)
-- Topic: CTEs and window functions (LAG, NTILE)

-- 1. Monthly revenue and change vs. previous month
WITH monthly AS (
    SELECT DATE_TRUNC('month', payment_date) AS month,
           SUM(amount) AS revenue
    FROM payment
    GROUP BY 1
)
SELECT month,
       revenue,
       LAG(revenue) OVER (ORDER BY month) AS prev_revenue,
       ROUND(100.0 * (revenue - LAG(revenue) OVER (ORDER BY month))
             / NULLIF(LAG(revenue) OVER (ORDER BY month), 0), 1) AS pct_change
FROM monthly
ORDER BY month;


-- 2. Customers who spent more than average, with spending quartile
WITH spend AS (
    SELECT customer_id, SUM(amount) AS total
    FROM payment
    GROUP BY customer_id
)
SELECT c.customer_id, c.first_name, c.last_name, s.total,
       NTILE(4) OVER (ORDER BY s.total DESC) AS spend_quartile
FROM spend s
JOIN customer c ON c.customer_id = s.customer_id
WHERE s.total > (SELECT AVG(total) FROM spend)
ORDER BY s.total DESC;
