

install_logstash_plugin:
  cmd.run:
    - name: /usr/share/logstash/bin/logstash-plugin install logstash-codec-cloudtrail

logstash_dir:
  file.directory:
    - name: /srv/logstash
    - user: logstash
    - group: logstash
    - dir_mode: 0755
