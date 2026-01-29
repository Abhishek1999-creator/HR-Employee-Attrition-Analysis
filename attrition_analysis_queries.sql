use hr_attrition

-- Q1. Total number of employees in the company

SELECT COUNT(*) AS total_employees
FROM hr_attrition_table;

-- Q2. Total number of employees who left the company

SELECT COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1;

-- Q3. Overall attrition rate (%)

SELECT 
    ROUND(
        100.0 * SUM(CAST(attrition_flag AS INT)) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_attrition_table;

-- Q4. Attrition count by department

SELECT department, COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY department;

-- Q5. Average monthly income by department

SELECT department, AVG(monthlyincome) AS avg_monthly_income
FROM hr_attrition_table
GROUP BY department;

-- Q6. Attrition count by gender

SELECT gender, COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY gender;


-- Q7. Employee count by age group

SELECT age_group, COUNT(*) AS employee_count
FROM hr_attrition_table
GROUP BY age_group;


-- Q8. Attrition count by job role

SELECT jobrole, COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY jobrole;


-- Q9. Average years at company for employees who left

SELECT AVG(yearsatcompany) AS avg_years_at_company
FROM hr_attrition_table
WHERE attrition = 1;

-- Q10. Attrition count by overtime

SELECT overtime, COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY overtime;


-- Q11. Attrition rate by department

CREATE VIEW vw_attrition_rate_department

AS
WITH dept_cte AS (
    SELECT
        department,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY department
)
SELECT
    department,
    ROUND(
        100.0 * attrition_cnt / total_emp,
        2
    ) AS attrition_rate_pct
FROM dept_cte;


-- Q12. Attrition rate by age group

CREATE VIEW vw_attrition_rate_age_group

AS
WITH age_cte AS (
    SELECT
        age_group,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY age_group
)
SELECT
    age_group,
    ROUND(
        100.0 * attrition_cnt / total_emp,
        2
    ) AS attrition_rate_pct
FROM age_cte;



-- Q13. Attrition rate by income band

CREATE VIEW vw_attrition_rate_income_band AS

CREATE VIEW vw_attrition_rate_income_band
AS
WITH income_cte AS (
    SELECT
        income_band,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY income_band
)
SELECT
    income_band,
    ROUND(
        100.0 * attrition_cnt / total_emp,
        2
    ) AS attrition_rate_pct
FROM income_cte;



-- Q14. Average monthly income by attrition status

CREATE VIEW vw_avg_income_attrition_status AS

SELECT attrition,
       AVG(monthlyincome) AS avg_monthly_income
FROM hr_attrition_table
GROUP BY attrition;

-- Q15. Attrition count by experience group

CREATE VIEW vw_attrition_experience_group AS

SELECT experience_group,
       COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY experience_group;


-- Q16. Average years at company by department

CREATE VIEW vw_avg_tenure_department AS

SELECT department,
       AVG(yearsatcompany) AS avg_years
FROM hr_attrition_table
GROUP BY department;



-- Q17. Attrition rate by work-life balance

CREATE VIEW vw_attrition_worklife_balance

AS
WITH wlb_cte AS (
    SELECT
        worklifebalance,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY worklifebalance
)
SELECT
    worklifebalance,
    ROUND(
        100.0 * attrition_cnt / total_emp,
        2
    ) AS attrition_rate_pct
FROM wlb_cte;

-- Q18. Attrition count by marital status

CREATE VIEW vw_attrition_marital_status AS

SELECT maritalstatus,
       COUNT(*) AS attrition_count
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY maritalstatus;


-- Q19. Average total working years by job level

CREATE VIEW vw_avg_experience_job_level AS

SELECT joblevel,
       AVG(totalworkingyears) AS avg_working_years
FROM hr_attrition_table
GROUP BY joblevel;

-- Q20. Attrition rate by business travel

CREATE VIEW vw_attrition_business_travel AS

WITH travel_cte AS (
    SELECT 
        businesstravel,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY businesstravel
)
SELECT 
    businesstravel,
    ROUND(100.0 * attrition_cnt / total_emp, 2) AS attrition_rate_pct
FROM travel_cte;

-- Q21. Rank departments by attrition rate

CREATE VIEW vw_rank_department_attrition AS

WITH dept_cte AS (
    SELECT 
        department,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY department
)
SELECT 
    department,
    ROUND(100.0 * attrition_cnt / total_emp, 2) AS attrition_rate,
    RANK() OVER (
        ORDER BY attrition_cnt * 1.0 / total_emp DESC
    ) AS dept_rank
FROM dept_cte;

-- Q22. Top 3 job roles with highest attrition

CREATE VIEW vw_top_jobrole_attrition AS

SELECT jobrole,
       COUNT(*) AS attrition_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS role_rank
FROM hr_attrition_table
WHERE attrition = 1
GROUP BY jobrole;

-- Q23. Attrition rate by department and income band

CREATE VIEW vw_attrition_dept_income AS

WITH cte AS (
    SELECT 
        department,
        income_band,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY department, income_band
)
SELECT 
    department,
    income_band,
    ROUND(100.0 * attrition_cnt / total_emp, 2) AS attrition_rate
FROM cte;


-- Q24. Employees earning below department average income

CREATE VIEW vw_below_avg_income_department AS

SELECT *
FROM (
    SELECT *,
           AVG(monthlyincome) OVER (PARTITION BY department) AS dept_avg_income
    FROM hr_attrition_table
) t
WHERE monthlyincome < dept_avg_income;



-- Q25. Rank experience groups by attrition count



CREATE VIEW vw_rank_experience_attrition AS

WITH exp_cte AS (
    SELECT 
        experience_group,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY experience_group
)
SELECT 
    experience_group,
    attrition_cnt,
    DENSE_RANK() OVER (ORDER BY attrition_cnt DESC) AS exp_rank
FROM exp_cte;


-- Q26. Department-wise contribution to total attrition


CREATE VIEW vw_department_attrition_contribution AS
WITH dept_cte AS (
    SELECT 
        department,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY department
)
SELECT 
    department,
    ROUND(
        100.0 * attrition_cnt / SUM(attrition_cnt) OVER (), 
        2
    ) AS contribution_pct
FROM dept_cte;


-- Q27. Highest tenure employee in each department

CREATE VIEW vw_highest_tenure_department AS

SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY yearsatcompany DESC) AS tenure_rank
    FROM hr_attrition_table
) t
WHERE tenure_rank = 1;


-- Q28. Attrition rate by job level and overtime

CREATE VIEW vw_attrition_joblevel_overtime AS

WITH cte AS (
    SELECT 
        joblevel,
        overtime,
        COUNT(*) AS total_emp,
        SUM(CAST(attrition_flag AS INT)) AS attrition_cnt
    FROM hr_attrition_table
    GROUP BY joblevel, overtime
)
SELECT 
    joblevel,
    overtime,
    ROUND(100.0 * attrition_cnt / total_emp, 2) AS attrition_rate
FROM cte;

-- Q29. Cumulative attrition by years at company

CREATE VIEW vw_cumulative_attrition_years AS

SELECT 
    yearsatcompany,
    SUM(CAST(attrition_flag AS INT)) AS yearly_attrition,
    SUM(SUM(CAST(attrition_flag AS INT))) 
        OVER (ORDER BY yearsatcompany) AS cumulative_attrition
FROM hr_attrition_table
GROUP BY yearsatcompany;

-- Q30. High-risk employees (low income + overtime + poor work-life balance)

CREATE VIEW vw_high_risk_employees AS


SELECT *
FROM hr_attrition_table
WHERE income_band = 'Low'
  AND overtime = 1
  AND worklifebalance IN (1, 2);










































