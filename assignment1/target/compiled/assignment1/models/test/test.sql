

WITH dim_reg_pass AS(
SELECT 
    region,
    SUM(CASE WHEN final_result = 'Pass' THEN 1 ELSE 0 END) AS pass_count,
    SUM(CASE WHEN final_result = 'Withdrawn' THEN 1 ELSE 0 END) AS withdrawn_count,
    SUM(CASE WHEN final_result = 'Fail' THEN 1 ELSE 0 END) AS fail_count,
    SUM(CASE WHEN final_result = 'Distinction' THEN 1 ELSE 0 END) AS distinction_count
FROM 
    'data/studentInfo.csv'
GROUP BY 
    region
)

SELECT 
 *
from dim_reg_pass