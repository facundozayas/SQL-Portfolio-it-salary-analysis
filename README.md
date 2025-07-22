# 💼 IT Salary Analysis – SQL Portfolio Project

This project explores salary trends in IT and Data-related roles using SQL. The dataset comes from [Kaggle](https://www.kaggle.com/datasets) and contains job titles, salaries in USD, remote status, experience levels, company locations, and more.

My goal was to simulate a real-world business case by answering 10 strategic questions that could be presented to stakeholders or HR teams during decision-making processes.

---

## 🛠️ Tools Used

- **SQL** (MySQL syntax)
- **Jupyter Notebooks** (optional for export/testing)
- **Power BI** (planned for visualizations)
- **GitHub** (portfolio presentation)

---

## 🔎 Questions Answered

Each question is documented and analyzed in a separate `.sql` file under the `sql/` folder.

| # | Question |
|---|----------|
| 1 | What are the most common job titles? |
| 2 | What is the average salary by job title and by year? |
| 3 | What is the average salary by experience level? |
| 4 | Do remote roles earn more than in-office roles? |
| 5 | Which countries offer the highest salaries? |
| 6 | How have salaries evolved over the years? |
| 7 | What company size pays more at each experience level? |
| 8 | Which roles are most frequent (overall and by year)? |
| 9 | What's the salary difference between remote and in-office roles by experience level? |
| 10 | What are the best-paid combinations of role, experience and location? |

---

## 📈 Key Insights

- **Data Scientist** is the most frequent job title across all years.
- **Remote executive roles** tend to earn the highest salaries, but the number of such roles is limited.
- **AI Architect** initially appeared as the highest-paid role, but the sample size was too small (1–2 entries). After filtering for roles with at least 3 entries, **Engineering Manager (executive, US)** ranked first with an average above $280K/year.
- **Mid-sized companies** offer more job opportunities overall, even if large companies pay slightly more.
- **Hybrid roles** are surprisingly less paid than fully remote or fully in-office ones.

---

## 👨‍💻 About Me

Hi, I’m **Facundo Zayas**, an Industrial Engineer from Argentina making a career pivot into data analytics.  
I’m passionate about logical thinking, data, teamwork, and solving problems with real impact.  
I'm currently learning SQL, Power BI and Python, working on hands-on projects like this one.

🔗 [LinkedIn](https://www.linkedin.com/in/facundo-zayas)  
📩 [Mail](zayasfacundonicolasqgmail.com)  
📬 Feel free to reach out or suggest improvements!

---

## 📂 Folder Structure

```
sql/
├── 01_most_common_jobs.sql
├── 02_avg_salary_by_role.sql
├── ...
├── 10_top_roles_by_experience_and_country.sql

insights.md  # extra thoughts and narrative
README.md    # this file
```

---

## 🧠 Final Thoughts

This project helped me apply technical SQL skills while also practicing how to communicate insights clearly and question the reliability of the data. The process included exploratory queries, use of ranking functions, and filtering techniques to reduce noise and improve interpretability.

Next step: **visualize key insights in Power BI and share dashboards!**
