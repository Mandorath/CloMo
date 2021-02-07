variable "datastore" {
  default     = "vm_datastore01"
  description = "KVM datastore that should be used"
}

variable "image" {
  default     = "CentOS-8-GenericCloud-8.2.2004-20200611.2.x86_64.qcow2"
  description = "Image that should be used"
}

variable "bridge" {
  default     = "br1"
  description = "Bridge interface to use"
}
