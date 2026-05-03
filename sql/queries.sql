-- Query 1: Education allocation trend 2015-2025
-- Shows yearly allocation in naira billions, percentage of budget
-- and UNESCO benchmark for comparison

SELECT 
    year,
    education_allocation_ngn_billion,
    education_pct_of_budget,
    unesco_benchmark
FROM federal_budget
ORDER BY year ASC;



-- Query 2: Years below UNESCO benchmark
-- Calculates the gap between actual allocation and UNESCO recommended 15%
-- All 11 years fell below benchmark
-- The year with the biggest gap in benchmark was 2023 with 9.79%

SELECT 
    year,
    education_pct_of_budget,
    unesco_benchmark,
    (unesco_benchmark - education_pct_of_budget) AS gap_from_benchmark
FROM federal_budget
WHERE education_pct_of_budget < 15
ORDER BY gap_from_benchmark DESC;



-- Query 3: Nominal growth vs percentage decline
-- Shows the contradiction -- naira amounts increasing but budget priority falling
-- Only 1 year (2015) exceeded 10% of budget allocated to education

SELECT 
    year,
    education_allocation_ngn_billion,
    education_pct_of_budget,
    CASE 
        WHEN education_pct_of_budget >= 10 THEN 'Above 10%'
        WHEN education_pct_of_budget >= 7 THEN 'Between 7-10%'
        ELSE 'Below 7%'
    END AS budget_priority_level
FROM federal_budget
ORDER BY year ASC;



-- Query 4: World Bank vs Federal Government figures comparison
-- Nigeria consistently reports higher education spending than World Bank records
-- Biggest discrepancy was 4.63 percentage points in 2015

SELECT 
    year,
    education_pct_of_budget,
    education_pct_of_govt_expenditure_wb,
    ROUND(education_pct_of_budget - education_pct_of_govt_expenditure_wb, 2) 
        AS reporting_gap
FROM federal_budget
WHERE education_pct_of_govt_expenditure_wb IS NOT NULL
ORDER BY year ASC;



-- Query 5: Year on year allocation growth rate
-- 4 years had negative growth: 2016, 2017, 2019, 2020
-- 2025 had highest single year jump at 58.49% (Tinubu administration)
-- Pattern suggests election-cycle driven budgeting

SELECT 
    year,
    education_allocation_ngn_billion,
    LAG(education_allocation_ngn_billion) 
        OVER (ORDER BY year) AS previous_year_allocation,
    ROUND(
        ((education_allocation_ngn_billion - LAG(education_allocation_ngn_billion) 
        OVER (ORDER BY year)) / 
        LAG(education_allocation_ngn_billion) 
        OVER (ORDER BY year)) * 100, 2)
    AS yoy_growth_pct
FROM federal_budget
ORDER BY year ASC;



-- Query 6: Overall budget priority score
-- 7 out of 11 years classified as Critical Underfunding
-- Only 2015 reached Near Benchmark status
-- Funding status worsening despite nominal naira increases

SELECT 
    year,
    education_allocation_ngn_billion,
    education_pct_of_budget,
    education_pct_of_gdp_wb,
    unesco_benchmark,
    ROUND(unesco_benchmark - education_pct_of_budget, 2) AS benchmark_gap,
    CASE
        WHEN education_pct_of_budget >= 15 THEN 'Meets Benchmark'
        WHEN education_pct_of_budget >= 10 THEN 'Near Benchmark'
        WHEN education_pct_of_budget >= 7 THEN 'Below Benchmark'
        ELSE 'Critical Underfunding'
    END AS funding_status
FROM federal_budget
ORDER BY year ASC;