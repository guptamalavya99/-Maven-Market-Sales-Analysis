--Which customers have made purchases from multiple product brands, 
--and how can customers be classified based on the diversity of products they purchase? 

WITH all_tran AS(
SELECT * FROM "transaction-1997"
UNION ALL 
SELECT * FROM "transaction-1998"
), 

pro AS(
SELECT t.product_id, product_brand, customer_id
FROM all_tran t 
INNER JOIN products p 
ON p.product_id = t.product_id), 

cust AS(
SELECT CONCAT(first_name,' ', last_name) AS full_name, 
COUNT(DISTINCT(product_brand)) AS num_of_brands
FROM pro p 
INNER JOIN customers c
ON c.customer_id = p.customer_id
GROUP BY CONCAT(first_name,' ', last_name)
), 

short_list AS(
SELECT * 
FROM cust 
WHERE num_of_brands > 1
),

--customer diversity classification based on observed distribution of num of brands column: [(x >= 50 "High"),(20 =< x < 50 "Medium"),(x < 20 "Low")]

status AS(
SELECT *, 
(CASE
	WHEN  num_of_brands >= 50 THEN 'High Diversity'
	WHEN  num_of_brands BETWEEN 20 AND 49 THEN 'Medium Diversity'
	ELSE 'Low Diversity'
	END) AS brand_diversity_status
FROM short_list
)

SELECT * FROM status

