-- Q7: Which company size (S, M, L) pays more at each experience level?

-- Average salary by company size and experience
SELECT company_size,
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_size, experience_level
ORDER BY company_size, avg_salary DESC;

-- But how many jobs are there for each combination?
-- This tells us where the actual opportunities are
SELECT company_size,
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	COUNT(*) AS job_count
FROM salaries
GROUP BY company_size, experience_level
ORDER BY company_size, job_count DESC;

-- This helps identify that while large companies may offer higher salaries, mid-sized companies may offer more job openings.
