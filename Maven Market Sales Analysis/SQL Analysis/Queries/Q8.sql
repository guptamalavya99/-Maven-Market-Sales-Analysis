--Which high-performing products have the highest return rates?

WITH all_tran AS(
SELECT * FROM "transaction-1997"
UNION ALL 
SELECT * FROM "transaction-1998"
), 

pro AS(
SELECT t.product_id, product_name, SUM(quantity*product_retail_price) AS total_revenue 
FROM all_tran t 
INNER JOIN products p
ON t.product_id = p.product_id
GROUP BY t.product_id, product_name
), 

--Shortlisting high performing product (total_revenue > avg_revenue = "HIGH PERFORMING")
avg_revenue_v AS(
SELECT ROUND(AVG(total_revenue),2) AS avg_revenue 
FROM(
SELECT t.product_id,SUM(quantity*product_retail_price) AS total_revenue
FROM all_tran t 
INNER JOIN products p 
ON p.product_id = t.product_id
GROUP BY t.product_id)
), 

r_benchmark AS(
SELECT * 
FROM(
SELECT * , 
(CASE
	WHEN total_revenue > avg_revenue THEN 'above_avg'
	WHEN total_revenue < avg_revenue THEN 'below_avg'
	ELSE 'No change'
	END) AS status
FROM pro
CROSS JOIN avg_revenue_v)
WHERE status = 'above_avg'
), 

pro_ret AS(
SELECT r.product_id, product_name, SUM(quantity*product_retail_price) AS returned_revenue 
FROM returns r 
INNER JOIN products p 
ON p.product_id = r.product_id
GROUP BY r.product_id, product_name
)

SELECT b.product_id, b.product_name, total_revenue, returned_revenue,
ROUND((returned_revenue :: numeric/ total_revenue)*100,2) AS return_rate
FROM r_benchmark b
INNER JOIN pro_ret r
ON b.product_id = r.product_id
GROUP BY b.product_id, b.product_name, total_revenue, returned_revenue
ORDER BY return_rate DESC
