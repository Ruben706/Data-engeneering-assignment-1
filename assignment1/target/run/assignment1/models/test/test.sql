create or replace view "dev"."main"."test__dbt_int" as (
        select * from 'output/test.csv'
    );