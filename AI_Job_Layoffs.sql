USE ai_job_layoffs_db;

-- Q1. What are all the records present in the dataset?
SELECT *
FROM ai_job_layoffs_cleaned;


-- Q2. How many layoff events are recorded in the dataset?
SELECT COUNT(*) AS total_layoff_events
FROM ai_job_layoffs_cleaned;


-- Q3. How many employees were laid off in total?
SELECT SUM(headcount_cut) AS total_employees_laid_off
FROM ai_job_layoffs_cleaned;


-- Q4. What is the average number of employees laid off per layoff event?
SELECT ROUND(AVG(headcount_cut), 2) AS average_layoffs
FROM ai_job_layoffs_cleaned;


-- Q5. What is the highest number of employees laid off in a single layoff event?
SELECT MAX(headcount_cut) AS maximum_layoffs
FROM ai_job_layoffs_cleaned;


-- Q6. What is the smallest number of employees laid off in a single layoff event?
SELECT MIN(headcount_cut) AS minimum_layoffs
FROM ai_job_layoffs_cleaned;


-- Q7. How many unique industries are represented in the dataset?
SELECT COUNT(DISTINCT industry) AS total_industries
FROM ai_job_layoffs_cleaned;


-- Q8. How many unique countries are represented in the dataset?
SELECT COUNT(DISTINCT country) AS total_countries
FROM ai_job_layoffs_cleaned;


-- Q9. How many unique companies are included in the dataset?
SELECT COUNT(DISTINCT company_name) AS total_companies
FROM ai_job_layoffs_cleaned;


-- Q10. How many companies cited AI as the reason for layoffs versus those that did not?
SELECT
    ai_cited_as_reason,
    COUNT(*) AS total_events
FROM ai_job_layoffs_cleaned
GROUP BY ai_cited_as_reason;


-- Q11. What is the total number of employees laid off each year?
SELECT
    year,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY year
ORDER BY year;


-- Q12. What is the total number of employees laid off in each quarter?
SELECT
    quarter,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY quarter
ORDER BY quarter;


-- Q13. What is the total number of employees laid off each month?
SELECT
    month,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY month
ORDER BY total_layoffs DESC;


-- Q14. Which industries experienced the highest number of layoffs?
SELECT
    industry,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY industry
ORDER BY total_layoffs DESC;


-- Q15. Which countries experienced the highest number of layoffs?
SELECT
    country,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY country
ORDER BY total_layoffs DESC;


-- Q16. Which are the top 10 companies with the highest layoffs?
SELECT
    company_name,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY company_name
ORDER BY total_layoffs DESC
LIMIT 10;


-- Q17. How many layoff events occurred across different company sizes?
SELECT
    company_size,
    COUNT(*) AS total_events
FROM ai_job_layoffs_cleaned
GROUP BY company_size
ORDER BY total_events DESC;


-- Q18. Which seniority level was affected the most by layoffs?
SELECT
    seniority_level,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY seniority_level
ORDER BY total_layoffs DESC;


-- Q19. Which job role categories experienced the highest layoffs?
SELECT
    role_category,
    SUM(headcount_cut) AS total_layoffs
FROM ai_job_layoffs_cleaned
GROUP BY role_category
ORDER BY total_layoffs DESC;


-- Q20. What were the most common stated reasons for layoffs?
SELECT
    stated_reason,
    COUNT(*) AS total_events
FROM ai_job_layoffs_cleaned
GROUP BY stated_reason
ORDER BY total_events DESC;


-- Q21. What is the average AI exposure score across all layoff events?
SELECT
    ROUND(AVG(ai_exposure_score), 2) AS average_ai_exposure_score
FROM ai_job_layoffs_cleaned;


-- Q22. What is the average year-over-year revenue growth of companies?
SELECT
    ROUND(AVG(revenue_growth_yoy_pct), 2) AS average_revenue_growth
FROM ai_job_layoffs_cleaned;


-- Q23. What is the average year-over-year AI capital expenditure (AI Capex) change?
SELECT
    ROUND(AVG(ai_capex_change_yoy_pct), 2) AS average_ai_capex_change
FROM ai_job_layoffs_cleaned;


-- Q24. What is the average 30-day stock price change after layoff announcements?
SELECT
    ROUND(AVG(stock_price_change_30d_pct), 2) AS average_stock_price_change
FROM ai_job_layoffs_cleaned;


-- Q25. What is the average percentage of workforce laid off?
SELECT
    ROUND(AVG(pct_workforce_cut), 2) AS average_workforce_cut_percentage
FROM ai_job_layoffs_cleaned;


-- Q26. How does the average revenue growth compare between companies that cited AI and those that did not?
SELECT
    ai_cited_as_reason,
    ROUND(AVG(revenue_growth_yoy_pct), 2) AS average_revenue_growth
FROM ai_job_layoffs_cleaned
GROUP BY ai_cited_as_reason;


-- Q27. How does the average AI Capex change compare between companies that cited AI and those that did not?
SELECT
    ai_cited_as_reason,
    ROUND(AVG(ai_capex_change_yoy_pct), 2) AS average_ai_capex_change
FROM ai_job_layoffs_cleaned
GROUP BY ai_cited_as_reason;


-- Q28. How does the average stock price change compare between companies that cited AI and those that did not?
SELECT
    ai_cited_as_reason,
    ROUND(AVG(stock_price_change_30d_pct), 2) AS average_stock_price_change
FROM ai_job_layoffs_cleaned
GROUP BY ai_cited_as_reason;


-- Q29. How does the average workforce cut percentage compare between companies that cited AI and those that did not?
SELECT
    ai_cited_as_reason,
    ROUND(AVG(pct_workforce_cut), 2) AS average_workforce_cut_percentage
FROM ai_job_layoffs_cleaned
GROUP BY ai_cited_as_reason;


-- Q30. Which companies reported the highest AI exposure scores?
SELECT
    company_name,
    ai_exposure_score
FROM ai_job_layoffs_cleaned
ORDER BY ai_exposure_score DESC
LIMIT 10;



-- Q31. Which industries have the highest number of AI-cited layoff events?
SELECT
    industry,
    COUNT(*) AS ai_layoff_events
FROM ai_job_layoffs_cleaned
WHERE ai_cited_as_reason = 'Yes'
GROUP BY industry
ORDER BY ai_layoff_events DESC;


-- Q32. Which countries have the highest number of AI-cited layoff events?
SELECT
    country,
    COUNT(*) AS ai_layoff_events
FROM ai_job_layoffs_cleaned
WHERE ai_cited_as_reason = 'Yes'
GROUP BY country
ORDER BY ai_layoff_events DESC;


-- Q33. Which companies have both high revenue growth (>20%) and cited AI as the reason for layoffs?
SELECT
    company_name,
    revenue_growth_yoy_pct,
    headcount_cut
FROM ai_job_layoffs_cleaned
WHERE revenue_growth_yoy_pct > 20
  AND ai_cited_as_reason = 'Yes'
ORDER BY revenue_growth_yoy_pct DESC;


-- Q34. Which companies have high AI Capex (>20%) and cited AI as the reason for layoffs?
SELECT
    company_name,
    ai_capex_change_yoy_pct,
    headcount_cut
FROM ai_job_layoffs_cleaned
WHERE ai_capex_change_yoy_pct > 20
  AND ai_cited_as_reason = 'Yes'
ORDER BY ai_capex_change_yoy_pct DESC;


-- Q35. Identify potential AI Washing companies based on high revenue growth, high AI Capex, and AI-cited layoffs.
SELECT
    company_name,
    revenue_growth_yoy_pct,
    ai_capex_change_yoy_pct,
    headcount_cut
FROM ai_job_layoffs_cleaned
WHERE revenue_growth_yoy_pct > 20
  AND ai_capex_change_yoy_pct > 20
  AND ai_cited_as_reason = 'Yes'
ORDER BY revenue_growth_yoy_pct DESC,
         ai_capex_change_yoy_pct DESC;


-- Q36. Rank companies based on total employees laid off using the RANK() window function.
SELECT
    company_name,
    SUM(headcount_cut) AS total_layoffs,
    RANK() OVER (ORDER BY SUM(headcount_cut) DESC) AS company_rank
FROM ai_job_layoffs_cleaned
GROUP BY company_name;


-- Q37. Categorize companies based on AI Exposure Score using CASE.
SELECT
    company_name,
    ai_exposure_score,
    CASE
        WHEN ai_exposure_score >= 80 THEN 'High AI Exposure'
        WHEN ai_exposure_score >= 50 THEN 'Medium AI Exposure'
        ELSE 'Low AI Exposure'
    END AS exposure_category
FROM ai_job_layoffs_cleaned;


-- Q38. Use a CTE to find the top 5 companies with the highest layoffs.
WITH company_layoffs AS (
    SELECT
        company_name,
        SUM(headcount_cut) AS total_layoffs
    FROM ai_job_layoffs_cleaned
    GROUP BY company_name
)
SELECT *
FROM company_layoffs
ORDER BY total_layoffs DESC
LIMIT 5;


-- Q39. Create a view for AI-related layoff events.
CREATE VIEW ai_layoff_view AS
SELECT *
FROM ai_job_layoffs_cleaned
WHERE ai_cited_as_reason = 'Yes';


-- Q40. Display all records from the AI Layoff View.
SELECT *
FROM ai_layoff_view;