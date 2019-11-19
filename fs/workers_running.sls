redis_service_disabled:
  service.dead:
    - name: redis

postgres_service_disabled:
  service.dead:
    - name: postgresql-9.6


raas_config:
  file.managed:
    - name: /etc/raas/raas
    - user: raas
    - group: raas
    - source: salt://saltconf/files/raas_config

raas_running:
  service.running:
    - name: raas
