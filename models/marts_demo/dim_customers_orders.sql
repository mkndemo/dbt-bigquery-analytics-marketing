{{
    config(
        materialized='table'
    )
}}

with customers as (
    select * from {{ ref('stg_customers_demo') }}
),

orders as (
    select * from {{ ref('stg_orders_demo') }}
),

final as (
    select
        customers.customer_id,
        customers.full_name,
        orders.order_date,
        orders.order_id,
        orders.status
    from customers
    inner join orders on customers.customer_id = orders.customer_id
)

select * from final
