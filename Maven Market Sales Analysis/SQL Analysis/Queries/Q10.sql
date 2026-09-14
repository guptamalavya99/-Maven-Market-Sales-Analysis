--How does purchasing volume differ across membership card types, and how do they rank based on quantity sold?

WITH all_tran AS(
SELECT * FROM "transaction-1997"
UNION ALL 
SELECT * FROM "transaction-1998"
), 

cust AS(
SELECT member_card, SUM(quantity) AS total_qty_sold
FROM all_tran t 
INNER JOIN customers c
ON c.customer_id = t.customer_id
GROUP BY member_card
)

SELECT  
ROW_NUMBER() OVER(ORDER BY total_qty_sold DESC) AS membership_rank, *
FROM cust