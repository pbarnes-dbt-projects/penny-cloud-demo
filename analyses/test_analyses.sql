select * from {{ ref('cloud_demo_tpch', 'fct_order_items')}}