{{ config(materialized='table') }}

with source as (
    select * from {{ source('resale', 'public_resale_flat_prices_from_jan_2017') }}
)

select
    month,
    town,
    flat_type,
    block,
    street_name,
    storey_range,
    cast(floor_area_sqm as numeric) as floor_area_sqm,
    flat_model,
    lease_commence_date,
    remaining_lease,
    cast(resale_price as numeric) as resale_price,
    cast(resale_price as numeric) / cast(floor_area_sqm as numeric) as price_per_sqm
from source