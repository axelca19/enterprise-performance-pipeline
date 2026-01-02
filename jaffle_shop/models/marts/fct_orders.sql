WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

products AS (
    SELECT * FROM {{ ref('stg_products') }}
),

final AS (
    SELECT
        -- IDs
        o.order_id,
        o.order_date,
        
        -- KEYS (The Fix!)
        -- We generate the Hash here so it matches the Dimensions
        MD5(CAST(o.user_id AS VARCHAR)) as user_sk,
        MD5(CAST(o.product_id AS VARCHAR)) as product_sk,
        
        -- Metrics
        o.quantity,
        p.product_price,
        
        -- Revenue
        (o.quantity * p.product_price) as total_price

    FROM orders o
    JOIN products p ON o.product_id = p.product_id
)

SELECT * FROM final