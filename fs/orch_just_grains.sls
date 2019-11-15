{% import_yaml "saltconf/labs.yaml" as labs %}

set_grains_all_labs:
  salt.state:
    - tgt: lab*
    - sls:
      - saltconf.set_grains
    - queue: true
    - pillar:
    {% for x in range(labs.labs.count) %}
    {% set lab = "lab" ~ (x+1) %}
        {{lab}}: {{lab}}
        {{lab}}_rh2: {{lab}}
        {{lab}}_win1: {{lab}}
        {{lab}}_ub: {{lab}}
    {% endfor %}

