/* Create a pivot table with hard-coded columns based on a query of the ship modes that are in the system */

with merged as (
    select
        date_part('year', order_date) as order_year,
        ship_mode,
        gross_item_sales_amount
    from {{ ref('cloud_demo_tpch', 'fct_order_items') }}
)

select
    * 
from
    merged
    -- have to manually map strings in the pivot operation
    pivot(sum(gross_item_sales_amount) for ship_mode in (
        'REG AIR',
        'RAIL',
        'SHIP',
        'TRUCK',
        'FOB',
        'MAIL',
        'AIR'
    )) as p 

order by order_year
