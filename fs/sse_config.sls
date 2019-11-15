{% import_yaml "saltconf/labs.yaml" as labs %}
{% for x in range(labs.labs.count) %}
{% set lab = "lab" ~ (x+1) %}

# create a target
# grant the role access to the target

target_exists_{{lab}}:
  sse_target.present:
    - name: {{lab}}
    - tgt_master: '*'
    - tgt_type: grain
    - tgt: 'lab:{{lab}}'

# create a role
sse_create_role_{{lab}}:
  sse_role.present:
    - name: {{lab}}
    - perms:
      -  minion-read
      -  schedule-read
      -  schedule-write
      -  sec-assessment-run
      -  sec-ingestcustom-run
      -  sec-ingestsaltstack-run
      -  sec-policy-delete
      -  sec-policy-read
      -  sec-policy-write
      -  sec-remediation-run
      -  target-read
      -  vman-assessment-run
      -  vman-ingestsaltstack-run
      -  vman-policy-delete
      -  vman-policy-read
      -  vman-policy-write
      -  vman-remediation-run

# create a user
user_exists_{{lab}}:
  sse_user.present:
    - name: {{lab}}
    - password: secops
    - roles:
      - {{lab}}
    - perms:
      - minion-read

ensure_target_role_access_{{lab}}:
  sse_target.role_access:
    - name: {{lab}}
    - roles:
        {{lab}}:
          read: True
          write: True

{% endfor %}
