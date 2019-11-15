{% import_yaml "saltconf/labs.yaml" as labs %}
{% for x in range(labs.labs.count) %}
{% set lab = "lab" ~ (x+1) %}

setup_lab_{{lab}}_win:
  cloud.profile:
    - name: {{lab}}_win1
    - profile: windows2016
    - tags: {'lab': '{{lab}}'}
{% endfor %}
