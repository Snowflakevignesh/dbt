{{ config(materialized='table') }}

with orders as (
    
    select * from {{ ref('orders') }} 

),

 final as (

    select 

			orders.ROWID as row_id,
			orders.ORDERID as order_id,
			orders.ORDERDATE as order_date,
			orders.SHIPDATE as order_shipdate,
			orders.SHIPMODE as order_shipmode,
			orders.CUSTOMERID as customer_id,
			orders.CUSTOMERNAME as customer_name,
			orders.SEGMENT as segment,
			orders.COUNTRY as country,
			orders.CITY as city,
			orders.STATE as o_state,
			orders.POSTALCODE as postalcode,
			orders.REGION as region,
			orders.PRODUCTID as product_id,
			orders.CATEGORY as category,
			orders.SUBCATEGORY as sub_category,
			orders.PRODUCTNAME as product_name,
			orders.SALES as sales,
			orders.QUANTITY as quantity,
			orders.DISCOUNT as discount,
			orders.PROFIT as profit
    from
        orders
)

select * from final order by order_date
