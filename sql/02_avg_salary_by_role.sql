-- Q2: What’s the average salary in USD per job title?

-- First, a general average per role across all years
SELECT job_title , AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title
ORDER BY avg_salary DESC;

-- Then, we break it down by year to observe trends over time
SELECT work_year , job_title , AVG(salary_in_usd) AS avg_salary 
FROM salaries
GROUP BY work_year , job_title
ORDER BY work_year , avg_salary DESC;

-- To highlight which roles led each year, we rank them by average salary
WITH yearly_salaries AS (
	SELECT work_year , job_title , AVG(salary_in_usd) AS avg_salary 
	FROM salaries
	GROUP BY work_year , job_title
),
ranked_roles AS (
	SELECT *, RANK() OVER (PARTITION BY work_year ORDER BY avg_salary DESC) AS role_rank
	FROM yearly_salaries
)
SELECT *
FROM ranked_roles
WHERE role_rank <= 5
ORDER BY work_year, role_rank;
