{% import_yaml "saltconf/labs.yaml" as labs %}
{% for x in range(labs.labs.count) %}
{% set lab = "lab" ~ (x+1) %}

setup_lab_{{lab}}:
  cloud.profile:
    - name: {{lab}}
    - profile: redhat
    - tags: {'lab': '{{lab}}'}


setup_lab_{{lab}}_2:
  cloud.profile:
    - name: {{lab}}_rh2
    - profile: redhat
    - tags: {'lab': '{{lab}}'}
      
{% endfor %}
