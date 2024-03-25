{{ config(materialized='external', location='output/edu-res.csv') }}


WITH dim_edu_pass AS(
SELECT highest_education,
       SUM(CASE WHEN final_result = 'Pass' THEN 1 ELSE 0 END) AS pass_count,
       SUM(CASE WHEN final_result = 'Withdrawn' THEN 1 ELSE 0 END) AS withdrawn_count,
       SUM(CASE WHEN final_result = 'Fail' THEN 1 ELSE 0 END) AS fail_count,
       SUM(CASE WHEN final_result = 'Distinction' THEN 1 ELSE 0 END) AS distinction_count
FROM 
    {{ source('raw_data', 'studentInfo') }}
GROUP BY highest_education
)
SELECT 
 *
from dim_edu_pass