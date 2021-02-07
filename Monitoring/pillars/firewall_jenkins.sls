
firewall_profiles:
  web:
    public:
      name: public
      services:
        - ssh
        - jenkins

firewall_services:
  jenkins:
    name: jenkins
    ports:
      - 8443/tcp
