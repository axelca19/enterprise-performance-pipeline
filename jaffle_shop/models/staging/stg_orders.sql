WITH source AS (
    SELECT * FROM {{ source('snowflake_raw', 'RAW_CARTS') }}
),

flattened_orders AS (
    SELECT
        -- Order Info
        c.id as order_id,
        CAST(c.userId AS INT) as user_id,
        CAST(c.date AS TIMESTAMP) as order_date,

        -- Exploded Product Info
        -- "value" comes from the flatten function
        f.value:productId::INT as product_id,
        f.value:quantity::INT as quantity,
        
        c._loaded_at

    FROM source c,
    -- THE MAGIC: Parse the text into JSON, then Flatten it
    LATERAL FLATTEN(input => TRY_PARSE_JSON(c.products)) f
)

SELECT * FROM flattened_orders