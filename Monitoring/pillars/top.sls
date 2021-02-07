base:
  '*':
    - chrony
    - elasticsearch
    - grafana
    - logstash
    - docker
  'role:monitoring':
    - match: grain
    - basic_config
    - packages_monitor01
    - users
  'role:container':
    - match: grain
    - basic_config
    - packages_container01
    - users
  'role:jenkins':
    - match: grain
    - basic_config
    - packages_jenkins01
    - users
  'role:hm-vm':
    - match: grain
    - basic_config_hvm
    - users_hvm
  'hm-m1':
    - filebeat_hvm1
  'hm-m2':
    - filebeat_hvm2
  'hm-m3':
    - filebeat_hvm3
  'hm-m4':
    - filebeat_hvm4
