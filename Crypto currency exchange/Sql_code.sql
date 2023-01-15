WITH trading_volume AS (
    SELECT 
        base_currency, 
        quote_currency, 
        SUM(quantity * price) AS volume 
    FROM 
        trades 
    GROUP BY 
        base_currency, 
        quote_currency
)
SELECT 
    base_currency, 
    quote_currency, 
    volume, 
    RANK() OVER (ORDER BY volume DESC) AS rank 
FROM 
    trading_volume;
