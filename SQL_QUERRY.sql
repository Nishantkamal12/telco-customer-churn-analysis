-- Total Customer 

SELECT COUNT(*) AS total_customers
FROM churn_data;

-- Total Churn Customers

SELECT COUNT(*) AS churn_customers
FROM churn_data
WHERE Churn = 'Yes';

-- Churn Rate Analysis

SELECT
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)
*100.0/COUNT(*),
2
) AS churn_rate
FROM churn_data;


-- Contract Type Churn Analysis

SELECT
Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY Contract
ORDER BY churn_customers DESC;


-- Payment Method Churn Analysis

SELECT
PaymentMethod,
COUNT(*) AS total_churn
FROM churn_data
WHERE Churn='Yes'
GROUP BY PaymentMethod
ORDER BY total_churn DESC;

-- Internet Service Analysis

SELECT
InternetService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY InternetService;

-- High Risk Customer Analysis

SELECT
customerID,
MonthlyCharges,
tenure,
Contract
FROM churn_data
WHERE MonthlyCharges > 80
AND tenure < 12
AND Contract='Month-to-month';

-- Senior Citizen Churn Analysis

SELECT
SeniorCitizen,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY SeniorCitizen;

-- Loyal Customer Analysis

SELECT
customerID,
tenure,
MonthlyCharges
FROM churn_data
WHERE tenure > 60;

-- Average Revenue Analysis

SELECT
ROUND(AVG(MonthlyCharges),2) AS avg_revenue
FROM churn_data;

-- Customer Tenure Distribution

SELECT
tenure,
COUNT(*) AS total_customers
FROM churn_data
GROUP BY tenure
ORDER BY tenure;

-- Gender Wise Churn Analysis

SELECT
gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY gender;

-- Monthly Charges Category Analysis

SELECT
CASE
WHEN MonthlyCharges < 35 THEN 'Low Charges'
WHEN MonthlyCharges BETWEEN 35 AND 70 THEN 'Medium Charges'
ELSE 'High Charges'
END AS charge_category,

COUNT(*) AS total_customers,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers

FROM churn_data

GROUP BY charge_category;

-- Paperless Billing Churn Analysis

SELECT
PaperlessBilling,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY PaperlessBilling;

-- Tech Support Analysis

SELECT
TechSupport,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY TechSupport;

-- Streaming TV Analysis

SELECT
StreamingTV,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY StreamingTV;

-- Top 10 High Paying Customers

SELECT
customerID,
MonthlyCharges,
TotalCharges
FROM churn_data
ORDER BY MonthlyCharges DESC
LIMIT 10;

-- Customers Without Online Security

SELECT
OnlineSecurity,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers
FROM churn_data
GROUP BY OnlineSecurity;

-- Final Business Insight Query

SELECT
Contract,

ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge,

SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers

FROM churn_data

GROUP BY Contract;

























