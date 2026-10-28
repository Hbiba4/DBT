{% macro clean_string(column_name) %}
    {# Standardizes a string by trimming leading and trailing spaces and converting empty strings to NULL. #}
    NULLIF(LTRIM(RTRIM({{ column_name }})), '')
{% endmacro %}