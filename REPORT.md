# Singapore Job Analytics - Written Report

## 1. Business Case

- **Scenario:** A career coach or self-service career guidance team wants to help Singapore jobseekers, students, fresh graduates, and career switchers make more evidence-based learning and career decisions.
- **Objective:** Help users decide which skills and career tracks to explore by comparing job demand, salary signals, entry-level accessibility, and possible role pathways.
- **Target users and value:** Jobseekers can use the dashboard to identify active sectors, compare career tracks, understand salary expectations, and prioritise skills that appear in real job postings.

The guiding question for the data product is:

> Which skills should I learn to improve employability?

The dashboard is designed to move users from a broad question, "What jobs exist?", toward a more useful decision, "Which career direction or skill should I explore next?"

## 2. Data Handling and Process

- **Tools used:** Python, Pandas, DuckDB, Jupyter Notebook, Streamlit, Matplotlib, and Altair.
- **Raw data:** The project uses a Singapore job-posting CSV with more than 1 million rows. After salary and date cleaning, the main analytical dataset contains **1,036,725 job postings**.
- **Loading approach:** The main notebook loads only the columns needed for analysis to keep memory usage manageable. A second notebook demonstrates an alternative DuckDB and SQL workflow for loading and querying the same large CSV.
- **Key fields used:** Job title, category, salary minimum, salary maximum, salary type, average salary, posting date, position level, minimum years of experience, company, applications, views, and vacancies.
- **Cleaning steps:** The analysis keeps monthly salary postings, removes rows with invalid or missing posting dates, filters implausible salary values, checks duplicate records and duplicate job IDs, and standardises category fields.
- **Salary handling:** Salary comparisons use average monthly salary and apply plausible bounds: average salary from SGD 500 to SGD 50,000, minimum salary from SGD 0 to SGD 50,000, and maximum salary from SGD 0 to SGD 70,000.
- **Feature engineering:** The project creates role families, seniority bands, salary bands, title-based skill tags, competition per vacancy, entry-level share, and a simple employability score.
- **EDA highlights:** The data shows strong differences between broad job categories, role families, seniority levels, and skill signals. Some high-paying skills are senior-heavy, while some lower-paying skills have better entry-level accessibility. This shaped the dashboard around demand, salary, and accessibility instead of a single ranking.

**Important limitation:** The CSV does not include full job descriptions. Skill extraction is based mainly on job titles, so skill counts should be interpreted as visible skill signals rather than a complete list of requirements.

## 3. Dashboard / App

The final solution is a **Streamlit dashboard** supported by notebook analysis. The app is built for interactive exploration, while the notebooks document the cleaning logic and analytical decisions.

### Main Views

- **Overview metrics:** The app shows total job postings, median salary, median experience, and total applications for the selected filters.
- **Market overview:** Users can compare top career tracks, top industry or job categories, jobs by seniority, median salary by career track, and median salary by seniority.
- **Skillset view:** Users can compare visible skillsets by job count and median salary.
- **Job explorer:** Users can inspect individual roles after filtering, sorted by salary and limited to a manageable table view.
- **Notebook trend view:** The notebook includes monthly median salary trends for selected skills, supporting the assignment requirement for a time-trend perspective.
- **Accessibility and pathway views:** The notebook compares entry-level share by skill and summarises role-family pathways across entry, mid, senior, and manager or lead levels.

### Interactivity

The Streamlit dashboard includes filters for:

- Industry or job category
- Career track
- Seniority
- Employment type
- Salary range
- Experience range
- Job title or company search

These filters let users narrow the market to their own situation, such as entry-level technology roles, higher-salary finance roles, or lower-experience career-switching opportunities.

### Design Choices

- Bar charts are used for ranking categories, career tracks, skills, and salary comparisons because they are easy to scan in a presentation.
- The layout separates broad market demand, skill signals, and individual job exploration so users can move from summary to detail.
- The colour palette is restrained and professional, supporting readability rather than decoration.
- The app keeps wording simple so a non-technical user can understand the insight without reading code.

### Screenshots / Visual Evidence

![Top role families](presentation/assets/top_role_families.png)

![Top categories](presentation/assets/top_categories.png)

![Skill signals](presentation/assets/skill_signals.png)

![Salary by role](presentation/assets/salary_by_role.png)

## 4. Presentation Summary

The 10-minute presentation follows this flow:

1. **Business case and objective:** Explain the target audience, the career-guidance problem, and the dashboard's success criteria.
2. **Process and data handling:** Explain how the large CSV was loaded, cleaned, transformed, and converted into career-relevant features.
3. **Dashboard walkthrough:** Demonstrate overview metrics, category and role-family demand, salary comparisons, skillset signals, filters, and job exploration.
4. **Challenges and learnings:** Discuss data limitations, salary outliers, title-based skill extraction, and the need to balance demand, salary, and accessibility.

## Key Insights

- **Project Management** has strong visible demand, with 16,498 title-based postings and median monthly salary around SGD 7,000, but it is more mid/senior positioned.
- **Accounting** has 15,821 visible postings and median monthly salary around SGD 4,000, with stronger entry-level accessibility.
- **Digital Marketing** has 14,428 visible postings and median monthly salary around SGD 3,750, also with good entry-level accessibility.
- **Cloud** has 10,331 visible postings and median monthly salary around SGD 5,000, with good entry-level accessibility.
- **Machine Learning / AI** has fewer visible postings at 2,235, but a higher median monthly salary around SGD 8,750.
- **Java, Cybersecurity, DevOps, SAP, and .NET / C#** show useful technical signals, but their accessibility differs by seniority and role family.

## Challenges and Learnings

- Large CSV files require careful column selection, chunking, or database-style querying to avoid unnecessary memory pressure.
- Salary analysis needs filtering because raw salary fields can include missing values, mixed salary periods, or implausible outliers.
- Job titles alone do not capture every required skill, so skill extraction should be presented as a conservative signal.
- High demand is not the same as a good career-switching opportunity; entry-level accessibility matters.
- A useful career dashboard should combine demand, salary, competition, and accessibility instead of ranking jobs by one metric only.

## Deliverables

- **Written report:** `REPORT.md`
- **Dashboard app:** `app.py`
- **Main notebook:** `Singapore_Jobs_Career_Switcher_Analytics.ipynb`
- **Alternative SQL notebook:** `Singapore_Jobs_DuckDB_SQL_Analytics.ipynb`
- **Presentation deck:** `presentation/Singapore_Job_Analytics_10min_Presentation.pptx`
- **Speaker script:** `presentation/Singapore_Job_Analytics_speaker_script.md`
- **Setup instructions:** `README.md` and `DATA.md`
- **Dependencies:** `requirements.txt`

## Run Instructions

Install dependencies:

```bash
pip install -r requirements.txt
```

Run the Streamlit dashboard:

```bash
streamlit run app.py
```

Open the main notebook for the full data process and analysis:

```text
Singapore_Jobs_Career_Switcher_Analytics.ipynb
```
