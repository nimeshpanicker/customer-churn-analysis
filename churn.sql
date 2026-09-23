DROP TABLE IF EXISTS telco_churn;

CREATE TABLE telco_churn (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges VARCHAR(20),
    TotalCharges VARCHAR(20),
    Churn VARCHAR(10)
);

SELECT 
    customerID,
    COUNT(*) AS duplicate_count
FROM telco_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

DELETE FROM telco_churn
WHERE ctid IN (
    SELECT ctid
    FROM (
        SELECT 
            ctid,
            ROW_NUMBER() OVER (
                PARTITION BY customerID
                ORDER BY ctid
            ) AS row_num
        FROM telco_churn
    ) AS duplicates
    WHERE row_num > 1
);


--Q1. How many total customers are in the dataset?

SELECT COUNT(*) AS total_customers
FROM telco_churn;

--Q2. How many customers have churned?

SELECT COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes';

--Q3. What is the overall churn rate?

SELECT 
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn;

--Q4. How many customers are there by gender?

SELECT gender, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY gender
ORDER BY customer_count DESC;

--Q5. What is the churn count by gender?

SELECT gender, COUNT(*) AS churn_count
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY gender
ORDER BY churn_count DESC;

--Q6. What is the churn rate by gender?

SELECT gender,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY gender
ORDER BY churn_rate DESC;

--Q7. How many senior citizen customers are there?

SELECT SeniorCitizen, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY SeniorCitizen
ORDER BY SeniorCitizen DESC;

--Q8. What is the churn rate among senior citizens?

SELECT SeniorCitizen,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY SeniorCitizen
ORDER BY churn_rate DESC;

--Q9. What is the churn count by contract type?

SELECT Contract, COUNT(*) AS churn_count
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY churn_count DESC;

--Q10. What is the churn rate by contract type?

SELECT Contract,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

--Q11. What is the average tenure of all customers?

SELECT ROUND(AVG(tenure), 2) AS average_tenure
FROM telco_churn;

--Q12. What is the average tenure of churned customers?

SELECT ROUND(AVG(tenure), 2) AS average_tenure
FROM telco_churn
WHERE Churn = 'Yes';

--Q13. How many customers use each internet service?

SELECT InternetService, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY InternetService
ORDER BY customer_count DESC;

--Q14. What is the churn rate by internet service?

SELECT InternetService,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

--Q15. How many customers have phone service?

SELECT PhoneService, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY PhoneService
ORDER BY customer_count DESC;

--Q16. What is the churn rate by phone service?

SELECT PhoneService,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY PhoneService
ORDER BY churn_rate DESC;

--Q17. How many customers use paperless billing?

SELECT PaperlessBilling, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY PaperlessBilling
ORDER BY customer_count DESC;

--Q18. What is the churn rate by paperless billing?

SELECT PaperlessBilling,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY PaperlessBilling
ORDER BY churn_rate DESC;

--Q19. What is the customer count by payment method?

SELECT PaymentMethod, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY customer_count DESC;

--Q20. Which payment method has the highest churn count?

SELECT PaymentMethod, COUNT(*) AS churn_count
FROM telco_churn
WHERE Churn = 'Yes'
GROUP BY PaymentMethod
ORDER BY churn_count DESC;

--Q21. What is the average monthly charge by churn status?

SELECT Churn,
ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM telco_churn
GROUP BY Churn
ORDER BY average_monthly_charges DESC;

--Q22. What is the average total charge by churn status?

SELECT Churn,
ROUND(AVG(NULLIF(TotalCharges, '')), 2) AS average_total_charges
FROM telco_churn
GROUP BY Churn;

--Q23. How many customers have online security?

SELECT OnlineSecurity, COUNT(*) AS customer_count
FROM telco_churn
GROUP BY OnlineSecurity
ORDER BY customer_count DESC;

--Q24. What is the churn rate by online security status?

SELECT OnlineSecurity,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;

--Q25. What is the churn rate by tech support status?

SELECT TechSupport,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY TechSupport
ORDER BY churn_rate DESC;

--Q26. How many customers have a partner and dependents?

SELECT Partner,
Dependents,
COUNT(*) AS customer_count
FROM telco_churn
GROUP BY Partner, Dependents
ORDER BY customer_count DESC;

--Q27. What is the churn rate by multiple lines status?

SELECT MultipleLines,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY MultipleLines
ORDER BY churn_rate DESC;

--Q28. Which customers have the highest monthly charges?

SELECT customerID, MonthlyCharges, Contract, Churn
FROM telco_churn
ORDER BY MonthlyCharges DESC
LIMIT 10;

--Q29. Find the top 5 customer groups with the highest churn rate based on contract type and internetservice.

SELECT Contract,
InternetService,
ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) ,2) AS churn_rate
FROM telco_churn
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC
LIMIT 5;

--Q30. Find customers who have churned and have a tenure of less than 12 months.

SELECT customerID,
tenure,
Contract,
MonthlyCharges,
Churn
FROM telco_churn
WHERE Churn = 'Yes'
AND tenure < 12
ORDER BY tenure ASC;