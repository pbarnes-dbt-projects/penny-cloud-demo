{{ config(
  enabled = false
) }}

with customers as (
    select * from {{ ref('dim_customers')}}

),

order_items as (
    select * from {{ ref('order_items')}}

)

select customer_key, count(*) as count_of_parts_ordered, listagg(part_key, ', ') as id_of_parts_ordered from order_items where order_items.order_status_code = 'F' group by customer_key



