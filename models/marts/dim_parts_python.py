def model(dbt, session):

    dim_parts = dbt.ref("dim_parts")
    dim_parts = dim_parts.to_pandas()

    return dim_parts