
jenkins_dir:
  file.directory:
    - name: /etc/jenkins
    - user: jenkins
    - group: root
    - dir_mode: 0700

file_jenkins_jks:
  file.managed:
    - name: /etc/jenkins/jenkins.jks
    - source: salt://{{ slspath }}/templates/jenkins/jenkins.jks
    - user: jenkins
    - group: root
    - mode: 0600

jenkins_ssh_dir:
  file.directory:
    - name: /var/lib/jenkins/Gitlab/.ssh
    - user: jenkins
    - group: jenkins
    - dir_mode: 0700

file_jenkins_key:
  file.managed:
    - name: /var/lib/jenkins/Gitlab/.ssh/id_ed25519
    - source: salt://{{ slspath }}/templates/jenkins/jenkins_ssh.key
    - user: jenkins
    - group: jenkins
    - mode: 0600

file_jenkins_pem:
  file.managed:
    - name: /var/lib/jenkins/Gitlab/.ssh/id_ed25519.pub
    - source: salt://{{ slspath }}/templates/jenkins/jenkins_ssh.pem
    - user: jenkins
    - group: jenkins
    - mode: 0600
