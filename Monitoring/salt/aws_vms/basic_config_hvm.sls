# keyboard layout
default_locale:
  locale.system:
   - name: {{ pillar['LOCALE'] }}

set timezone:
  timezone.system:
    - name: {{ salt.pillar.get('time_zone', 'UTC') }}
    - utc: False  # this means: do not set the hardware clock to UTC

hosts_deny:
  file.managed:
    - name: /etc/hosts.deny
    - source: salt://{{ slspath }}/templates/hosts_hvm.deny
    - user: root
    - group: root
    - mode: 644
    - show_changes: True
    - template: jinja
