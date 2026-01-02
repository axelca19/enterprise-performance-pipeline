WITH source AS (
    SELECT * FROM {{ source('snowflake_raw', 'RAW_USERS') }}
),

clean_users AS (
    SELECT
        -- IDs
        MD5(CAST(id AS VARCHAR)) as user_sk,
        CAST(id AS INT) as user_id,

        -- Columns
        CAST(username AS VARCHAR) as username,
        CAST(email AS VARCHAR) as email,

        -- JSON Parsing (Name)
        TRIM(CONCAT(
            TRY_PARSE_JSON(name):firstname::VARCHAR, 
            ' ', 
            TRY_PARSE_JSON(name):lastname::VARCHAR
        )) as full_name,

        -- JSON Parsing (Address)
        TRY_PARSE_JSON(address):city::VARCHAR as city,
        TRY_PARSE_JSON(address):zipcode::VARCHAR as zipcode,

        _loaded_at

    FROM source
)

SELECT * FROM clean_users