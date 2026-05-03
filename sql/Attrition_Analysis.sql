/* =========================================================
   Employee Attrition Analysis - SQL Queries
   Author: Riya Mahajan
   Description: Analysis of employee attrition trends using SQL
   ========================================================= */


/* ================================
   1. Overall Attrition Rate
   ================================ */

SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS Attrition_Rate
FROM dbo.Employee_Attrition;



/* ================================
   2. Attrition by Department
   ================================ */

SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS Attrition_Rate
FROM dbo.Employee_Attrition
GROUP BY Department
ORDER BY Attrition_Rate DESC;



/* ================================
   3. Attrition by Overtime
   ================================ */

SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Count,
    CAST(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS Attrition_Rate
FROM dbo.Employee_Attrition
GROUP BY OverTime
ORDER BY Attrition_Rate DESC;



/* ================================
   4. Attrition by Income Groups
   ================================ */

SELECT 
    CASE 
        WHEN MonthlyIncome <= 5000 THEN '0-5K'
        WHEN MonthlyIncome <= 10000 THEN '5K-10K'
        WHEN MonthlyIncome <= 15000 THEN '10K-15K'
        ELSE '15K+'
    END AS Income_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Count,

    CAST(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.Employee_Attrition

GROUP BY 
    CASE 
        WHEN MonthlyIncome <= 5000 THEN '0-5K'
        WHEN MonthlyIncome <= 10000 THEN '5K-10K'
        WHEN MonthlyIncome <= 15000 THEN '10K-15K'
        ELSE '15K+'
    END

ORDER BY Attrition_Rate DESC;



/* ================================
   5. Attrition by Tenure
   ================================ */

SELECT 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        WHEN YearsAtCompany <= 20 THEN '11-20 Years'
        WHEN YearsAtCompany <= 30 THEN '21-30 Years'
        ELSE '30+ Years'
    END AS Tenure_Group,

    COUNT(*) AS Total_Employees,

    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Attrition_Count,

    CAST(
        100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) / COUNT(*) 
        AS DECIMAL(5,2)
    ) AS Attrition_Rate

FROM dbo.Employee_Attrition

GROUP BY 
    CASE 
        WHEN YearsAtCompany <= 2 THEN '0-2 Years'
        WHEN YearsAtCompany <= 5 THEN '3-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        WHEN YearsAtCompany <= 20 THEN '11-20 Years'
        WHEN YearsAtCompany <= 30 THEN '21-30 Years'
        ELSE '30+ Years'
    END

ORDER BY Attrition_Rate DESC;