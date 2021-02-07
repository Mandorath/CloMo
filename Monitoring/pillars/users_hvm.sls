
groups:
  monitoring:
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
