-- models/customer_campaign_v2.sql

{{
    config(
        materialized='table'
    )
}}

with

source as (
    select * from {{ source('jaffle_shop', 'customers') }}
),

renamed as (
    select email
    from source
    where email is not null
),

verified as (
    select email
    from renamed
    where email ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$'
)

select * from verified
