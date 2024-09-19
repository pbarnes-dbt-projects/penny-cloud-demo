{{ config(
    enabled=true
) }}


select 1 from {{ ref("dim_parts") }} limit 1