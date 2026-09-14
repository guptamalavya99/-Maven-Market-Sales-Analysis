--Which products generate revenue above or below their brand’s average, and how can they be classified as “Above Average” or “Below Average” revenue performers

WITH all_tran AS(
SELECT * 
FROM "transaction-1997" 
UNION ALL 
SELECT * 
FROM  "transaction-1998"
), 

pro AS(
SELECT t.product_id, product_name, product_brand, 
SUM(quantity*product_retail_price) AS total_revenue
FROM all_tran t
INNER JOIN products p 
ON p.product_id = t.product_id
GROUP BY t.product_id, product_name, product_brand
), 

brand_avg AS(
SELECT *, 
AVG(total_revenue) OVER(PARTITION BY product_brand) AS brand_avg_revenue
FROM pro
)

SELECT product_id, product_name, product_brand, total_revenue, ROUND((brand_avg_revenue),2) AS brand_avg, 
(CASE
	WHEN total_revenue > brand_avg_revenue THEN 'above average'
	WHEN total_revenue < brand_avg_revenue THEN 'below average'
	ELSE 'Equal to average'
	END) AS revenue_status
FROM brand_avg



