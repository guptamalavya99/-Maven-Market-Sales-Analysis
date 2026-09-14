--How do stores' monthly sales volumes change over time, and which months show growth, decline, or no change for each store?

WITH all_tran AS(
SELECT transaction_date, store_id, quantity
FROM "transaction-1997"
UNION ALL
SELECT transaction_date, store_id, quantity
FROM "transaction-1998"
), 

month_sale AS(
SELECT store_id, DATE_TRUNC('month', transaction_date) AS sale_month, 
SUM(quantity) AS total_quantity
FROM all_tran 
GROUP BY store_id, DATE_TRUNC('month', transaction_date)
), 

monthly_change AS(
SELECT store_id, sale_month, total_quantity, 
LAG(total_quantity) OVER(PARTITION BY store_id ORDER BY sale_month) AS prev_month_qty
FROM month_sale
), 

change AS(
SELECT *, 
(total_quantity - prev_month_qty) AS qty_change
FROM monthly_change
)

SELECT *, 
(CASE
	WHEN qty_change > 0 THEN 'Growth'
	WHEN qty_change < 0 THEN 'Decline'
	ELSE 'No change'
	END) AS status
FROM change

