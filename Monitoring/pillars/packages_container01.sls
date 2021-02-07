# my_package_list:
#   - packagename
#
# my_package_list_options_override:
#   packagename:
#     - version: 1.2.3
#     - default_installed: yes
#     - locked: yes
#

redhat_package_options:
  hold: True
  refresh: True
  allow_updates: False
  skip_verify: False
  skip_suggestions: False
  pkg_verify: False
  normalize: True
  ignore_epoch: False
  reinstall: False

redhat_package_list_options_override:
  python3-dnf-plugin-versionlock:
    - allow_updates: True
  python3-pip:
    - allow_updates: True
  python36-devel:
    - allow_updates: True
  git:
    - allow_updates: True
  lsof:
    - allow_updates: True
  libyaml:
    - allow_updates: True
  epel-release:
    - allow_updates: True
  docker-ce:
    - allow_updates: True
  docker-ce-cli:
    - allow_updates: True
  containerd.io:
    - allow_updates: True
  httpd-tools:
    - allow_updates: True
  snapd:
    - allow_updates: True
