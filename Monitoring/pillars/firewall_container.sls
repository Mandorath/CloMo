
firewall_profiles:
  web:
    public:
      name: public
      services:
        - ssh
        - web

firewall_services:
  web:
    name: web
    ports:
      - 80/tcp
      - 443/tcp
