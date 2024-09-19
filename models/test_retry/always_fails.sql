{{ config(
    enabled=true
) }}


select cats from {{ ref("dim_parts") }} limit 1