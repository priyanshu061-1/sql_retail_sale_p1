--write sql query for all the colums with date 22-11-5
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-5';

--sql query for all the transactions where category is clothing and no of transaction are more then 10 and sales in month of novenber 2022
SELECT 
  *
FROM retail_sales
WHERE 
	category = 'clothing'
	AND
	TO_CHAR(sale_date , 'YYYY-MM')='2022-11'
	AND
	quantiy >= 1
--total sales for each category
SELECT 
	category,
	SUM(total_sale) as net_sale
FROM retail_sales
GROUP BY 1

-- find avg age of customer who bought items from beauty category
SELECT 
	AVG(age)
FROM retail_sales
WHERE category = 'beauty'


-- all transactions where totalsale is grether than 1000
SELECT * FROM retail_sales
WHERE total_sale > 1000


-- no of transactions made by genders for each category

SELECT 
 	category,
	 gender,
	 COUNT(*) as total_trans
FROM retail_sales
GROUP 
	BY
	category,
	gender

-- average sales for each month, best selling month
SELECT 
	EXTRACT(YEAR FROM sale_date) as year,
	EXTRACT(MONTH FROM sale_date) as month,
	AVG(total_sale) as avg_sale
FROM retail_sales

GROUP BY 1,2
ORDER BY 1,3 DESC

-- top five customers
SELECT 
	customer_id,
	SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 1,2 DESC
LIMIT 5
	
-- no of unique customers who bought items from each category

SELECT
	 category,
	 COUNT (DISTINCT customer_id) as cust_uni
FROM retail_sales
GROUP BY 
category



-- create new column shift morning,afternoon evening
SELECT *,
  CASE
	WHEN EXTRACT(HOUR FROM sale_time)<12 THEN 'morning'
	WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
	ELSE 'evening'
  END as shift
FROM retail_sales

	 