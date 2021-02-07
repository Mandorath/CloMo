terraform {
  required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.3"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

data "template_file" "user_data_container01" {
  template = file("${path.module}/cloud_init_container01.cfg")
}

data "template_file" "user_data_monitor01" {
  template = file("${path.module}/cloud_init_monitor01.cfg")
}

data "template_file" "user_data_jenkins01" {
  template = file("${path.module}/cloud_init_jenkins01.cfg")
}

data "template_file" "master_data" {
  template = file("${path.module}/cloud_salt_master.cfg")
}


data "template_file" "network_config_monitor01" {
  template = file("${path.module}/network_monitor01.cfg")
}

data "template_file" "network_config_container01" {
  template = file("${path.module}/network_container01.cfg")
}

data "template_file" "network_config_jenkins01" {
  template = file("${path.module}/network_jenkins01.cfg")
}

data "template_file" "network_saltmaster" {
  template = file("${path.module}/network_saltmaster.cfg")
}

resource "libvirt_cloudinit_disk" "commoninit_monitor01" {
  name           = "commoninit_monitor01.iso"
  user_data      = data.template_file.user_data_monitor01.rendered
  network_config = data.template_file.network_config_monitor01.rendered
}


resource "libvirt_cloudinit_disk" "commoninit_container01" {
  name           = "commoninit_container01.iso"
  user_data      = data.template_file.user_data_container01.rendered
  network_config = data.template_file.network_config_container01.rendered
}

resource "libvirt_cloudinit_disk" "commoninit_jenkins01" {
  name           = "commoninit_jenkins01.iso"
  user_data      = data.template_file.user_data_jenkins01.rendered
  network_config = data.template_file.network_config_jenkins01.rendered
}

resource "libvirt_cloudinit_disk" "commonsaltmaster" {
  name           = "commoninit_saltmaster01.iso"
  user_data      = data.template_file.master_data.rendered
  network_config = data.template_file.network_saltmaster.rendered
}


# Define KVM domain to create
resource "libvirt_volume" "saltmaster01" {
  name   = "saltmaster01.qcow2"
  pool   = var.datastore
  source = var.image
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "monitor01" {
  name   = "monitor01.qcow2"
  pool   = var.datastore
  source = var.image
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "container01" {
  name   = "container01.qcow2"
  pool   = var.datastore
  source = var.image
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

resource "libvirt_volume" "jenkins01" {
  name   = "jenkins01.qcow2"
  pool   = var.datastore
  source = var.image
  #source = "./CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

# Define KVM domain to create
resource "libvirt_domain" "monitor01" {
  name   = "monitor01"
  memory = "16384"
  vcpu   = 8

  #  firmware = "/usr/share/OVMF/OVMF_CODE.secboot.fd"

  cloudinit = libvirt_cloudinit_disk.commoninit_monitor01.id

  network_interface {
    bridge = var.bridge
  }

  disk {
    volume_id = libvirt_volume.monitor01.id
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}


resource "libvirt_domain" "saltmaster01" {
  name   = "saltmaster01"
  memory = "4096"
  vcpu   = 4

  #  firmware = "/usr/share/OVMF/OVMF_CODE.secboot.fd"

  cloudinit = libvirt_cloudinit_disk.commonsaltmaster.id


  network_interface {
    bridge = var.bridge
  }

  disk {
    volume_id = libvirt_volume.saltmaster01.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }


  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}

# Define KVM domain to create
resource "libvirt_domain" "container01" {
  name   = "container01"
  memory = "8192"
  vcpu   = 8

  #  firmware = "/usr/share/OVMF/OVMF_CODE.secboot.fd"

  cloudinit = libvirt_cloudinit_disk.commoninit_container01.id

  network_interface {
    bridge = var.bridge
  }

  disk {
    volume_id = libvirt_volume.container01.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}

# Define KVM domain to create
resource "libvirt_domain" "jenkins01" {
  name   = "jenkins01"
  memory = "8192"
  vcpu   = 8

  #  firmware = "/usr/share/OVMF/OVMF_CODE.secboot.fd"

  cloudinit = libvirt_cloudinit_disk.commoninit_jenkins01.id

  network_interface {
    bridge = var.bridge
  }

  disk {
    volume_id = libvirt_volume.jenkins01.id
  }

  console {
    type        = "pty"
    target_type = "serial"
    target_port = "0"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  graphics {
    type        = "vnc"
    listen_type = "address"
    autoport    = true
  }
}
