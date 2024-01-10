{{ config(
  enabled = false,
  materialized = view
) }}

with customers as (
    select * from {{ ref('customers')}}

),

order_items as (
    select * from {{ ref('order_items')}}

)

select customer_key, count(*) as parts_ordered, listagg(part_key, ', ') from order_items where order_items.order_status_code = 'F' group by customer_key