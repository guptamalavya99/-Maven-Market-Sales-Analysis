--Which are the top 10 product brands by total revenue across 1997–1998?

WITH all_tran AS(
SELECT * 
FROM "transaction-1997"
UNION ALL 
SELECT * 
FROM  "transaction-1998"
), 

pro AS(
SELECT *
FROM all_tran t 
INNER JOIN products p 
ON p.product_id = t.product_id
)

SELECT product_brand, 
SUM(product_retail_price*quantity) AS total_revenue
FROM pro 
GROUP BY product_brand 
ORDER BY SUM(product_retail_price*quantity) DESC
LIMIT 10