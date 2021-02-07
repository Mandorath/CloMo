logstash:
  java: java-11-openjdk-headless
  use_upstream_repo: True
  repo:
      version: 7
      old_repo: False
  inputs:
    -
      plugin_name: s3
      interval: 30
      bucket: <s3_Bucket>
      backup_to_dir: /srv/logstash/
      prefix: AWSLogs/o-l8dn0i19x6/
      type: cloudtrail
      codec: cloudtrail
      region: eu-west-1
      access_key_id: <access_key_id>
      secret_access_key: <access_key_secret>
    -
      plugin_name: beats
      type: nodes
      port: 5044
      ssl: true
      ssl_key: /etc/logstash/monitor01.key
      ssl_certificate: /etc/logstash/monitor01.pem
  filters:
    -
      plugin_name: geoip
      cond: 'if [type] == "cloudtrail"'
      source: "sourceIPAddress"
      target: "geoip"
      add_tag:
        - "cloudtrail-geoip"
    -
      plugin_name: mutate
      cond: 'if [type] == "cloudtrail"'
      add_field:
        run: "0"
    -
      plugin_name: mutate
      cond: 'if [type] == "nodes"'
      add_field:
        run: "0"

  outputs:
    -
      plugin_name: elasticsearch
      cond: 'if [type] == "cloudtrail"'
      hosts:
        - localhost:9200
    -
      plugin_name: elasticsearch
      cond: 'if [type] == "nodes"'
      index: 'hvm-nodes'
      hosts:
        - localhost:9200
# Cloudtrail {} should not be in quotes
