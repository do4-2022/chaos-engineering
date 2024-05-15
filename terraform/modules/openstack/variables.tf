variable "openstack_username" {
  description = "The OpenStack username"
  type        = string
  sensitive   = true
}

variable "openstack_tenant_name" {
  description = "The OpenStack tenant name"
  type        = string
  sensitive   = true
}

variable "openstack_password" {
  description = "The OpenStack password"
  type        = string
  sensitive   = true
}

variable "openstack_auth_url" {
  description = "The OpenStack auth URL"
  type        = string
  sensitive   = true
}

variable "openstack_region" {
  description = "The OpenStack region"
  type        = string
  sensitive   = true
}

variable "openstack_instance_master_name" {
  description = "The OpenStack instance master name"
  type        = string
  sensitive   = true
  default     = "k0s-master"
}

variable "openstack_instance_master_image_name" {
  description = "The OpenStack instance master image name"
  type        = string
  sensitive   = true
  default     = "Debian-12"
}

variable "openstack_instance_master_flavor_name" {
  description = "The OpenStack instance master flavor name"
  type        = string
  sensitive   = true
  default     = "m1.medram"
}

variable "openstack_instance_master_floating_ip_pool" {
  description = "The OpenStack instance master floating IP pool"
  type        = string
  sensitive   = true
  default     = "public"
}

variable "openstack_instance_worker_name" {
  description = "The OpenStack instance worker name"
  type        = string
  sensitive   = true
  default     = "k0s-worker"
}

variable "openstack_instance_worker_image_name" {
  description = "The OpenStack instance worker image name"
  type        = string
  sensitive   = true
  default     = "Debian-12"
}

variable "openstack_instance_worker_flavor_name" {
  description = "The OpenStack instance worker flavor name"
  type        = string
  sensitive   = true
  default     = "m1.medram"
}

variable "openstack_instance_worker_floating_ip_pool" {
  description = "The OpenStack instance worker floating IP pool"
  type        = string
  sensitive   = true
  default     = "public"
}

variable "openstack_instances_keypair_name" {
  description = "The OpenStack instances keypair name"
  type        = string
  sensitive   = true
}

variable "openstack_instances_keypair_public_key" {
  description = "The OpenStack instances keypair public key"
  type        = string
  sensitive   = true
}
