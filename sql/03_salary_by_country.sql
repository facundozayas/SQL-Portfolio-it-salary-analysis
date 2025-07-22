-- Q3: What’s the average salary by experience level?

-- This version shows the average salary for each experience level within each job title
SELECT job_title,
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title, expertise;

-- But the question asks for averages across experience levels, not job titles
SELECT 
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY expertise;

-- To ensure the averages are representative, we check how many entries exist per level
SELECT 
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	COUNT(*) AS count,
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY expertise;
