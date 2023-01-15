WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        open,
        high,
        low,
        close,
        volume
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    timestamp,
    close,
    close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return,
    SUM(volume) OVER (ORDER BY timestamp ROWS BETWEEN 5 PRECEDING AND CURRENT ROW) as rolling_volume
FROM 
    stock_prices

This code will retrieve the historical stock prices for a specific symbol, and calculates the daily return and rolling volume. The daily return is calculated as the ratio of the current close price to the previous close price. The rolling volume is calculated as the sum of the volume over a rolling window of 5 days.

2.To calculate the average closing price for a specific month:

WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    DATE_TRUNC('month', timestamp) as month,
    AVG(close) as avg_close
FROM 
    stock_prices
GROUP BY 
    month
ORDER BY 
    month

3.To calculate the standard deviation of the daily return:

WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close,
        close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    STDDEV(daily_return) as stddev_return
FROM 
    stock_prices

4. To calculate the highest and lowest closing price for each month:

WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    DATE_TRUNC('month', timestamp) as month,
    MAX(close) as max_close,
    MIN(close) as min_close
FROM 
    stock_prices
GROUP BY 
    month
ORDER BY 
    month
    
5. To calcualte the average daily return for a specific stock
WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close,
        close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    AVG(daily_return) as avg_daily_return
FROM 
    stock_prices

6.To calculate the maximum and minimum daily return for a psecific stock
WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close,
        close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    MAX(daily_return) as max_daily_return,
    MIN(daily_return) as min_daily_return
FROM 
    stock_prices

7.To calculate the standard deviation pf the daily returns for a specific stock.
WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close,
        close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    STDDEV(daily_return) as daily_return_stddev
FROM 
    stock_prices

8. to calculate the average volume for a specific stock over a rolling windoe of 30 days
WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        volume
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    timestamp,
    AVG(volume) OVER (ORDER BY timestamp ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) as rolling_average_volume
FROM 
    stock_prices

9. To calculate the correlation between the daily return and volume for a specific stock
WITH stock_prices AS (
    SELECT 
        symbol,
        timestamp,
        close,
        close / lag(close) OVER (ORDER BY timestamp) - 1 as daily_return,
        volume
    FROM 
        stock_prices
    WHERE 
        symbol = 'YOUR_SYMBOL'
)
SELECT 
    CORR(daily_return, volume) as return_volume_correlation
FROM 
    stock_prices
