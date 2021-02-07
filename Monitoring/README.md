# Monitoring

# Terraform
The terraform directory contains the IaC files for setting up virtual machines in KVM. Some configuration needs to be provided before the files can be used.

## Cloud init images
A shell script get-images.sh is provided to download the required cloud init images. Note that changes might occur over time to public repositories. Check if the cloud init images still exist in case of errors or newer images are required. Adapt the script in case this is required.

The images by default have low storage. The size of an image can be increased after downloading them using the commands provided in the shell script

## Main terraform file
The main terraform file expects the dmacvicar libvirt plugin to be installed. See the terraform documentation for installing this plugin. Currently the setup execpts to be executed on the same system KVM is running. Change the uri in case a remote system needs to be used.

There are several variables in the variables.tf file that might require changes. Also verify the currently configured resources assigned to each VM and modify these to your needs.

## Network files
Configure the IPv4 and/or IPv6 addresses for the Virtual Machines.

```
version: 2
ethernets:
  eth0:
    dhcp4: false
    dhcp6: false
    addresses:
      - <ipv4>/<cidr>
      - <ipv6>/<cidr>
    gateway4: <gateway_ip>
    gateway6: <gateway_ip>
    nameservers:
      addresses: [8.8.8.8,8.8.4.4]
```
## Cloud init files

There are several directives that require changes in the cloud init files. For example it is useful to create a user that allows sudo access and provide a public SSH key from a system in you're control to gain access to the virtual machines.

```
users:
    - name: <username>
      passwd: <passwd>
      lock_passwd: false
      ssh_authorized_keys:
          - <trusted ssh key>
      sudo: ['ALL=(ALL)']
```

Also provide the IP-address that is going to be used for the salt-master in case there is no DNS server available that provides this information.

```
bootcmd:
    - echo <ip> saltmaster01 >> /etc/hosts
```

# Saltstack
The salt master is by default configured to use IPv6. In case IPv4 should be used change the salt master configuration file in:

```
Monitoring\salt\templates\master

# Change the values
interface: '::'
ipv6: True
```

## Salt-Formulas
CloMo relies on several Salt-Formulas shown in the list below:

 - https://github.com/saltstack-formulas/chrony-formula
 - https://github.com/saltstack-formulas/elasticsearch-formula
 - https://github.com/bougie/salt-filebeat-formula
 - https://github.com/saltstack-formulas/grafana-formula
 - https://github.com/saltstack-formulas/logstash-formula
 - https://github.com/saltstack-formulas/nginx-formula

The sources used for this are stored in Monitoring/formulas/sources. Some of the formulas have has small changes to suit the needs to the experimental setup. A diff can be done from the source in to see any changes made in case a newer version of the formula is wished/required to be used.

## Salt states

###

## Certificates

### CA certificate
The setup by default uses private setup CA. If a by default non-trused CA is used to sign the certificate the CA public key should be provided to allow communication to be setup between filebeat and logstash. Providate the contents of the CA used to generate certificates for the nodes in the environment in the ca_wo.crt file.

```
Monitoring\salt\templates\<ca_wo>.crt
```
The following files use the ca_wo.crt certificate:

```
Monitoring\salt\aws_vms\filebeat_certs_hvm1.sls
Monitoring\salt\aws_vms\filebeat_certs_hvm2.sls
Monitoring\salt\aws_vms\filebeat_certs_hvm3.sls
Monitoring\salt\aws_vms\filebeat_certs_hvm4.sls
```

### Filebeat Certificates
The instances setup in AWS require certificates. The /salt/templates/filebeat_certs directory requires a certificate per node. Replace the dummy certificates with certificates that are used to secure the filebeat traffic.
Without modification of the salt states 4 certificates and private keys are needed. Add these to the filebeat_certs directory inside templates directory.

### Jenkins Certificate
Jenkins require a .jks file for using TLS. Create one and place it in:

```
Monitoring\salt\templates\jenkins\jenkins.jks
```

### Monitor (Logstash/Grafana) Certificates
Several application use certificates on the monitoring system. Add certificates files to the following directories:

```
Monitoring\salt\templates\monitor\<filename>.key
Monitoring\salt\templates\monitor\<filename>.pem
```

Replace the values of the source directive in the following files to matches the location:

```
Monitoring\salt\monitoring_env\certs.sls
Monitoring\salt\monitoring_env\logstash_certs.sls
```

## Jenkins

### Jenkins jobs
The Jenkins job template requires several tokens and users defined in the job. This could be done as part of the salt configuration. However this could also be modified after the Jenkins server has been installed and the pipeline is created.

```
Monitoring\salt\templates\jenkinsjobs\
```

Tags to replace:

```
"<AWS_KEY>"
"<AWS_SECRET>"
"<account_email>"
"<account name>"
"<github_repo>"
"<gitlab_repo>"
"<bitbucket_repo>"
"<sourceforge_repo>"
<user>
```
