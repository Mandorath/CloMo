#!/bin/bash
# Retrieved from https://gitlab.com/wezzels/libvirt-terraform-examples/-/blob/master/get_images.sh
#Create directory to put images in.
mkdir -p imgs

#Download images to improve performance.
cd imgs
#Ubuntu and debian based.
curl -O https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img

#CentOS  8
curl -O https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2

#Resize to 5G each
qemu-img resize CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2 +50G
