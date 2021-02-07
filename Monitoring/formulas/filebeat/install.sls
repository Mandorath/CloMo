{%- from 'filebeat/map.jinja' import conf with context %}
{% if salt['grains.get']('os_family') == 'Debian' %}
filebeat_repo:
  pkgrepo.managed:
    - name: deb https://artifacts.elastic.co/packages/oss-{{ conf.version }}.x/apt stable main
    - file: /etc/apt/sources.list.d/filebeat.list
    - gpgcheck: 1
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: filebeat.install
    - watch_in:
      - pkg: filebeat.install

{% elif salt['grains.get']('os_family') == 'RedHat' %}
filebeat_repo:
  pkgrepo.managed:
    - name: elk_beats
    - humanname: Elasticsearch repository for 2.x packages
    - baseurl: https://artifacts.elastic.co/packages/oss-{{ conf.version }}.x/yum
    - gpgcheck: 1
    - gpgkey: https://artifacts.elastic.co/GPG-KEY-elasticsearch
    - require_in:
      - pkg: filebeat.install
    - watch_in:
      - pkg: filebeat.install
{% endif %}

filebeat.install:
  pkg.installed:
    - name: filebeat
