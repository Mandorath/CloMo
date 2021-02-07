KEYBOARD_LAYOUT: en_US
LOCALE: en_US.UTF-8
nameservers:
  - <nameserver_1>
  - <nameserver_2>
  - <nameserver_3>

enable_hosts_deny: True
hosts_deny:
  ALL:
    - ALL
    - EXCEPT
    - <IP>
    - <IP>/<CIDR>
