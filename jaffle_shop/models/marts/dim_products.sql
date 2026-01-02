WITH staging AS (
    -- Logic: We reference the clean staging model, NOT the raw data.
    SELECT * FROM {{ ref('stg_products') }}
)

SELECT
    product_sk,       -- Primary Key (The Hash)
    product_id,       -- Natural Key
    product_title,
    product_category,
    product_price,
    rating_score
FROM staging