Snowflake Sales Analytics Project
Overview

This project demonstrates a Sales Analytics workflow using Snowflake SQL. The goal is to analyze customer purchases, track revenue trends, and identify top-performing products and customers using a synthetic sales dataset.

Features

Synthetic sales dataset generation using Snowflake SQL.

Sales analysis:

Daily sales trend

Top customers by revenue

Top products by quantity sold

Monthly revenue

Materialized view for monthly revenue reporting.

Visualizations using Snowflake Worksheet charts.

SQL Script

All SQL queries and table creation scripts are available in sql/snowflake_sales_project.sql.

How to Run

Open Snowflake SQL Worksheet.

Copy and run the script from snowflake_sales_project.sql.

Verify data using SELECT * FROM SALES; and other queries.

Create charts in Snowflake Worksheet using query results:

Daily sales → Line chart

Top products → Bar chart

Top customers → Pie chart

Monthly revenue → Column chart

Project Structure
snowflake-sales-analytics/
├── sql/
│   └── snowflake_sales_project.sql
├── images/
│   ├── daily_sales_trend.png
│   ├── top_products.png
│   └── top_customers.png
└── README.md

Learnings

Creating and managing databases, schemas, and tables in Snowflake.

Writing SQL queries for analytics and reporting.

Using Snowflake Worksheets for data visualization.

Understanding sales trends, customer segmentation, and product insights.
