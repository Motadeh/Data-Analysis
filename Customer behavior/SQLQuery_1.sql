SELECT *
FROM "Customer Purchasing Behaviors";

--1. how many customers does the store have
--SELECT  count(*) as total_customers FROM "Customer Purchasing Behaviors";
SELECT count(distinct user_id) as total_customers
FROM "Customer Purchasing Behaviors";
--238 customers (No duplicates)


--2. What is the average income for the clients who come to this store?
SELECT
    avg(annual_income) as avg_annual_income,
    avg(annual_income)/12 as avg_monthly_income,
    min(annual_income) as min_annual_income,
    max(annual_income) as max_annual_income
FROM "Customer Purchasing Behaviors";
-- a. Average yearly income is 57407
-- b. Average monthly income is 4783
-- c. minimum annual income is 30000
-- d. maximum annual income is 75000


--3. What is the client average annual income by age?
SELECT
    avg(age) as avg_age,
    min(age) as min_age,
    max(age) as max_age
FROM "Customer Purchasing Behaviors";

-- Minimum age is 22
-- Maximum age is 55

-- Case statement
SELECT
    case
        when age <= 30 then '30 and younger'
        when age > 30 and age <= 40 then '31-40'
        else 'older than 40'
    end as age_group,
    avg(annual_income) as avg_annual_income,
    count(user_id) as age_group_count
FROM "Customer Purchasing Behaviors"
Group by 
    case
        when age <= 30 then '30 and younger'
        when age > 30 and age <= 40 then '31-40'
        else 'older than 40'
    end;

-- The age with highest purchasing power using annual income, is those older than 40
-- Majority of the clients are also above 40.

--4. What is the avergae purchase amount by age? 
SELECT
    case
        when age <= 30 then '30 and younger'
        when age > 30 and age <= 40 then '31-40'
        else 'older than 40'
    end as age_group,
    avg(annual_income) as avg_annual_income,
    avg(purchase_amount) as avg_purchase_amount,
    count(user_id) as age_group_count
FROM "Customer Purchasing Behaviors"
Group by 
    case
        when age <= 30 then '30 and younger'
        when age > 30 and age <= 40 then '31-40'
        else 'older than 40'
    end;

-- The age with highest purchasing power using annual income, is those older than 40


-- 5. What is the average income and purchase amount by loyalty score?
SELECT
    avg(loyalty_score) as avg_loyalty_score,
    min(loyalty_score) as min_loyalty_score,
    max(loyalty_score) as max_loyalty_score
FROM "Customer Purchasing Behaviors";

SELECT
    case
        when loyalty_score <= 3 then '3 and lower'
        when loyalty_score > 3 and loyalty_score <= 6 then '4-6'
        else 'higher than 6'
    end as loyalty_score_group,
    avg(annual_income) as avg_annual_income,
    avg(purchase_amount) as avg_purchase_amount,
    count(user_id) as loyalty_score_count
FROM "Customer Purchasing Behaviors"
Group by 
    case
        when loyalty_score <= 3 then '3 and lower'
        when loyalty_score > 3 and loyalty_score <= 6 then '4-6'
        else 'higher than 6'
    end;

-- 6. What is the average income and purchase amount by purchase frequency?

SELECT
    avg(purchase_frequency) as avg_purchase_frequency,
    min(purchase_frequency) as min_purchase_frequency,
    max(purchase_frequency) as max_purchase_frequency
FROM "Customer Purchasing Behaviors";

SELECT
    distinct region
FROM "Customer Purchasing Behaviors";

SELECT
    case
        when purchase_frequency <= 16 then '<=16'
        when purchase_frequency <= 23 then '<=23'
        else '> 23'
    end as purchase_frequency_group,
    avg(annual_income) as avg_annual_income,
    avg(purchase_amount) as avg_purchase_amount,
    sum(purchase_amount) as total_purchase_amount,
    count(user_id) as purchase_frequency_count
FROM "Customer Purchasing Behaviors"
Group by 
    case
        when purchase_frequency <= 16 then '<=16'
        when purchase_frequency <= 23 then '<=23'
        else '> 23'
    end;


SELECT
    case
        when purchase_frequency <= 16 then '<=16'
        when purchase_frequency <= 23 then '<=23'
        else '> 23'
    end as purchase_frequency_group,
    region,
    avg(annual_income) as avg_annual_income,
    avg(purchase_amount) as avg_purchase_amount,
    sum(purchase_amount) as total_purchase_amount,
    count(user_id) as purchase_frequency_count
FROM "Customer Purchasing Behaviors"
Group by 
    case
        when purchase_frequency <= 16 then '<=16'
        when purchase_frequency <= 23 then '<=23'
        else '> 23'
    end,
    region
ORDER BY
    purchase_frequency_group;

-- Minimum purchase_frequency is 10
-- Maximum purchase_frequency is 28
-- Average purchase_frequency is 19

-- The higher the purchase frequency, the higher the average income and purchase amount
-- group with higest number of clients are those with purchase frequency between 17 and 23
-- Marketing team should target 

-- Distinct regions are East, North, South, West


-- 7. What is the average income and purchase amount by purchase frequency?
SELECT count(distinct user_id) as total_customers
FROM "Customer Purchasing Behaviors";
