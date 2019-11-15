{% import_yaml "saltconf/labs.yaml" as labs %}
{% for x in range(labs.labs.count) %}
{% set lab = "lab" ~ (x+1) %}

setup_lab_{{lab}}_ubuntu:
  cloud.profile:
    - name: {{lab}}_ub
    - profile: ubuntu
    - tags: {'lab': '{{lab}}'}
      
{% endfor %}

