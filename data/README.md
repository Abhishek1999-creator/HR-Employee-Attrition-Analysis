HR Employee Attrition Analysis 📊

 📌 Project Overview

Employee attrition is a critical challenge for organizations, impacting productivity, morale, and cost. This project focuses on analyzing HR Employee Attrition data to identify key factors influencing employee turnover and to provide actionable insights for HR and business leaders.

The dataset was sourced from Kaggle and contains thousands of employee records with 30+ attributes related to demographics, compensation, job role, experience, and performance.



 🎯 Objectives

* Identify key drivers of employee attrition
* Analyze attrition patterns across departments, job roles, income levels, and experience
* Perform advanced SQL analysis using window and aggregation functions
* Build interactive dashboards for business decision-making



 🧰 Tools & Technologies Used

* Python: Pandas, NumPy (Data Cleaning & Preprocessing)
* SQL: Aggregations, Window Functions, CTEs, Conditional Expressions
* Power BI: Data Modeling, DAX Measures, Interactive Dashboards
* GitHub: Version Control & Project Hosting

---

 📂 Dataset Information

* Raw Dataset: Downloaded from Kaggle (HR Employee Attrition dataset)
* Cleaned Dataset: `hr_attrition_clean.csv`
* Rows: Thousands of employee records
* Columns: 30+ HR-related attributes

Key Columns Include:

* Age
* Gender
* Department
* Job Role
* Monthly Income
* Years at Company
* Total Working Years
* Salary Hike Percentage
* Attrition (Yes / No)



 🧹 Data Cleaning (Python)

Performed using Pandas & NumPy:

* Removed duplicates
* Handled missing values
* Standardized column names
* Created derived columns (Income Band, Experience Group, Attrition Flag)
* Exported final clean dataset as CSV for SQL & Power BI


🧮 SQL Analysis

* Solved **25+ business-oriented SQL questions**
* Difficulty levels: Easy → Medium → Hard
* Concepts used:

  * Aggregation Functions (`SUM`, `AVG`, `COUNT`)
  * Window Functions (`ROW_NUMBER`, `RANK`, `SUM() OVER`)
  * Conditional Expressions (`CASE WHEN`)
  * CTEs and Views

📁 SQL scripts are available in the repository.



 📊 Power BI Dashboards

Created 4 interactive dashboards, each focused on a specific HR theme:

 1️⃣ Attrition Overview

* Overall attrition rate
* Active vs Churned employees
* Trend analysis

2️⃣ Department & Job Analysis

* Attrition by department and job role
* High-risk roles identification

3️⃣ Employee Demographics

* Attrition by age, gender, marital status
* Experience-based analysis

4️⃣ Compensation & Experience Insights

* Attrition by income band
* Salary hike impact
* High-risk employee identification table





 📈 Key Insights

* Employees with **low income and fewer years of experience** show higher attrition
* Certain job roles (e.g., Sales-related roles) have higher churn risk
* Higher salary hikes and longer tenure reduce attrition probability



📁 Repository Structure


HR-Employee-Attrition-Analysis/
│
├── data/
│   ├── raw_dataset.csv
│   └── hr_attrition_clean.csv
│
├── sql/
│   └── attrition_analysis_queries.sql
│
├── powerbi/
│   └── HR_Attrition_Dashboard.pbix
│
├── visuals/
│   └── dashboard_screenshots.pdf
│
│
└── README.md


 🚀 How to Run This Project

1. Review the cleaned dataset in the `data` folder
2. Explore SQL queries in the `sql` folder
3. Open the Power BI file (`.pbix`) to interact with dashboards


---
 📌 Future Enhancements

* Predictive attrition modeling (Machine Learning)
* Department-level KPI scorecards
* Drill-through dashboards for HR managers



👤 Author

Abhishek Biswas
Aspiring Data Analyst | SQL | Power BI | Python

📎 GitHub: *(Add your profile link here)*



⭐ If you found this project insightful, feel free to star the repository!
