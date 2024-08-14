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

    select
        email

    from source
    where email is not null
)

select * from renamed