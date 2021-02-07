# -*- coding: utf-8 -*-
# vim: ft=yaml
grafana:
  pkg:
    name: grafana
    use_upstream_archive: false
    archive:
      uri: https://dl.grafana.com/oss/release
    repo:
      humanname: grafana_official
      name: grafana
      baseurl: https://packages.grafana.com/oss/rpm
      key_url: https://packages.grafana.com/gpg.key

  config_file: /etc/grafana/grafana.ini
  service:
    name: grafana-server

  # Pillar-based config
  # See also https://grafana.com/docs/installation/configuration/
  config:
    default:
      instance_name: ${HOSTNAME}
    security:
      admin_user: admin
    server:
      protocol: https
      http_port: 3000
      cert_file: /etc/grafana/monitor01.pem
      cert_key: /etc/grafana/monitor01.key

grafana_datasources:
  elasticsearch:
    name: Elasticsearch
    type: elasticsearch
    url: http://localhost:9200
    access: proxy
    database: "'*'"
    jsonData:
      timeInterval: 10s
      interval: Daily
      timeField: "'@timestamp'"
      esVersion: 70
  elasticsearch_filebeat:
    name: Elasticsearch-filebeat
    type: elasticsearch
    url: http://localhost:9200
    access: proxy
    database: "'hvm-nodes'"
    jsonData:
      timeInterval: 10s
      interval: Daily
      timeField: "'@timestamp'"
      esVersion: 70

grafana_plugins:
  grafana-piechart-panel: True
  grafana-clock-panel: True
  satellogic-3d-globe-panel: True
  grafana-worldmap-panel: True
