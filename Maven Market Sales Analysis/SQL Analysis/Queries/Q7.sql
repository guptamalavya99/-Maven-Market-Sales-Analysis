--Which stores have the highest return rates, after accounting for their sales volume?

WITH all_tran AS(
SELECT *
FROM "transaction-1997"
UNION ALL 
SELECT * 
FROM "transaction-1998"
), 

total_sales AS(
SELECT t.store_id, store_name, 
SUM(quantity) AS sold_qty
FROM all_tran t 
INNER JOIN stores S
ON s.store_id = t.store_id
GROUP BY t.store_id, store_name 
), 

return_qty AS(
SELECT s.store_id, store_name,
SUM(quantity) AS returned_qty
FROM returns r
INNER JOIN stores s
ON s.store_id = r.store_id
GROUP BY s.store_id, store_name
),

main AS(
SELECT s.store_id, sold_qty, returned_qty
FROM total_sales s
INNER JOIN return_qty r
ON s.store_id = r.store_id) 

SELECT *, 
ROUND((returned_qty :: numeric/sold_qty)*100,2) AS return_rate
FROM main
ORDER BY return_rate DESC