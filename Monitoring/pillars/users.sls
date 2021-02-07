


groups:
  monitoring:
    state: present
  www-data:
    state: present
  grafana:
    state: present

users:
  mouw:
    fullname: <user>
    createhome: true
    system: false
    home: /home/<user>
    homedir_owner: <user>
    homedir_group: <user>
    user_dir_mode: 760
    manage_vimrc: false
    allow_gid_change: false
    manage_bashrc: false
    manage_profile: false
    shell: /bin/bash
    groups:
      - users
      - monitoring
    sudouser: true
  www-data:
    fullname: www-data
    createhome: true
    system: true
    home: /var/www
    homedir_owner: www-data
    homedir_group: www-data
    user_dir_mode: 774
    manage_vimrc: false
    allow_gid_change: false
    manage_bashrc: false
    manage_profile: false
    shell: /bin/false
    groups:
      - users
    sudouser: false
  jenkins:
    fullname: jenkins
    createhome: true
    system: false
    home: /var/lib/jenkins
    homedir_owner: jenkins
    homedir_group: jenkins
    user_dir_mode: 755
    manage_vimrc: false
    allow_gid_change: false
    manage_bashrc: false
    manage_profile: false
    shell: /bin/bash
    groups:
      - users
      - monitoring
    sudouser: false
