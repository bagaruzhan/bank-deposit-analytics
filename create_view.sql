CREATE OR REPLACE VIEW bank_summary_powerbi AS
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    job,
    marital,
    education,
    month,
    housing,
    loan,
    poutcome,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS total_deposits,
    ROUND(100 * SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate_pct,
    ROUND(AVG(balance),2) AS avg_balance,
    ROUND(AVG(duration),2) AS avg_duration,
    ROUND(AVG(previous),2) AS avg_previous_contacts
FROM bank_data
GROUP BY 
    age_group, job, marital, education, month, housing, loan, poutcome
ORDER BY 
    age_group, job, marital, education, month, housing, loan, poutcome;


