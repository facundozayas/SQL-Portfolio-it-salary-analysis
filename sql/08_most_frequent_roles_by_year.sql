-- Q8: Which job titles appear most frequently in the dataset?

-- Top 5 most frequent job titles overall
WITH job_counts AS (
	SELECT job_title, COUNT(*) AS count
	FROM salaries
	GROUP BY job_title
),
ranked_jobs AS (
	SELECT *, DENSE_RANK() OVER (ORDER BY count DESC) AS job_rank
	FROM job_counts
)
SELECT *
FROM ranked_jobs
WHERE job_rank <= 5;

-- Top 5 job titles per year
WITH yearly_job_counts AS (
	SELECT work_year, job_title, COUNT(*) AS count
	FROM salaries
	GROUP BY work_year, job_title
),
ranked_jobs AS (
	SELECT *, DENSE_RANK() OVER (PARTITION BY work_year ORDER BY count DESC) AS job_rank
	FROM yearly_job_counts
)
SELECT *
FROM ranked_jobs
WHERE job_rank <= 5;
