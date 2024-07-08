{{ config(
    enabled=false
) }}


select * from {{ ref("dim_parts") }} limit 1