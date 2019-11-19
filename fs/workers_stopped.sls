redis_service_disabled:
  service.dead:
    - name: redis

postgres_service_disabled:
  service.dead:
    - name: postgresql-9.6

raas_running:
  service.dead:
    - name: raas
