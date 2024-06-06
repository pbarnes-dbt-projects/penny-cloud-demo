WITH order_items AS (
    SELECT * FROM {{ ref('cloud_demo_tpch', 'fct_order_items') }}
),

orders AS (
    SELECT * FROM {{ ref('cloud_demo_tpch', 'fct_orders') }}
),

suppliers AS (
    SELECT * FROM {{ ref('dim_suppliers') }}
)

SELECT
    supplier_name,
    date_trunc('month', orders.order_date) AS month,
    SUM(DISCOUNTED_ITEM_SALES_AMOUNT) supplier_sales,
    SUM(QUANTITY) inventory_sold,
    COUNT(DISTINCT order_items.part_key) parts_sold_distinct,
    LISTAGG(DISTINCT order_items.part_key, ', ') parts_sold,
    COUNT(DISTINCT orders.customer_key) customers_count_distinct,
    LISTAGG(DISTINCT orders.customer_key, ', ') customers,
FROM
    order_items
INNER JOIN orders ON order_items.order_key = orders.order_key
INNER JOIN suppliers ON order_items.supplier_key = suppliers.supplier_key
GROUP BY month, supplier_name
ORDER BY month, supplier_name
