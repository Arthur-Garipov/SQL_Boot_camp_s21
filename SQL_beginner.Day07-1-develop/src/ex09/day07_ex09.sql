SELECT 
    address,
    round((MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric))), 2) AS formula,
    round(AVG(age::numeric), 2) AS average,
    CASE 
        WHEN MAX(age::numeric) - (MIN(age::numeric) / MAX(age::numeric)) > AVG(age::numeric) THEN 'True'
        ELSE 'False'
    END AS comparison
FROM person
GROUP BY address
ORDER BY address;