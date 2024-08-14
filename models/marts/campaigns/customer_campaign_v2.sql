{{
    config( materialized='table' )
}}

with source as (
    select * from {{ ref('stg_customers') }}
),

renamed as (
    select email
    from source
    where email is not null
),

verified as (
    select email from renamed
    where email is not null
)

select * from verified
