# 🛒 Retail Sales Analysis using SQL

##📌 Project Overview ##

This project performs an in-depth analysis of retail sales data using SQL. The goal is to extract actionable insights to support data-driven business decisions such as identifying top-performing products, peak sales periods, and customer purchasing trends etc.

##Dataset Name ##
Retails.csv

##Create table Code ##
  CREATE TABLE retail_sales (
    transactions_id    INT PRIMARY KEY,
    sale_date          DATE,
    sale_time          TIME,
    customer_id        INT,
    gender             VARCHAR(20),
    age                INT,
    category           VARCHAR(25),    
    quantiy            INT,
    price_per_unit     FLOAT,
    cogs               FLOAT,
    total_sale         FLOAT
);





