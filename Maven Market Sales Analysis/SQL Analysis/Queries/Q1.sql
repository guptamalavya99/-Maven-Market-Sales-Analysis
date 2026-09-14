-- How do store types rank based on total revenue generated across 1997-1998?
WITH all_tran AS(
SELECT *
FROM "transaction-1997"
UNION ALL
SELECT *
FROM "transaction-1998"),

pro_sto AS(
SELECT *
FROM all_tran t
INNER JOIN products p
ON t.product_id = p.product_id
INNER JOIN stores s
ON s.store_id = t.store_id),

revenue_col AS(
SELECT store_type,
SUM(quantity*product_retail_price) AS total_revenue
FROM pro_sto
GROUP BY store_type)

SELECT *,
ROW_NUMBER() OVER(ORDER BY total_revenue DESC) AS store_rank
FROM revenue_col