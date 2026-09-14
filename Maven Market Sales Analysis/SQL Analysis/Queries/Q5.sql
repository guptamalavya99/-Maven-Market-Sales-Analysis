--Which products have the highest sales volume while generating relatively low profit per unit?

WITH tran_all AS(
SELECT * 
FROM "transaction-1997" 
UNION ALL 
SELECT * 
FROM "transaction-1998"
), 

pro AS(
SELECT * 
FROM tran_all t 
INNER JOIN products p 
ON p.product_id = t.product_id
)

SELECT product_name,
SUM(quantity) AS total_qty, 
(product_retail_price - product_cost) AS profit_per_unit
FROM pro
GROUP BY product_name, product_retail_price, product_cost 
ORDER BY SUM(quantity) DESC, (product_retail_price - product_cost) ASC
LIMIT 10 