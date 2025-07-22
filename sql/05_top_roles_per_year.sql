-- Q5: Which countries offer the highest average salaries?

-- Basic average by country
SELECT company_location , AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_location
ORDER BY avg_salary DESC;

-- If we want a top 10, we can rank countries by salary
WITH country_salaries AS (
	SELECT company_location , AVG(salary_in_usd) AS avg_salary
	FROM salaries
	GROUP BY company_location
),
ranked_countries AS (
	SELECT *, RANK() OVER (ORDER BY avg_salary DESC) AS country_rank
	FROM country_salaries
)
SELECT *
FROM ranked_countries
WHERE country_rank <= 10
ORDER BY country_rank;

-- But salary also depends on experience level. Let's break it down by level.
SELECT 
	CASE 
		WHEN experience_level = 'EN' THEN 'entry-level'
		WHEN experience_level = 'MI' THEN 'mid-level'
		WHEN experience_level = 'SE' THEN 'senior'
		WHEN experience_level = 'EX' THEN 'executive'
	END AS expertise,
	company_location, 
	AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY expertise, company_location
ORDER BY company_location;

-- To get the top-paying countries per experience level:
WITH country_experience AS (
	SELECT 
		CASE 
			WHEN experience_level = 'EN' THEN 'entry-level'
			WHEN experience_level = 'MI' THEN 'mid-level'
			WHEN experience_level = 'SE' THEN 'senior'
			WHEN experience_level = 'EX' THEN 'executive'
		END AS expertise,
		company_location, 
		AVG(salary_in_usd) AS avg_salary
	FROM salaries
	GROUP BY expertise, company_location
),
ranked_by_experience AS (
	SELECT *, DENSE_RANK() OVER (PARTITION BY expertise ORDER BY avg_salary DESC) AS rank_in_level
	FROM country_experience
)
SELECT *
FROM ranked_by_experience
WHERE rank_in_level <= 5
ORDER BY expertise, rank_in_level;
