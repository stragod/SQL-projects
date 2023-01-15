 1. To analyze the trading volume of different currency pairs on a cryptocurrency exchange.

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
    
2.To calculate the total trading volume for each base currency:

WITH trading_volume AS (
    SELECT 
        base_currency, 
        SUM(quantity * price) AS volume 
    FROM 
        trades 
    GROUP BY 
        base_currency
)
SELECT 
    base_currency, 
    SUM(volume) as total_volume 
FROM 
    trading_volume
GROUP BY 
    base_currency;

3.To calculate the average trading volume for each currency pair:

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
    AVG(volume) as avg_volume 
FROM 
    trading_volume
GROUP BY 
    base_currency, 
    quote_currency;
    
4. To calculate the trading volume for each currency pair by day:

WITH trading_volume AS (
    SELECT 
        base_currency, 
        quote_currency, 
        DATE(timestamp) as day,
        SUM(quantity * price) AS volume 
    FROM 
        trades 
    GROUP BY 
        base_currency, 
        quote_currency,
        DATE(timestamp)
)
SELECT 
    base_currency, 
    quote_currency, 
    day,
    SUM(volume) as daily_volume 
FROM 
    trading_volume
GROUP BY 
    base_currency, 
    quote_currency,
    day;
    
5. To find the top 10 currency pairs by trading volume:

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
    volume
FROM 
    trading_volume
ORDER BY volume DESC
LIMIT 10;

6.To find the trading volume for each currency pair for a specific date range:

WITH trading_volume AS (
    SELECT 
        base_currency, 
        quote_currency, 
        SUM(quantity * price) AS volume 
    FROM 
        trades 
    WHERE 
        timestamp >= 'YYYY-MM-DD'
        AND timestamp <= 'YYYY-MM-DD'
    GROUP BY 
        base_currency, 
        quote_currency
)
SELECT 
    base_currency, 
    quote_currency, 
    volume
FROM 
    trading_volume
ORDER BY volume DESC;

7.To find the top 10 currency pairs by trading volume for a specific date range and hour of the day:

WITH trading_volume AS (
    SELECT 
        base_currency, 
        quote_currency, 
        DATE_PART('hour', timestamp) as hour,
        SUM(quantity * price) AS volume 
    FROM 
        trades 
    WHERE 
        timestamp >= 'YYYY-MM-DD'
        AND timestamp <= 'YYYY-MM-DD'
    GROUP BY 
        base_currency, 
        quote_currency,
        hour
)
SELECT 
    base_currency, 
    quote_currency, 
    volume,
    hour
FROM 
    trading_volume
ORDER BY volume DESC
LIMIT 10;


