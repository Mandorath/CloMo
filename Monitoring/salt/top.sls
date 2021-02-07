base:
  '*':
    - monitoring_env.users
    - monitoring_env.users.sudo
    - monitoring_env.users.bashrc
    - monitoring_env.chrony
  'role:monitoring':
    - match: grain
    - monitoring_env.basic_config
    - monitoring_env.packages
    - monitoring_env.certs
    - monitoring_env.logstash
    - monitoring_env.logstash_certs
    - monitoring_env.logstash_plugins
    - monitoring_env.elasticsearch
    - monitoring_env.grafana
    - monitoring_env.grafana_data
  'role:container':
    - match: grain
    - monitoring_env.basic_config
    - monitoring_env.repo
    - monitoring_env.packages
    - monitoring_env.docker
    - monitoring_env.docker.software.package.repo
    - monitoring_env.docker.software
    - monitoring_env.docker.software.service
    - monitoring_env.canary
  'role:jenkins':
    - match: grain
    - monitoring_env.basic_config
    - monitoring_env.repo
    - monitoring_env.packages
    - monitoring_env.jenkins
    - monitoring_env.jenkins_ssl
    - monitoring_env.nginx.pkg
    - monitoring_env.nginx.config
    - monitoring_env.nginx.service
    - monitoring_env.nginx.servers
    - monitoring_env.jenkins.nginx
    - monitoring_env.jenkins.plugins
  'role:hm-vm':
    - match: grain
    - aws_vms.basic_config_hvm
    - aws_vms.filebeat.install
    - aws_vms.filebeat.config
    - aws_vms.filebeat.service
  'hm-m1.dasbo.nl':
    - aws_vms.filebeat_certs_hvm1
  'hm-m2.dasbo.nl':
    - aws_vms.filebeat_certs_hvm2
  'hm-m3.dasbo.nl':
    - aws_vms.filebeat_certs_hvm3
  'hm-m4.dasbo.nl':
    - aws_vms.filebeat_certs_hvm4
