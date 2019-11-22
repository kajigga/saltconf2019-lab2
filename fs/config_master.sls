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

download_plugin:
  file.managed:
    - name: /tmp/SSEAPE-6.1.05-py2.7.egg
    - source: "https://sse1.s3-us-east-2.amazonaws.com/sse_installer/6.1.0/SSEAPE-6.1.0%2B5-py2.7.egg?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJSZ2PA5Y5ITFSN3Q/20191122/us-east-2/s3/aws4_request&X-Amz-Date=20191122T155437Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=d35f4a3b23e13e645dc65d790ca7ab6b53423eb0bbbd8506d10b01035017d5c9"

remove_old:
  cmd.run:
    - name: "rm -rf /usr/lib/python2.7/site-packages/SSEAPE-*"

download_plugin:
  cmd.run:
    - name: easy_install /tmp/SSEAPE-6.1.05-py2.7.egg

# configure plugin
# restart master
restart_minion:
  cmd.run:
    - name: salt-call service.restart salt-minion
    - bg: True

restart_minion:
  cmd.run:
    - name: salt-call service.restart salt-master
    - bg: True
