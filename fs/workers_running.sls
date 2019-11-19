redis_service_disabled:
  service.dead:
    - name: redis

postgres_service_disabled:
  service.dead:
    - name: postgresql-9.6

systemd_service:
  file.managed:
    - name: /usr/lib/systemd/system/raas.service
    - source: salt://saltconf/files/raas.service

daemon_reload:
  cmd.run:
    - name: systemctl daemon-reload
    - onchange:
      - systemd_service

raas_config:
  file.managed:
    - name: /etc/raas/raas
    - user: raas
    - group: raas
    - source: salt://saltconf/files/raas_config

raas_running:
  service.running:
    - name: raas
    - restart: true
    - enable: true
    - watch_any: 
      - raas_config
      - daemon_reload
