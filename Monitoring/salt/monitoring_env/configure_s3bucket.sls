s3fuse_package:
  pkg.installed:
    - name: s3fs-fuse

fuse_configuration:
  file.managed:
    - name: /etc/fuse.conf
    - source: salt://{{ slspath }}/templates/fuse.conf
    - user: root
    - group: root
    - mode: 0600
    - require:
      - pkg: s3fs-fuse

s3_bucket_dir:
  file.directory:
    - name: /srv/s3-bucket
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: 0644


s3_pwd_file:
  file.managed:
    - name: /etc/passwd-s3fs
    - source: salt://{{ slspath }}/templates/passwd-s3fs
    - user: root
    - group: root
    - mode: 0600

s3_bucket_fstab:
  mount.fstab_present:
    - name: s3fs#<bucket>
    - fs_file: /srv/s3-bucket
    - fs_vfstype: fuse
    - fs_mntops: _netdev,allow_other,url=https://s3.amazonaws.com
    - fs_freq: 0
    - fs_passno: 0
    - mount: True
    - require:
      - file: /srv/s3-bucket
      - file: /etc/passwd-s3fs
      - file: /etc/fuse.conf
