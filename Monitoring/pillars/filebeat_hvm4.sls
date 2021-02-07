filebeat:
  version: 7
  lookup:
    runlevels_install: True

  # if no log_paths specified, generic syslogs are default
  log_paths:
    -
      paths:
        - '/var/log/auth.log'
        - '/var/log/syslog'

  logstash:
    enabled: True
    server:
      - ip
    ssl_certificate_authorities: /etc/filebeat/ca_wo.crt
    ssl_key: /etc/filebeat/hm-m4.key
    ssl_certificate: /etc/filebeat/hm-m4.pem
    ssl_verification_mode: certificate
