# International debt data
International Debt Statistics (IDS), successor to Global Development Finance and World Debt Tables, is designed to respond to user demand for timely, comprehensive data on trends in external debt in low- and middle-income countries. we are gonna analyse and find the trends in the international debt data provided by the international debt statistics.

We are going to find the answer to questions like:

- What is the total amount of debt that is owed by the countries listed in the dataset?
- Which country owns the maximum amount of debt?
- What is the average amount of debt owed by countries and the reason for the loan grant?

###### 1. we look at how the data looks like 
select * from ids
limit 10;

###### 2. Number of distinct countries that have debts
Without understanding the count of distinct countries in the data, we will not be able to perform our analyses correctly. So we extract the number of unique countries present in the table.

SELECT COUNT(DISTINCT(country_me)) as distinct_countries
FROM ids;

###### 3. Finding out distinct debt grant reasons
Knowing about these various debt grant reasons can help us understand the areas in which a country is indebted to.

SELECT DISTINCT(Series_code) AS debt_indicators
FROM ids
ORDER BY 1;

###### 4. Finding out total amount of debt owned by the countries
the total debt owed by each country overall gives us an idea about the amount of debt owed by different countries. This would help us to unedrstand the standings of different countries.

SELECT 
ROUND(SUM(debt)/1000000, 2) AS total_debt
FROM ids;

###### 5. Finding the country with the highest debt
Now that we have the exact total of the amounts of debt owed by several countries,we can now find the country that owns the highest amount of debt. this debt is found by adding different debts owed by a country across several categories. This will help to understand more about the country in terms of its socio-economic scenarios

SELECT 
country_me , SUM(debt) AS total_debt
FROM ids
GROUP BY country_me
ORDER BY total_debt DESC
LIMIT 1;

###### 6. Average debt among all the debt grant
Now we find the avergae debt each country owes

SELECT 
    Series_code  AS debt_indicator,
    Series_name ,
    AVG(debt) AS average_debt
FROM ids
GROUP BY Series_code, Series_name
ORDER BY average_debt DESC
LIMIT 10;

###### 7. highest amount of principal payments
We can see that the indicator DT.AMT.DLXF.CD tops the chart of average debt. This category includes repayment of long term debts. Countries take on long-term debt to acquire immediate capital.

An interesting observation in the above finding is that there is a huge difference in the amounts of the indicators after the second one. This indicates that the first two indicators might be the most severe categories in which the countries owe their debts.

We can investigate this a bit more so as to find out which country owes the highest amount of debt in the category of long term debts (DT.AMT.DLXF.CD). Since not all the countries suffer from the same kind of economic disturbances, this finding will allow us to understand that particular country's economic condition a bit more specifically.

