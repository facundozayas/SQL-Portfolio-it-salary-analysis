-- Q9: What's the salary difference between remote, hybrid, and in-office roles across experience levels?

-- First, check the full dataset
SELECT * FROM salaries;

-- Grouped view by experience level and remote work type
SELECT
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	CASE 
		WHEN remote_ratio = 0 THEN 'in office'
		WHEN remote_ratio = 50 THEN 'hybrid'
		WHEN remote_ratio = 100 THEN 'remote'
	END AS work_mode,
	AVG(salary_in_usd) AS avg_salary,
	COUNT(*) AS record_count
FROM salaries
GROUP BY experience_level, remote_ratio
ORDER BY experience_level, avg_salary DESC;

-- The record count here helps validate whether salary differences are reliable or just due to small sample sizes.
