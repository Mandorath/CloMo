terraform:
  pkgrepo.managed:
    - humanname: Terraform
    - baseurl: https://rpm.releases.hashicorp.com/RHEL/hashicorp.rep
    - comments:
        - 'https://rpm.releases.hashicorp.com/RHEL/hashicorp.rep'
    - gpgcheck: 1
    - key_url: https://rpm.releases.hashicorp.com/gpg

docker:
  pkgrepo.managed:
    - humanname: docker
    - baseurl: https://download.docker.com/linux/centos/docker-ce.repo
    - comments:
        - 'https://download.docker.com/linux/centos/docker-ce.repo'
    - gpgcheck: 1
    - key_url: https://download.docker.com/linux/centos/gpg
