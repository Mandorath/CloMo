# my_package_list:
#   - packagename
#
# my_package_list_options_override:
#   packagename:
#     - version: 1.2.3
#     - default_installed: yes
#     - locked: yes
#

debian_package_options:
  hold: True
  refresh: True
  allow_updates: False
  skip_verify: False
  skip_suggestions: False
  pkg_verify: False
  normalize: True
  ignore_epoch: False
  reinstall: False

debian_package_list_options_override:
  python3-dnf-plugin-versionlock:
    - allow_updates: True
  python3-pip:
    - allow_updates: True
