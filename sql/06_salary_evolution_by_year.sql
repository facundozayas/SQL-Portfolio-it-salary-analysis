-- Q6: How has the average salary evolved over the years?

-- Basic yearly salary trend
SELECT work_year, AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY work_year
ORDER BY work_year DESC;

-- We can also explore year-by-year salary trends by role
WITH yearly_roles AS (
	SELECT job_title, work_year, AVG(salary_in_usd) AS avg_salary
	FROM salaries
	GROUP BY job_title, work_year
),
ranked_roles AS (
	SELECT *, DENSE_RANK() OVER (PARTITION BY job_title ORDER BY avg_salary DESC) AS yearly_rank
	FROM yearly_roles
)
SELECT *
FROM ranked_roles
WHERE yearly_rank <= 5
ORDER BY job_title, yearly_rank;
