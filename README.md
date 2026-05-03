# Nigeria Education Sector Spending Analysis 2015-2025

## Project Overview
An analysis of Nigeria's federal education budget from 2015 to 2025,
examining the gap between nominal spending growth and the declining budget
priority relative to UNESCO recommendations.

## Problem Statement
Nigeria's education budget has grown 421% in naira terms since 2015.
Yet the country has never once met the UNESCO-recommended threshold of
15-20% of the national budget for education. This project investigates
that contradiction using real government data.

## Tools Used
- Google Sheets (data compilation and cleaning)
- SQLite via DB Browser (data querying and analysis)
- Tableau Public (interactive dashboard)

## Data Sources
- Federal Budget Office Nigeria (budgetoffice.gov.ng)
- World Bank Open Data (SE.XPD.TOTL.GB.ZS and SE.XPD.TOTL.GD.ZS)
- dataphyteng via Instagram (10-year education budget compilation)

## Key Findings
1. Nigeria allocated below the UNESCO 15% benchmark in all 11 years
   from 2015 to 2025
2. Education budget share fell from 10.75% in 2015 to 5.47% in 2025
   despite 421% nominal naira growth
3. 4 years recorded negative budget growth: 2016, 2017, 2019, 2020
   suggesting political cycle-driven budgeting

## SQL Queries
Six SQL queries were written in SQLite covering:
- Education allocation trend analysis
- UNESCO benchmark gap calculation
- Budget priority classification
- World Bank vs Federal Government reporting comparison
- Year-on-year growth rate calculation
- Overall funding status summary

All queries are available in the sql/queries.sql file.

## Interactive Dashboard
View the live Tableau Public dashboard here:
https://public.tableau.com/views/NigeriaEducationSectorSpendingAnalysis2015-2025/NigeriaEducationDashboard

## Repository Structure

- data/raw/ -- original downloaded source files
- data/clean/ -- cleaned CSV files used for analysis
- sql/queries.sql -- all 6 SQL queries with comments
- report/insights.md -- key findings and recommendations

## About
Built by Winning David, a data analyst with a background in
Quantity Surveying. Open to remote data analyst roles.
LinkedIn: www.linkedin.com/in/winning-david
