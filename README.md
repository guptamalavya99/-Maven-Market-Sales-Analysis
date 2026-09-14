# Maven Market Sales Analysis

An end-to-end retail sales analysis project using **PostgreSQL and Power BI**, based on Maven Market's 1997–1998 business data.

The project focuses on using SQL to answer business questions and Power BI to analyse and communicate the results through an interactive dashboard.

> **Note:** The Maven Market dataset used in this project was already cleaned and prepared. Therefore, data cleaning is not the focus of this project. The main focus is **SQL analysis, business problem-solving, data interpretation, and Power BI visualization**.

---

## Project Overview

Maven Market is a mid-sized retail business operating a network of stores across multiple regions, serving a diverse customer base through a broad range of products and brands.

This project analyses Maven Market's **1997–1998 business data** to understand performance across:

- Stores
- Products
- Customers
- Regions
- Sales
- Returns

The analysis was carried out primarily using **PostgreSQL and Power BI**, with supporting documentation created using Notion and Microsoft Word.

---

##  Dataset

The dataset contains Maven Market's retail business data for **1997 and 1998**.

It includes the following tables:

- **Calendar** – Date information for time-based analysis
- **Customers** – Customer demographic and membership information
- **Products** – Product and brand information
- **Regions** – Regional and geographical information
- **Returns** – Product return information for 1997–1998
- **Stores** – Store location, type, and size information
- **Transactions** – Sales transactions from 1997 and 1998

The dataset was already cleaned before being used for this project. The analysis therefore focuses on extracting insights from the available data rather than performing a separate data-cleaning workflow.

---

##  Tools Used

| Tool | Purpose |
|---|---|
| **PostgreSQL** | SQL queries, aggregations, rankings, comparisons, and business analysis |
| **Power BI** | Data modelling, DAX, interactive dashboards, and visualization |
| **Notion** | Detailed documentation and presentation of the analysis |
| **Microsoft Word** | Preparation of supporting business and SQL reports |

---

#  Key Insights

The analysis was divided into four main areas: **Sales & Store Performance, Product Performance, Returns & Operational Performance, and Customer Performance.**

### Sales & Store Performance

- Revenue increased from approximately **$565K in 1997 to $1.2M in 1998**.
- The number of active stores increased from **13 in 1997 to all 24 stores in 1998**, closely aligning with the revenue increase.
- **Supermarkets** generated the highest revenue at approximately **$789K**.
- **North West** was the strongest region at approximately **$848K**, while **Central West** generated approximately **$9K**.

###  Product Performance

- **Hermanos** was the top-performing brand, generating approximately **$56.7K in revenue**.
- **Hermanos Green Pepper** was the highest-revenue individual product at approximately **$2.49K**.
- Some high-volume products generated relatively low profit per unit, highlighting potential areas for further margin investigation.
- Product performance was almost evenly split between products performing above and below their respective brand averages.

### Returns & Operational Performance

- **Store 8** recorded the highest store return rate at **1.17%**.
- **King** had the highest overall brand return rate at **1.78%**.
- Return rates varied considerably across stores, suggesting that store-specific factors may influence return patterns.

###  Customer Performance

- **Bronze members** generated the highest purchasing volume at **465,090 units**.
- **Professional** customers generated the highest purchasing volume among occupation groups.
- Most customers were classified as **Low Brand Diversity**, with **5,148 customers** in this category.
- The customer base was heavily concentrated in the **Bronze membership tier**.

---

#  Power BI Dashboard

The Power BI dashboard contains four main analytical pages:

### 1. Overview

Provides the overall business picture, including revenue, units sold, transactions, customers, profit, trends, regions, store types, brands, and countries.

### 2. Product Detail

Examines product-level revenue and profit, top products, brands, and product attributes such as low-fat and recyclable packaging.

### 3. Customer Detail

Analyses customers by education, occupation, location, membership tier, purchasing behaviour, and individual performance.

### 4. Store Detail

Examines store performance by location, store type, return rate, store size, revenue, and city-level unit sales.

---

# Project Structure

```text
Maven Market Sales Analysis/
│
├── Dashboard/
│   ├── Maven Market Business Dashboard.pbix
│   └── Maven Market Business Report.pdf
│
├── Dataset/
│   ├── Transactions/
│   │   ├── MavenMarket_Transactions_1997.csv
│   │   └── MavenMarket_Transactions_1998.csv
│   │
│   ├── MavenMarket_Calendar.csv
│   ├── MavenMarket_Customers.csv
│   ├── MavenMarket_Products.csv
│   ├── MavenMarket_Regions.csv
│   ├── MavenMarket_Returns_1997-1998.csv
│   └── MavenMarket_Stores.csv
│
└── SQL Analysis/
    │
    ├── Queries/
    │   ├── Q1.sql
    │   ├── Q2 part-1.sql
    │   ├── Q2 part-2.sql
    │   ├── Q3.sql
    │   ├── Q4.sql
    │   ├── Q5.sql
    │   ├── Q6.sql
    │   ├── Q7.sql
    │   ├── Q8.sql
    │   ├── Q9 part-1.sql
    │   ├── Q9 part-2.sql
    │   ├── Q10.sql
    │   ├── Q11 part-1.sql
    │   ├── Q11 part-2.sql
    │   └── Q12.sql
    │
    ├── Results csv/
    │   ├── Q1.csv
    │   ├── Q2 part-1.csv
    │   ├── Q2 part-2.csv
    │   ├── Q3.csv
    │   ├── Q4.csv
    │   ├── Q5.csv
    │   ├── Q6.csv
    │   ├── Q7.csv
    │   ├── Q8.csv
    │   ├── Q9 part-1.csv
    │   ├── Q9 part-2.csv
    │   ├── Q10.csv
    │   ├── Q11 part-1.csv
    │   ├── Q11 part-2.csv
    │   └── Q12.csv
    │
    └── SQL Report/
        └── Maven Market - Data Analysis Report.pdf

```

#  Project Reports

The repository contains the supporting reports and assets used throughout the project.

### Business Report

The **Maven Market Business Report** documents the key findings from the Power BI dashboard, covering overall business performance, products, customers, stores, regions, and operational performance.

### SQL Analysis Report

The **SQL Data Analysis Report** documents the business questions analysed using PostgreSQL, along with the corresponding SQL analysis, results, and insights.

All reports and project assets have been uploaded to this repository.

---

#  Notion Report

A detailed version of the analysis is also available directly in Notion.

The Notion report provides a structured view of the business questions, SQL analysis, results, and insights.

👉 https://app.notion.com/p/Maven-Market-DATA-ANALYSIS-3d64b086eb6f8036ae8ac7a01be2252d?source=copy_link

> **Note:** Every report and project asset has been uploaded to this GitHub repository. The Notion report link is provided above so that the complete analysis can also be accessed directly through Notion.
