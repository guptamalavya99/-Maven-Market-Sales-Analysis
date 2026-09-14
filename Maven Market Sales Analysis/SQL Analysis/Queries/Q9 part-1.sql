--Which product brands have the highest return rates, and are these return patterns consistent across different stores?

WITH all_tran AS(
SELECT * FROM "transaction-1997"
UNION ALL 
SELECT * FROM "transaction-1998"
), 

pro AS(
SELECT * 
FROM all_tran t 
INNER JOIN products p 
ON p.product_id = t.product_id 
), 

total_rev AS(
SELECT product_brand, SUM(quantity*product_retail_price) AS sale_revenue
FROM pro
GROUP BY product_brand
), 

pro_ret AS(
SELECT * 
FROM products p 
INNER JOIN returns r 
ON r.product_id = p.product_id
),

ret_revenue AS(
SELECT product_brand, SUM(quantity*product_retail_price) AS returned_revenue 
FROM pro_ret
GROUP BY product_brand), 

rate AS(
SELECT t.product_brand, sale_revenue, returned_revenue,
ROUND((returned_revenue :: numeric/sale_revenue)*100,2) AS return_rate
FROM total_rev t
INNER JOIN ret_revenue r 
ON t.product_brand = r.product_brand
GROUP BY t.product_brand, returned_revenue, sale_revenue 
)

SELECT * FROM rate 
ORDER BY return_rate DESC