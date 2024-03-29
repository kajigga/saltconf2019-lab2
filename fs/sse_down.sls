{% import_yaml "saltconf/labs.yaml" as labs %}
{# {% for x in range(1, labs.labs.count) %}  #}
{% for x in range(1, 20) %} 
{% set lab = "lab" ~ (x+1) %}

# create a target
# grant the role access to the target

target_absent_{{lab}}:
  sse_target.absent:
    - name: {{lab}}


target_absent_{{lab}}_ub:
  sse_target.absent:
    - name: {{lab}}_ub

target_absent_{{lab}}_rh:
  sse_target.absent:
    - name: {{lab}}_rh

target_absent_{{lab}}_win:
  sse_target.absent:
    - name: {{lab}}_win

target_absent_{{lab}}_linux:
  sse_target.absent:
    - name: {{lab}}_linux

# create a role
sse_remove_role_{{lab}}:
  sse_role.absent:
    - name: {{lab}}

# create a user
user_absent_{{lab}}:
  sse_user.absent:
    - name: {{lab}}


{% endfor %}
