--Which product brands have the highest return rates, and are these return patterns consistent across different stores?

WITH all_tran AS(
SELECT * FROM "transaction-1997"
UNION ALL 
SELECT * FROM "transaction-1998"
), 

pro AS(
SELECT t.product_id, product_brand, product_retail_price, quantity, store_id
FROM all_tran t
INNER JOIN products p
ON p.product_id = t.product_id
), 

sto AS(
SELECT p.store_id, product_brand, product_retail_price, quantity 
FROM pro p 
INNER JOIN stores s
ON p.store_id = s.store_id
), 

revenue_col AS(
SELECT store_id, product_brand , 
SUM(quantity*product_retail_price) AS sale_revenue
FROM sto 
GROUP BY store_id, product_brand), 

ret AS(
SELECT r.product_id, product_brand, quantity, product_retail_price, store_id
FROM returns r
INNER JOIN products p
ON p.product_id = r.product_id
),

ret_sto AS(
SELECT r.store_id, product_brand, 
SUM(quantity*product_retail_price) AS returned_revenue
FROM ret r
INNER JOIN stores s
ON r.store_id = s.store_id
GROUP BY  r.store_id, product_brand
), 

sale_ret AS(
SELECT e.store_id, r.product_brand, sale_revenue, returned_revenue
FROM revenue_col e
INNER JOIN ret_sto r
ON e.store_id = r.store_id
AND r.product_brand = e.product_brand 
),

rate AS(
SELECT *, 
ROUND((returned_revenue :: numeric/ sale_revenue)*100,2) AS return_rate
FROM sale_ret 
)

SELECT * FROM rate 
ORDER BY  return_rate DESC  




