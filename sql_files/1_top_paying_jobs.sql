SELECT  
    job.job_id,
    company_dim.name AS name,
    job.job_title,
    job.job_location,
    job.job_schedule_type,
    job.salary_year_avg,
    job.job_posted_date
FROM job_postings_fact AS job
LEFT JOIN company_dim ON job.company_id = company_dim.company_id
WHERE
    job_title = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;