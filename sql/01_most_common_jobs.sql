-- Q1: What are the most common job titles?

-- Count how many times each job title appears per year
SELECT work_year , job_title , COUNT(job_title) AS total
FROM salaries
GROUP BY work_year , job_title
ORDER BY total DESC;

-- To analyze overall frequency (not broken down by year)
SELECT job_title , COUNT(job_title) AS total
FROM salaries
GROUP BY job_title
ORDER BY total DESC;

-- This raises a good question: is it more valuable to see total job counts or track how they evolve over time?
-- If we want to understand industry trends, the year-by-year view is more informative.
-- But if we just want the most common roles historically, the overall count is enough.

-- Ranking the top 5 most frequent roles by year
WITH job_counts AS (
	SELECT work_year , job_title , COUNT(job_title) AS total
	FROM salaries
	GROUP BY work_year , job_title
),
ranked_jobs AS (
	SELECT *, RANK() OVER (PARTITION BY work_year ORDER BY total DESC) AS job_rank
	FROM job_counts
)
SELECT *
FROM ranked_jobs
WHERE job_rank <= 5
ORDER BY work_year, job_rank;

-- This final version gives a clearer view of how demand shifts each year: top 5 roles per year.
