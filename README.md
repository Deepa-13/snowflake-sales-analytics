Snowflake Sales Analytics Project
Project Overview

This project demonstrates a beginner-friendly Sales Analytics workflow using Snowflake. The goal is to analyze customer purchases and extract insights like daily sales trends, top products, top customers, and monthly revenue using SQL.

The project includes:

Creating a Snowflake warehouse, database, and schema

Generating a synthetic sales dataset

Running analytical SQL queries

Creating reporting tables and optional materialized views

Visualizing results with charts

Project Structure
snowflake-sales-analytics/
│
├─ sql/
│   ├─ create_warehouse_db_schema.sql
│   ├─ create_sales_table.sql
│   ├─ insert_data.sql
│   ├─ analytics_queries.sql
│   └─ materialized_views.sql
│
├─ images/
│   ├─ daily_sales_chart.png
│   ├─ top_products_chart.png
│   └─ top_customers_chart.png
│
└─ README.md

Steps to Run

Create Warehouse, Database, and Schema

use role accountadmin;

create warehouse SALES_WH with warehouse_size='X-SMALL';
alter warehouse SALES_WH set auto_suspend=60;
alter warehouse SALES_WH set auto_resume=true;

create database SALES_DB;
create schema SALES_DB.SALES_SCHEMA;
use database SALES_DB;
use schema SALES_SCHEMA;


Create Sales Table

create or replace table SALES (
    order_id int,
    customer_id int,
    product_id int,
    quantity int,
    price number(10,2),
    order_date date
);


Insert Synthetic Data

insert into SALES
select 
    seq4() as order_id,
    uniform(1, 100, random()) as customer_id,
    uniform(1, 50, random()) as product_id,
    uniform(1, 5, random()) as quantity,
    uniform(100, 1000, random()) as price,
    current_date - uniform(0, 30, random()) as order_date
from table(generator(rowcount => 1000));


Run Analytics Queries

Daily Sales Trend

Top 5 Customers by Revenue

Top 5 Products by Quantity Sold

Monthly Revenue

Create Reporting Tables (Optional)

create or replace table SALES_BY_PRODUCT as
select PRODUCT, sum(AMOUNT) as TOTAL_SALES
from SALES
group by PRODUCT;

create or replace table SALES_BY_AGE as
select 
    case when AGE between 18 and 25 then '18-25'
         when AGE between 26 and 35 then '26-35'
         when AGE between 36 and 45 then '36-45'
         else '46-60' end as AGE_GROUP,
    sum(AMOUNT) as TOTAL_SALES
from SALES
group by AGE_GROUP;


View Results

Run SELECT * FROM SALES;

Run the analytics queries above to see insights.

Charts / Visualizations

Use Snowflake Worksheet’s Chart tab to create visualizations:

Line chart for Daily Sales Trend

Bar chart for Top Products

Pie or Bar chart for Top Customers

Column chart for Monthly Revenue

Screenshots of charts can be added inside the images/ folder.

Key Learnings

SQL querying and analytics in Snowflake

Creating warehouses, databases, schemas, and tables

Using synthetic data for analysis

Visualizing analytics results for business insights

Understanding Snowflake’s cloud-based architecture

Why This Project is Useful

This project demonstrates end-to-end sales analytics using Snowflake and helps beginners understand how businesses analyze data for decision-making. It’s practical, realistic, and perfect for placements, LinkedIn, and portfolio showcase.
