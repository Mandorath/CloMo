jenkins:
  lookup:
    # Base
    port: 8080
    https_port: 8443
    https_keystore: /etc/jenkins/jenkins.jks
    https_keystore_pw: Lbw0S7GJvdo63LB1XkeY
    https_listen_addr: 0.0.0.0
    home: /usr/local/jenkins
    user: jenkins
    group: www-data
    server_name: jenkins01
    # Nginx
    symlink_vhost: False
    nginx_user: nginx
    nginx_group: nginx
    nginx_vhost_path: /etc/nginx/sites-available
    # Plugins
    plugins:
      installed:
        - git
        - git-client
        - rebuild
        - mailer
        - credentials
        - ssh-credentials
        - cloudbees-folders
        - timestamper
