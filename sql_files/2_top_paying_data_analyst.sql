WITH top_paying_jobs AS( 
    SELECT  
    job.job_id,
    company_dim.name AS name,
    job.job_title,
    job.salary_year_avg
FROM job_postings_fact AS job
LEFT JOIN company_dim ON job.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10
)

SELECT
    job.job_id,
    job_title,
    salary_year_avg,
    skills
FROM top_paying_jobs AS job
INNER JOIN skills_job_dim AS to_job ON job.job_id = to_job.job_id
INNER JOIN skills_dim AS skill ON to_job.skill_id = skill.skill_id
ORDER BY salary_year_avg DESC