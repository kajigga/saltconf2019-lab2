{% import_yaml "saltconf/labs.yaml" as labs %}

manage_map:
  file.managed:
    - name: /etc/salt/cloud.maps.d/saltconf.conf
    - contents: |
        redhat:
          - phil
          - larry
          - moe
          {% for x in range(labs.labs.count) %}
          {%- set lab = "lab" ~ (x+1) -%}
          - {{ lab }}
          - {{ lab }}_rh2
          {% endfor %}
        ubuntu:
          {% for x in range(labs.labs.count) %}
          {%- set lab = "lab" ~ (x+1) -%}
          - {{ lab }}_ub
          {% endfor %}
        windows:
          {% for x in range(labs.labs.count) %}
          {%- set lab = "lab" ~ (x+1) -%}
          - {{ lab }}_win
          {% endfor %}
         
