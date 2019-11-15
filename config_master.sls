manage_minion_master.conf:
  file.managed:
    {% if grains['os_family'] == 'Windows' %}
    - name: c:\salt\conf\minion.d\master.conf
    {% else %}
    - name: /etc/salt/minion.d/master.conf
    {% endif %}
    - contents: |
        master:
          - 3.134.145.96
          - 3.135.31.140


restart_minion:
  cmd.run:
    - name: salt-call service.restart salt-minion
    - bg: True
