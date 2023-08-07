{% macro date_format(date_column) %}
coalesce(PARSE_DATE('%Y-%m-%d', {{ date_column }}),
          PARSE_DATE('%d/%m/%y', {{ date_column }}),
          PARSE_DATE('%d/%m/%Y', {{ date_column }}))
{% endmacro %}
