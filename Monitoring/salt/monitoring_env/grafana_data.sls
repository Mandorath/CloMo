{%- set plugins = salt['pillar.get']('grafana_plugins') %}

grafana_add_datasources:
  file.managed:
    - name: /etc/grafana/provisioning/datasources/datasources.yaml
    - source: salt://{{ slspath }}/templates/datasources.yaml
    - user: root
    - group: grafana
    - mode: 0640
    - template: jinja

{%- for key, data in plugins %}
grafana_plugin_{{ key }}:
  cmd.run:
    - name: grafana-cli plugins install {{ key }}
{%- endfor %}

grafana_restart:
  service.running:
    - name: grafana-server
    - watch:
      - file: /etc/grafana/provisioning/datasources/datasources.yaml
