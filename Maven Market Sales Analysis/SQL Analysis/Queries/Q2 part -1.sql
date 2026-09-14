-- How does store performance differ across sales districts and regions?

WITH all_tran AS(
SELECT * 
FROM "transaction-1997" 
UNION ALL 
SELECT * 
FROM "transaction-1998"
), 

sto_pro AS(
SELECT * 
FROM all_tran t
INNER JOIN products p 
ON p.product_id = t.product_id
INNER JOIN stores s
ON s.store_id = t.store_id
),

reg AS(
SELECT *
FROM sto_pro 
INNER JOIN regions r
ON r.region_id = sto_pro.region_id
),

revenue_col AS(
SELECT sales_district, 
SUM(quantity*product_retail_price) AS total_revenue
FROM reg 
GROUP BY sales_district
)

SELECT *,
ROW_NUMBER() OVER(ORDER BY  total_revenue DESC) AS district_rank
FROM revenue_col
ORDER BY total_revenue DESC

