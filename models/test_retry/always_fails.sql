{{ config(
    enabled=false
) }}


select *, cats from {{ ref("dim_parts") }} limit 1