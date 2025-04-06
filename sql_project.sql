-- SQL retail Sales Analysis----
CREATE DATABASE sql_project_p1
use sql_project_p1

-- Create a Table
CREATE TABLE retail_sales(
    transactions_id	INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id	INT,
    gender VARCHAR(20),
    age	INT,
    category VARCHAR(25),	
    quantiy	INT,
    price_per_unit	FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT * FROM retail_sales;

-- importing my data Retails analytics
-- (or whatever your database name is)
BULK INSERT retail_sales
FROM '/var/opt/mssql/import/Retails.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

-- Counting all columns
SELECT
count(*) FROM retail_sales

-- Checking for null values
SELECT * FROM retail_sales
WHERE transactions_id is null

SELECT * FROM retail_sales
WHERE sale_date is null

-- Data cleaning
-- Don't wnat to check one by one for null values isted of that use this 
SELECT * FROM retail_sales
WHERE
transactions_id is null
or
sale_date is null
or 
sale_time is null
or
customer_id is null
or
gender is null 
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

--deleting all the null values
delete FROM retail_sales
WHERE
transactions_id is null
or
sale_date is null
or 
sale_time is null
or
customer_id is null
or
gender is null 
or
age is null
or
category is null
or
quantiy is null
or
price_per_unit is null
or
cogs is null
or
total_sale is null;

-- Data Exploration

-- How many sales we have?
SELECT * from retail_sales
SELECT count(*) as Howmany_sales FROM retail_sales

-- How many customer do we have
SELECT count(customer_id)  as total_customer from retail_sales

-- unique catogery
SELECT count(distinct category) as distinct_catogery FROM retail_sales
-- names 
SELECT distinct category FROM retail_sales


-- Data Analysis and business problems insights throw problems

-- Q.1-Write a SQL query to reterive all columns for sales made on '2022-11-05'

SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

/*Q.2 Write a SQL query to retrieve all transactions where the category is clothing 
and the quantity sold is more than 3 in the month of nov-2022 */

SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy > 3
  AND FORMAT(sale_date, 'yyyy-MM') = '2022-11';

/*.3 Write a SQL query to calculate sales(total_sales) for each for each category*/
SELECT category,
  SUM(total_sale) as total_by_categoey
FROM retail_sales
-- GROUP BY category;

-- 4 Write a sql query to find the average age of customers who purchased items form the beauty category
SELECT 
avg(age) as avg_age
FROM retail_sales
where category = 'Beauty'

-- 5 Write a sql query to find all transactions where the total_sale is greater than 1000
SELECT *
FROM retail_sales
where total_sale > 1000

-- 6 Write a SQL query to find the total number of transaction made by each gender in each category.
SELECT
   category,gender,
   COUNT(*) as total_trans
FROM retail_sales
group BY category,gender


-- 7 Write a SQL query to calculate the average sale for each month find out best selling month in each year
  -- Here below i have calculated year and month wise highest and lowest sale by avg 
SELECT 
    DATEPART(YEAR, sale_date) AS year,
    DATEPART(MONTH, sale_date) AS month,
    avg(total_sale) AS avg_total_sale
FROM retail_sales
GROUP BY DATEPART(YEAR, sale_date), DATEPART(MONTH, sale_date);

-- Q-7 Write a SQL query to calculate the average sale for each month,Findout best selling month in each year

-- SELECT 
--     year, 
--     month, 
--     avg_sale
-- FROM (
--     SELECT
--         YEAR( sale_date) AS year,
--         MONTH(sale_date) AS month,
--         AVG(total_sale) AS avg_sale,
--         RANK() OVER (
--           PARTITION BY YEAR( sale_date)
--            ORDER BY AVG(total_sale) DESC) AS rank
--     FROM retail_sales
--     GROUP BY 1,2
-- ) AS t1
-- WHERE rank = 1;
-- Inter view question 
SELECT 
    year, 
    month, 
    avg_sale
FROM (
    SELECT
        YEAR(sale_date) AS year,
        MONTH(sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY YEAR(sale_date) 
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS t1
WHERE rank = 1;


-- Write a sql query to find the top 3 customers based on the highest total sales
SELECT top 3
customer_id,
SUM(total_sale) as total_sales
 from retail_sales
 GROUP by customer_id
 ORDER by sum(total_sale) DESC;


-- Write a SQL query to find the number of unique customers who purchased items from each category 
SELECT 
category,
COUNT(distinct customer_id) as unique_customer
from retail_sales
GROUP by category

-- Write a sql query create each shift and number or orders (example <= 12,afternoon between 12 & 17, Evening >1)

SELECT *,
    CASE   
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
        ELSE 'evening'
    END AS shift 
FROM retail_sales;




SELECT * FROM retail_sales

