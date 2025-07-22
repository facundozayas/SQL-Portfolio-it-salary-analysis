-- Q10: What are the highest-paying job titles based on experience level and company location?

-- First, a general overview of average salaries per role, experience, and country
SELECT job_title,
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	company_location,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title, experience_level, company_location
ORDER BY avg_salary DESC;

-- This helps identify top-paying combinations, but we should check the number of entries too

-- Now, let's count how many records exist for each job-location-experience combo
SELECT job_title,
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	company_location,
	AVG(salary_in_usd) AS avg_salary,
	COUNT(*) AS record_count
FROM salaries
GROUP BY job_title, experience_level, company_location
ORDER BY avg_salary DESC
LIMIT 10;

-- Insight: AI Architect (mid-level) appears at the top, but only has a few records, which makes the result less reliable.

-- Let's build a more trustworthy ranking by filtering for roles with at least 3 records
WITH job_salary_stats AS (
	SELECT 
		job_title,
		experience_level,
		company_location,
		AVG(salary_in_usd) AS avg_salary,
		COUNT(*) AS record_count
	FROM salaries
	GROUP BY job_title, experience_level, company_location
),
ranked_roles AS (
	SELECT *, RANK() OVER (ORDER BY avg_salary DESC) AS role_rank
	FROM job_salary_stats
)
SELECT *
FROM ranked_roles
WHERE role_rank <= 10 AND record_count >= 3
ORDER BY role_rank;

-- This final version gives a more statistically valid Top 10.
-- Engineering Manager (executive) in the United States tops the list with a strong salary average and a reliable number of entries.
