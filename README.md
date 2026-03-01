**📊 Customer Retention Analysis using SQL**

📌 Project Overview

This project focuses on analyzing customer retention behavior using SQL.
The objective is to identify key factors influencing retention, understand customer behavior patterns, and generate actionable business insights.

The analysis covers business performance metrics, behavioral segmentation, revenue estimation, and advanced analytical insights using window functions.


🧹 Data Cleaning & Preparation

Before performing analysis, the dataset was thoroughly cleaned to ensure accuracy and reliability.

Data cleaning steps included:

Handling NULL and invalid values (e.g., #N/A, incorrect date formats like 1/0/00)

Converting date columns (created, firstorder, lastorder) into proper DATE format

Ensuring correct data types for numeric and categorical columns

Verifying retention flag consistency (0/1 values)

Removing or correcting inconsistent records

This ensured that all calculations (retention rate, revenue estimation, segmentation) were based on clean and structured data.


🗂 Dataset Description

The dataset contains customer-level aggregated information including:

custid – Unique customer ID

city – Customer location

created – Signup date

firstorder – First order date

lastorder – Most recent order date

avgorder – Average order value

ordfreq – Order frequency

eopenrate – Email open rate

eclickrate – Email click rate

paperless – Paperless service usage flag

retained – Customer retention status (1 = Retained, 0 = Not Retained)


📈 Business Questions Solved
🟢 Business Overview

Total number of customers

Overall customer retention rate

Retention rate by city

Distribution by favorite order day

Top 3 cities by customer count

🟡 Retained vs Non-Retained Analysis

Average order value comparison

Average order frequency comparison

Email open rate comparison

Email click rate impact on retention

Retention rate among paperless users

🟠 Behavioral Analysis

Retention rate among high-frequency customers

Retention rate among high-value customers

Customers inactive for more than 6 months

Average active duration (first to last order)

Month-wise customer signup trend

🔵 Advanced & Analytical Insights

Top 10 retained customers by estimated revenue

Revenue contribution: retained vs non-retained

High-value non-retained customers (churn risk)

City ranking by retention rate (Window Function)

Customer segmentation (High / Medium / Low Value)

💰 Revenue Estimation Logic

Since transaction-level order data was not available, customer revenue was estimated using:

Estimated Revenue = avgorder × ordfreq

This provides an approximation of customer lifetime revenue based on available aggregated metrics.


🛠 SQL Concepts Used

Aggregate Functions (SUM, AVG, COUNT)

CASE Statements

Subqueries

Common Table Expressions (CTE)

Window Functions (RANK)

Date Functions (DATEDIFF, DATE_FORMAT, DATE_SUB)

Conditional Segmentation Logic


📊 Key Insights

High-frequency and high-value customers show significantly higher retention rates.

Email engagement (open & click rate) positively correlates with retention.

Certain cities demonstrate stronger retention performance.

A segment of high-value but non-retained customers represents potential churn risk.

Revenue contribution is heavily driven by retained customers.


🚀 Project Outcome

This project demonstrates:

Strong SQL querying skills

Data cleaning and transformation ability

Business-driven analytical thinking

Customer segmentation logic

Revenue estimation modeling

Window function expertise

The analysis can help businesses improve retention strategy, identify churn risks, and optimize marketing engagement.


📎 Author

Adarsh Kumar
