WITH staging AS (
    SELECT * FROM {{ ref('stg_users') }}
)

SELECT
    user_sk,
    user_id,
    full_name,
    email,
    city,
    zipcode
FROM staging