use role accountadmin;

create warehouse SALES_WH
with warehouse_size = 'X-SMALL';

alter warehouse SALES_WH set auto_suspend = 60;
alter warehouse SALES_WH set auto_resume = true;

create database SALES_DB;

create schema SALES_DB.SALES_SCHEMA;

use database SALES_DB;
use schema SALES_SCHEMA;


use database SALES_DB;
use schema SALES_SCHEMA;

create or replace table SALES (
    order_id int,
    customer_id int,
    product_id int,
    quantity int,
    price number(10,2),
    order_date date
);

insert into SALES
select 
    seq4() as order_id,
    uniform(1, 100, random()) as customer_id,
    uniform(1, 50, random()) as product_id,
    uniform(1, 5, random()) as quantity,
    uniform(100, 1000, random()) as price,
    current_date - uniform(0, 30, random()) as order_date
from table(generator(rowcount => 1000));

select * from SALES limit 10;

select 
    order_date, 
    sum(quantity * price) as total_sales
from SALES
group by order_date
order by order_date;

select 
    customer_id, 
    sum(quantity * price) as revenue
from SALES
group by customer_id
order by revenue desc
limit 5;

select 
    product_id, 
    sum(quantity) as total_quantity
from SALES
group by product_id
order by total_quantity desc
limit 5;

select 
    to_char(order_date, 'YYYY-MM') as month,
    sum(quantity * price) as total_revenue
from SALES
group by month
order by month;

create or replace materialized view MV_MONTHLY_REVENUE as
select 
    to_char(order_date, 'YYYY-MM') as month,
    sum(quantity * price) as total_revenue
from SALES
group by month;

create or replace materialized view MV_TOP_PRODUCTS as
select 
    product_id, 
    sum(quantity) as total_quantity
from SALES
group by product_id;


create or replace materialized view MV_TOP_CUSTOMERS as
select 
    customer_id, 
    sum(quantity * price) as revenue
from SALES
group by customer_id;

select * from MV_TOP_PRODUCTS
order by total_quantity desc
limit 5;

select * from MV_TOP_CUSTOMERS
order by revenue desc
limit 5;









