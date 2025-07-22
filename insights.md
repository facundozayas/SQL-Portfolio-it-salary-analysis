# 📊 SQL Insights & Commentary

This file includes translated and rephrased reflections for each of the 10 questions addressed in the project.  
Each block is meant to accompany the corresponding `.sql` file.

## Q1: What are the most common job titles?

- Looked at both total job counts and year-by-year breakdown.
- Created a ranking to show the top 5 most frequent job titles per year.
- Insight: "Data Scientist" leads consistently, but the trend slightly changes depending on the year.

## Q2: What’s the average salary in USD by role?

- First averaged salaries by job title.
- Then looked at yearly trends to show change over time.
- Built a yearly ranking to highlight the top-paying roles each year.

## Q3: What’s the average salary by experience level?

- Grouped salaries by experience level.
- Compared results both across the whole dataset and within each job title.
- Added counts per group to confirm statistical reliability.

## Q4: Are remote roles better paid than in-office?

- Compared salaries by remote ratio (0%, 50%, 100%).
- Noticed hybrid roles surprisingly have lower averages than fully remote.
- Added breakdown by employment type (freelance, full-time, etc.).

## Q5: Which countries pay the most?

- Built a basic ranking by average salary per country.
- Then segmented by experience level.
- Final output: top 5 countries per experience category.

## Q6: How have salaries changed over the years?

- Looked at average salary per year.
- Analyzed year-over-year changes by role using ranking logic.

## Q7: Which company size pays more for each experience level?

- Combined company size and experience to compare averages.
- Discovered large companies offer higher salaries but mid-size offer more jobs.

## Q8: Most frequent job titles overall and per year

- Counted frequency of each job title.
- Used ranking to highlight top 5 globally and per year.

## Q9: Salary gaps by experience and remote level

- Observed salary differences across remote types by experience level.
- Included job count per group to evaluate reliability of the average.

## Q10: Top paid roles by experience and country

- Initial result showed “AI Architect” as the best-paid role (mid-level, CA).
- After filtering for roles with at least 3 records, "Engineering Manager" (executive, US) came out as the most reliably high-paying role.