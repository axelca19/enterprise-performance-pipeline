WITH source AS (
    SELECT * FROM {{ source('snowflake_raw', 'RAW_PRODUCTS') }}
),

clean_data AS (
    SELECT
        MD5(CAST(id AS VARCHAR)) as product_sk,
        CAST(id AS INT) as product_id,
        CAST(title AS VARCHAR) as product_title,
        CAST(price AS FLOAT) as product_price,
        CAST(category AS VARCHAR) as product_category,
        TRY_PARSE_JSON(rating):rate::FLOAT as rating_score,
        _loaded_at
    FROM source
)

SELECT * FROM clean_data