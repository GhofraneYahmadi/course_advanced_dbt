{% macro rolling_agg_n_periods(column_name,num_preceding_rows, partition_by, order_by) %}
    avg( {{ column_name }} ) OVER (
                PARTITION BY {{ partition_by }}
                ORDER BY {{ order_by }}
                ROWS BETWEEN {{ num_preceding_rows - 1 }}  PRECEDING AND CURRENT ROW
            ) AS avg_{{ num_preceding_rows - 1 }}_periods_{{ column_name }}
{% endmacro %}
