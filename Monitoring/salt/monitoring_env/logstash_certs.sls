logstash_key:
  file.managed:
    - name: /etc/logstash/monitor01.key
    - source: salt://{{ slspath }}/templates/monitor01.key
    - user: logstash
    - group: logstash
    - mode: 600
    - template: jinja

logstash_pem:
  file.managed:
    - name: /etc/logstash/monitor01.pem
    - source: salt://{{ slspath }}/templates/monitor01.pem
    - user: root
    - group: logstash
    - mode: 644
    - template: jinja
