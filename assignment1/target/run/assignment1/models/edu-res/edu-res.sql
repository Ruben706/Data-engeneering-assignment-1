create or replace view "dev"."main"."edu-res__dbt_int" as (
        select * from 'output/edu-res.csv'
    );