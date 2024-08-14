{{
    config( materialized='table' )
}}

with source as (

    select * from {{ ref('stg_customers') }}

),

renamed as (

    select email from source
)

select * from renamed