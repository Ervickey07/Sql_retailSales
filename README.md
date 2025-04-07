# 🛒 Retail Sales Analysis using SQL

##📌 Project Overview ##

This project performs an in-depth analysis of retail sales data using SQL. The goal is to extract actionable insights to support data-driven business decisions such as identifying top-performing products, peak sales periods, and customer purchasing trends etc.

##Dataset Name ##
**Retails.csv **

##Create table Code ##
  <pre style="background:#1e1e1e;color:#dcdcdc;padding:10px;border-radius:8px;"><code> CREATE TABLE <span style="color:#569cd6;">retail_sales</span> ( <span style="color:#9cdcfe;">transactions_id</span> INT PRIMARY KEY, <span style="color:#9cdcfe;">sale_date</span> DATE, <span style="color:#9cdcfe;">sale_time</span> TIME, <span style="color:#9cdcfe;">customer_id</span> INT, <span style="color:#9cdcfe;">gender</span> VARCHAR(20), <span style="color:#9cdcfe;">age</span> INT, <span style="color:#9cdcfe;">category</span> VARCHAR(25), <span style="color:#9cdcfe;">quantiy</span> INT, <span style="color:#9cdcfe;">price_per_unit</span> FLOAT, <span style="color:#9cdcfe;">cogs</span> FLOAT, <span style="color:#9cdcfe;">total_sale</span> FLOAT ); </code></pre>


  ##I have used Retails data##
  ##Inserting Data name - Retails.csv##
  # 📦 Bulk Insert: Retail Sales CSV into SQL Server

This script demonstrates how to import data from a CSV file (`Retails.csv`) into a SQL Server table named `retail_sales` using the `BULK INSERT` command.

## 📁 File Path
The CSV file must be accessible from the SQL Server container or instance. In this example, it’s assumed to be located at:


Make sure this path is correctly mounted and the file has the necessary read permissions.

## 🧾 SQL Script

```sql
BULK INSERT retail_sales
FROM '/var/opt/mssql/import/Retails.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


# 🔍 Data Validation Queries for `retail_sales` Table

This document includes basic SQL checks to validate data quality in the `retail_sales` table after importing a CSV file.

## 📊 1. Count Total Rows

```sql
-- Counting all rows in the retail_sales table
SELECT COUNT(*) FROM retail_sales;


-- Checking if any transaction IDs are missing
SELECT * FROM retail_sales
WHERE transactions_id IS NULL;


-- Checking if any sale dates are missing
SELECT * FROM retail_sales
WHERE sale_date IS NULL;



# 📈 Data Exploration and Business Insights – `retail_sales`

This section covers initial data exploration and dives into potential business questions to extract meaningful insights from the dataset.

---

## 🔍 Data Exploration

### 🧮 1. Total Number of Sales

```sql
-- Preview the dataset
SELECT * FROM retail_sales;

-- Count total number of sales
SELECT COUNT(*) AS Howmany_sales FROM retail_sales;'''



## ❓ Q1: Retrieve All Sales Made on '2022-11-05'

### ✅ SQL Query:

```sql
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';'''


**🔍 Explanation:**
This query fetches all columns from the retail_sales table for records where the sale_date is exactly November 5, 2022.

📌 Use Case:
Helps identify daily performance.

Useful for time-based trend analysis, holiday campaigns, or special sale days










