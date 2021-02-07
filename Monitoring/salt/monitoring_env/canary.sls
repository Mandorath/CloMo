collect_canary_repo:
  cmd.run:
    - name: git clone https://github.com/thinkst/canarytokens-docker.git /srv/canarytokens-docker


frontend_env:
  file.managed:
    - name: /srv/canarytokens-docker/frontend.env
    - source: salt://{{ slspath }}/templates/container/frontend.env
    - user: root
    - group: root
    - mode: 640
    - show_changes: True
    - template: jinja

switchboard_env:
  file.managed:
    - name: /srv/canarytokens-docker/switchboard.env
    - source: salt://{{ slspath }}/templates/container/switchboard.env
    - user: root
    - group: root
    - mode: 640
    - show_changes: True
    - template: jinja

certbot_env:
  file.managed:
    - name: /srv/canarytokens-docker/certbot.env
    - source: salt://{{ slspath }}/templates/container/certbot.env
    - user: root
    - group: root
    - mode: 640
    - show_changes: True
    - template: jinja

htpasswd:
  file.managed:
    - name: /srv/canarytokens-docker/certbot-nginx/.htpasswd
    - source: salt://{{ slspath }}/templates/container/htpasswd
    - user: root
    - group: root
    - mode: 640
    - show_changes: True
    - template: jinja

htpasswd_nginx:
  file.managed:
    - name: /srv/canarytokens-docker/nginx/.htpasswd
    - source: salt://{{ slspath }}/templates/container/htpasswd
    - user: root
    - group: root
    - mode: 640
    - show_changes: True
    - template: jinja

snap:
  cmd.run:
    - name: snap install core; sudo snap refresh core

file_symlink_snap_classic:
  file.symlink:
    - name: /snap
    - target: /var/lib/snapd/snap

snap-certbot:
  cmd.run:
    - name: snap install --classic certbot

file_symlink_certbot:
  file.symlink:
    - name: /usr/bin/certbot
    - target: /snap/bin/certbot
