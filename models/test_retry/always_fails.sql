{{ config(
    enabled=true
) }}


select * from {{ ref("dim_parts") }} limit 1