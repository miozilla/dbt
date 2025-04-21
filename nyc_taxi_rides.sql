SELECT
    trip_id,
    pickup_datetime,
    dropoff_datetime,
    passenger_count,
    trip_distance,
    fare_amount,
    tip_amount,
    total_amount,
    payment_type,
    CASE 
        WHEN payment_type = 1 THEN 'Credit Card'
        WHEN payment_type = 2 THEN 'Cash'
        ELSE 'Other'
    END AS payment_type_desc
FROM {{ source('nyc_taxi', 'yellow_taxi_data') }}
WHERE pickup_datetime >= '2024-01-01'