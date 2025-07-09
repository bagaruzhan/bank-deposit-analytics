-- Total number of clients
SELECT COUNT(*) AS total_customers 
FROM bank_data;

-- Conversion funnel
SELECT deposit, COUNT(*) AS count
FROM bank_data
GROUP BY deposit;

-- Average balance by deposit
SELECT deposit, AVG(balance) AS avg_balance
FROM bank_data
GROUP BY deposit;

-- Average call duration by deposit
SELECT deposit, AVG(duration) AS avg_duration
FROM bank_data
GROUP BY deposit;

-- Housing loan share by marital status
SELECT 
    marital,
    ROUND(100 * SUM(CASE WHEN housing='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS housing_loan_pct
FROM bank_data
GROUP BY marital
ORDER BY housing_loan_pct DESC;

-- Top 5 jobs with highest avg balance for depositors
SELECT 
    job,
    AVG(balance) AS avg_balance,
    COUNT(*) AS customers
FROM bank_data
WHERE deposit='yes'
GROUP BY job
ORDER BY avg_balance DESC
LIMIT 5;

-- Age segmentation with deposits
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS deposits
FROM bank_data
GROUP BY age_group
ORDER BY age_group;

-- Conversion by month
SELECT 
    month,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(100 * SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY month
ORDER BY FIELD(month, 'jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');

-- Campaign effectiveness
SELECT 
    campaign,
    COUNT(*) AS total_contacts,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(100 * SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY campaign
ORDER BY campaign;

-- Average previous contacts by deposit
SELECT deposit, AVG(previous) AS avg_previous_contacts
FROM bank_data
GROUP BY deposit;

-- Defaulted clients
SELECT `default`, COUNT(*) AS clients
FROM bank_data
GROUP BY `default`;

-- Jobs with highest conversion rates
SELECT 
    job,
    COUNT(*) AS total,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(100 * SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS conversion_rate
FROM bank_data
GROUP BY job
ORDER BY conversion_rate DESC
LIMIT 5;

-- Balance bands vs duration
SELECT 
    CASE 
        WHEN balance < 0 THEN '<0'
        WHEN balance BETWEEN 0 AND 500 THEN '0-500'
        WHEN balance BETWEEN 501 AND 1000 THEN '501-1000'
        ELSE '>1000'
    END AS balance_band,
    AVG(duration) AS avg_duration,
    COUNT(*) AS customers
FROM bank_data
GROUP BY balance_band
ORDER BY balance_band;

-- Poutcome analysis
SELECT 
    poutcome,
    COUNT(*) AS total,
    SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) AS deposits,
    ROUND(100 * SUM(CASE WHEN deposit='yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS conversion_rate
FROM bank_data
GROUP BY poutcome
ORDER BY conversion_rate DESC;

-- Contacts type vs average campaign calls
SELECT 
    contact,
    AVG(campaign) AS avg_contacts
FROM bank_data
GROUP BY contact
ORDER BY avg_contacts DESC;

