# 📊 Customer Churn Analysis

## 📌 Project Overview

Customer Churn Analysis is an end-to-end data analytics project focused on understanding customer attrition for a telecommunications business.

The project combines:

**SQL Data Cleaning → SQL Business Analysis → Customer Segmentation → Power BI Dashboard → Business Insights**

The analysis uses customer demographics, account information, subscribed services, billing details, tenure, payment methods, and churn outcomes to identify patterns associated with customer churn.

---

## 🎯 Business Problem

The business needs to understand:

- How many customers are churning?
- Which customer segments have higher churn?
- Which contract types are associated with churn?
- How does tenure affect churn?
- Which internet and add-on services are associated with churn?
- Which payment methods show higher churn?
- Which currently retained customers may represent higher retention risk?

---

## 🎯 Project Objectives

- Clean and de-duplicate the customer dataset
- Calculate overall churn metrics
- Build a 30-query SQL analysis library
- Analyze churn by customer demographics
- Analyze churn by contract and services
- Analyze billing and payment behaviour
- Analyze customer tenure and lifecycle
- Segment retained customers by risk characteristics
- Build an interactive Power BI dashboard
- Translate analytical findings into business insights

---

## 🛠️ Tools & Technologies

- PostgreSQL
- SQL
- Microsoft Power BI
- Excel
- Data Cleaning
- Data Preparation
- Customer Segmentation
- KPI Analysis
- Data Visualization
- Business Intelligence
- Data Storytelling

---

## 📊 Dataset

The source dataset contains:

- 7,048 raw customer records
- 21 columns
- Customer demographics
- Account information
- Service subscriptions
- Billing information
- Contract details
- Payment methods
- Customer tenure
- Churn outcome

After removing duplicate customer records, the analytical dataset contains:

**7,043 unique customers**

---

## 🧹 Data Cleaning

The SQL preparation workflow included:

- Loading the raw CSV into PostgreSQL
- Checking duplicate customer IDs
- Removing duplicate records using `ROW_NUMBER()`
- Handling blank `TotalCharges` values
- Using `NULLIF()` during analysis
- Checking categorical values
- Standardizing inconsistent text values
- Preparing the dataset for Power BI analysis

### Data Quality Findings

- 5 duplicate customer records identified
- 133 blank `TotalCharges` values
- Duplicate records reduced the dataset from 7,048 to 7,043 customers
- Blank `TotalCharges` values were associated with customers having 0–1 months of tenure

---

## 🔎 SQL Analysis

A 30-query SQL analysis library was developed covering:

### Baseline Metrics

- Total customers
- Churned customers
- Overall churn rate

### Demographic Analysis

- Churn by gender
- Churn by senior-citizen status

### Contract & Service Analysis

- Churn by contract type
- Churn by internet service
- Churn by phone service
- Churn by add-on services

### Billing & Payment Analysis

- Churn by payment method
- Average monthly charges
- Average total charges

### Tenure & Lifecycle Analysis

- Average customer tenure
- Churn by tenure band
- Early-tenure churn

### Multi-dimensional Analysis

- High-churn contract/service combinations
- High-charge customers
- Customer risk segmentation

---

## 📈 Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Customers | 7,043 |
| Churn Rate | 26.54% |
| Churned Customers | 1,869 |
| Retained Customers | 5,174 |
| Retained — Normal Risk | 4,541 |
| Retained — High Risk | 633 |

---

## 📋 Churn by Contract

| Contract Type | Customers | Churn Rate |
|---|---:|---:|
| Month-to-month | 3,875 | 42.71% |
| One year | 1,473 | 11.27% |
| Two year | 1,695 | 2.83% |

Month-to-month customers represented 1,655 of the 1,869 churned customers.

---

## 🌐 Churn by Internet Service

| Internet Service | Churn Rate |
|---|---:|
| Fibre optic | 41.89% |
| DSL | 18.96% |
| No internet service | 7.40% |

The analysis also identified higher churn among month-to-month customers using fibre-optic service.

---

## 🔐 Add-on Service Analysis

Customers without online security or technical support showed substantially higher churn rates than customers with these services.

### Online Security

- No service: 41.77%
- Has service: 14.61%

### Tech Support

- No service: 41.64%
- Has service: 15.17%

---

## 💳 Payment Method Analysis

| Payment Method | Churn Rate |
|---|---:|
| Electronic check | 45.29% |
| Mailed check | 19.11% |
| Bank transfer (automatic) | 16.71% |
| Credit card (automatic) | 15.24% |

Electronic check customers had the highest churn rate in the dataset.

---

## ⏳ Tenure Analysis

| Tenure Band | Churn Rate |
|---|---:|
| 0–6 months | 52.94% |
| 6–12 months | 35.89% |
| 12+ months | 17.13% |

Average tenure:

- All customers: 32.37 months
- Churned customers: 17.98 months

The analysis found that churn decreases as customer tenure increases.

---

## 💰 Billing Analysis

| Metric | Retained | Churned |
|---|---:|---:|
| Average Monthly Charges | $61.27 | $74.42 |
| Average Total Charges | $2,577.98 | $1,594.13 |

Churned customers had higher average monthly charges but lower accumulated total charges.

---

## 📊 Power BI Dashboard

The project includes a single-page Power BI dashboard containing:

- Total Customers KPI
- Churn Rate KPI
- Churned Customers KPI
- Retained Customers by Risk Type
- Customer Retention Overview
- Churned Customers by Contract
- Churn Rate by Tenure Band
- Monthly Charges by Online Security & Online Backup
- Average Monthly Charges by Churn
- Monthly Charges by Customer Type

The dashboard supports interactive analysis through Power BI cross-filtering.

---

## 🔍 Key Business Insights

### 1. Contract Type

Month-to-month customers had a 42.71% churn rate compared with 2.83% for two-year customers.

### 2. Early Tenure

Customers with 0–6 months of tenure had a 52.94% churn rate.

### 3. Fibre-Optic Customers

Fibre-optic customers had a 41.89% churn rate compared with 18.96% for DSL customers.

### 4. Add-on Services

Customers without online security or tech support had substantially higher churn rates.

### 5. Payment Method

Electronic-check customers had a 45.29% churn rate.

### 6. High-Risk Retained Customers

633 currently retained customers were classified as High Risk based on characteristics associated with the churned population.

---

## 💡 Business Recommendations

Based on the analysis:

- Focus retention efforts on month-to-month customers.
- Strengthen customer onboarding during the first six months.
- Investigate the experience of fibre-optic customers.
- Promote online security and tech-support add-ons.
- Encourage migration from electronic check to automatic payment methods.
- Prioritize the 633 retained High Risk customers for proactive retention activity.
- Monitor churn KPIs regularly.

---

## 🔄 Project Workflow

```text
Raw Customer Data
        ↓
Data Profiling
        ↓
SQL Data Cleaning
        ↓
Duplicate Removal
        ↓
SQL Business Analysis
        ↓
Customer Segmentation
        ↓
Power BI Data Model
        ↓
Dashboard Development
        ↓
Business Insights
        ↓
Retention Recommendations
