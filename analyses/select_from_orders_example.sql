

SELECT order_key, 
       order_date, 
       {{ standard_account_fields() }} 
FROM {{ ref('cloud_demo_tpch', 'fct_orders') }}