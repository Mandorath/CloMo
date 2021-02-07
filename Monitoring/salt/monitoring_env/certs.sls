grafana_key:
  file.managed:
    - name: /etc/grafana/monitor01.key
    - source: salt://{{ slspath }}/templates/monitor/monitor01.key
    - user: root
    - group: grafana
    - mode: 640
    - template: jinja

grafana_pem:
  file.managed:
    - name: /etc/grafana/monitor01.pem
    - source: salt://{{ slspath }}/templates/monitor/monitor01.pem
    - user: root
    - group: root
    - mode: 644
    - template: jinja
