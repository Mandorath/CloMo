{%- set os_family = grains['os_family']|lower %}
{%- set package_list_options_override = salt['pillar.get'](os_family + '_package_list_options_override') %}

{%- if salt['pillar.get'](os_family ~ '_package_list_options_override') %}
{%-   for packagename, details in package_list_options_override.items() %}
install_package_{{ packagename | replace("-", "_") }}:
  pkg.installed:
    - failhard: True
    - name: {{ packagename }}
{%-     if details.version is defined %}
    - version: {{ details.version }}
{%-     endif %}
{%-     if details.refresh is defined %}
    - refresh: {{ details.refresh }}
{%-     else %}
    - refresh: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:refresh') }}
{%-     endif %}
{%-     if details.hold is defined %}
    - hold: {{ details.hold }}
{%-     else %}
    - hold: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:hold') }}
{%-     endif %}
{%-     if details.allow_updates is defined %}
    - allow_updates: {{ details.allow_updates }}
{%-     else %}
    - allow_updates: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:allow_updates') }}
{%-     endif %}
{%-     if details.skip_verify is defined %}
    - skip_verify: {{ details.skip_verify }}
{%-     else %}
    - skip_verify: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:skip_verify') }}
{%-     endif %}
{%-     if details.skip_suggestions is defined %}
    - skip_suggestions: {{ details.skip_suggestions }}
{%-     else %}
    - skip_suggestions: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:skip_suggestions') }}
{%-     endif %}
{%-     if details.pkg_verify is defined %}
    - pkg_verify: {{ details.pkg_verify }}
{%-     else %}
    - pkg_verify: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:pkg_verify') }}
{%-     endif %}
{%-     if details.normalize is defined %}
    - normalize: {{ details.normalize }}
{%-     else %}
    - normalize: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:normalize') }}
{%-     endif %}
{%-     if details.ignore_epoch is defined %}
    - ignore_epoch: {{ details.ignore_epoch }}
{%-     else %}
    - ignore_epoch: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:ignore_epoch') }}
{%-     endif %}
{%-     if details.reinstall is defined %}
    - reinstall: {{ details.reinstall }}
{%-     else %}
    - reinstall: {{ salt['pillar.get'](os_family ~ '_foreman_package_options:reinstall') }}
{%-     endif %}
{%-   endfor %}
{%- endif %}
