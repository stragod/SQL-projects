Objective: To segment customers based on their demographics and purchase history, and identify patterns and trends in their behavior.
This project is based on a problem i encountered during my internship so the data source is confidential.
WITH customer_data AS (
    SELECT 
        customer_id,
        age,
        gender,
        income,
        occupation,
        SUM(purchase_amount) as total_purchases,
        COUNT(DISTINCT purchase_date) as purchase_frequency
    FROM 
        customer_data
    GROUP BY 
        customer_id,
        age,
        gender,
        income,
        occupation
),
segment_data AS (
    SELECT 
        customer_id,
        age,
        gender,
        income,
        occupation,
        total_purchases,
        purchase_frequency,
        CASE
            WHEN income <= 30000 THEN 'Low Income'
            WHEN income > 30000 AND income <= 60000 THEN 'Mid Income'
            WHEN income > 60000 THEN 'High Income'
        END as income_segment,
        CASE
            WHEN age <= 30 THEN 'Young'
            WHEN age > 30 AND age <= 60 THEN 'Mid Age'
            WHEN age > 60 THEN 'Senior'
        END as age_segment,
        CASE
            WHEN purchase_frequency <= 2 THEN 'Low Frequency'
            WHEN purchase_frequency > 2 AND purchase_frequency <= 4 THEN 'Mid Frequency'
            WHEN purchase_frequency > 4 THEN 'High Frequency'
        END as purchase_frequency_segment
    FROM 
        customer_data
)
SELECT 
    income_segment,
    age_segment,
    purchase_frequency_segment,
    COUNT(DISTINCT customer_id) as segment_size
FROM 
    segment_data
GROUP BY 
    income_segment,
    age_segment,
    purchase_frequency_segment

This code will retrieve the customer data, and create new columns by segmenting the data based on income, age, and purchase frequency. Then it will group the data by these segments and count the number of customers in each segment.

You can use this code to run the query on your database and see the results, which will be a table showing the size of each segment and the patterns and trends of the customer data.
