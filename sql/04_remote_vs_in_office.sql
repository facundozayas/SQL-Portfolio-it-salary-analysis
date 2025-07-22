-- Q4: Is there a salary difference between remote, hybrid, and in-office roles?

-- Salary by role and remote type
SELECT job_title,
	CASE 
		WHEN remote_ratio = 0 THEN 'in office'
		WHEN remote_ratio = 50 THEN 'hybrid'
		WHEN remote_ratio = 100 THEN 'remote'
	END AS work_mode,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title, work_mode
ORDER BY job_title;

-- To understand the overall differences
SELECT 
	CASE 
		WHEN remote_ratio = 0 THEN 'in office'
		WHEN remote_ratio = 50 THEN 'hybrid'
		WHEN remote_ratio = 100 THEN 'remote'
	END AS work_mode,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY work_mode;

-- While this shows averages, it lacks job-level comparison, which is more insightful.
-- Let's also analyze employment types (full-time, freelance, etc.)
SELECT 
	CASE 
		WHEN employment_type = 'CT' THEN 'contract'
		WHEN employment_type = 'FL' THEN 'freelance'
		WHEN employment_type = 'FT' THEN 'full-time'
		WHEN employment_type = 'PT' THEN 'part-time'
	END AS employment_type,
	CASE 
		WHEN remote_ratio = 0 THEN 'in office'
		WHEN remote_ratio = 50 THEN 'hybrid'
		WHEN remote_ratio = 100 THEN 'remote'
	END AS work_mode,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY employment_type, work_mode;
