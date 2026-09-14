--How does customer purchasing behaviour vary across different education and occupation groups?

WITH all_tran AS(
SELECT * FROM "transaction-1997" 
UNION ALL 
SELECT * FROM "transaction-1998"
), 

cust AS(
SELECT occupation, SUM(quantity) AS total_qty
FROM customers c 
INNER JOIN all_tran t
ON t.customer_id = c.customer_id
GROUP BY  occupation
)


SELECT 
ROW_NUMBER() OVER(ORDER BY total_qty DESC) AS occupation, 
*
FROM cust