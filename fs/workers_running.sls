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

raas_installed:
  pkg.installed:
    - name: raas
    - sources:
      - raas: "https://sse1.s3-us-east-2.amazonaws.com/sse_installer/6.1.0/raas-6.1.0%2B5.el7.x86_64.rpm?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAJSZ2PA5Y5ITFSN3Q/20191121/us-east-2/s3/aws4_request&X-Amz-Date=20191121T042243Z&X-Amz-Expires=3600&X-Amz-SignedHeaders=host&X-Amz-Signature=a6a499980b820ca8748df4d8be461d263ac54fa6f3f5659c00f3565cfa924aa9"

raas_running:
  service.running:
    - name: raas
    - restart: true
    - enable: true
    - watch_any: 
      - raas_config
      - daemon_reload
