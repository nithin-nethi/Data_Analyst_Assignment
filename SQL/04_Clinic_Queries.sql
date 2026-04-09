-- Q1: Find the revenue we got from each sales channel in a given year (2021)

SELECT 
    sales_channel,
    SUM(amount) AS total_revenue
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY sales_channel;



-- Q2: Find top 10 the most valuable customers for a given year (2021)

SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;



-- Q3: Find month wise revenue, expense, profit, status (profitable / not-profitable) for agiven year (2021)

SELECT 
    r.month,
    r.revenue,
    e.expense,
    (r.revenue - e.expense) AS profit,
    CASE 
        WHEN (r.revenue - e.expense) > 0 THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2021
    GROUP BY month
) r
JOIN (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2021
    GROUP BY month
) e
ON r.month = e.month;



-- Q4: For each city find the most profitable clinic for a given month (January 2021)

SELECT *
FROM (
    SELECT 
        c.city,
        cs.cid,
        (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit,
        RANK() OVER (
            PARTITION BY c.city
            ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) DESC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 1 AND YEAR(cs.datetime) = 2021
    GROUP BY c.city, cs.cid
) t
WHERE rnk = 1;



-- Q5: For each state find the second least profitable clinic for a given month (January 2021)

SELECT *
FROM (
    SELECT 
        c.state,
        cs.cid,
        (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) AS profit,
        RANK() OVER (
            PARTITION BY c.state
            ORDER BY (SUM(cs.amount) - IFNULL(SUM(e.amount),0)) ASC
        ) AS rnk
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e ON cs.cid = e.cid
    WHERE MONTH(cs.datetime) = 1 AND YEAR(cs.datetime) = 2021
    GROUP BY c.state, cs.cid
) t
WHERE rnk = 2;