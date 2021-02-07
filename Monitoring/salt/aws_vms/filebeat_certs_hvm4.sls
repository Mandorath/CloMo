filebeat_key:
  file.managed:
    - name: /etc/filebeat/hm-m4.key
    - source: salt://{{ slspath }}/templates/filebeat_certs/hm-m4.dasbo.nl.key
    - user: root
    - group: root
    - mode: 600
    - template: jinja

filebeat_pem:
  file.managed:
    - name: /etc/filebeat/hm-m4.pem
    - source: salt://{{ slspath }}/templates/filebeat_certs/hm-m4.dasbo.nl.pem
    - user: root
    - group: root
    - mode: 640
    - template: jinja

ca_pem:
  file.managed:
    - name: /etc/filebeat/ca_wo.crt
    - source: salt://{{ slspath }}/templates/ca_wo.crt
    - user: root
    - group: root
    - mode: 640
    - template: jinja

ca_trust_pem:
  file.managed:
    - name: /usr/local/share/ca-certificates/ca_wo.crt
    - source: salt://{{ slspath }}/templates/ca_wo.crt
    - user: root
    - group: root
    - mode: 640
    - template: jinja

update_ca:
  cmd.run:
    - name: update-ca-certificates
