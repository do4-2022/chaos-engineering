# OpenStack connection variables
variable "username" {
  description = "The OpenStack username"
  type        = string
  sensitive   = true
}

variable "tenant_name" {
  description = "The OpenStack tenant name"
  type        = string
  sensitive   = true
}

variable "password" {
  description = "The OpenStack password"
  type        = string
  sensitive   = true
}

variable "auth_url" {
  description = "The OpenStack auth URL"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "The OpenStack region"
  type        = string
  sensitive   = true
}

# The number of master and worker nodes
variable "nb_masters" {
  description = "Number of master nodes"
  type        = number
  default     = 1
}

variable "nb_workers" {
  description = "Number of worker nodes"
  type        = number
  default     = 1
}

# The image name determine the OS of the instance
variable "master_image_name" {
  description = "The OpenStack instance master image name"
  type        = string
  default     = "Debian-12"
}

variable "worker_image_name" {
  description = "The OpenStack instance worker image name"
  type        = string
  sensitive   = true
  default     = "Debian-12"
}

# The flavor name determine the size (CPU and memory) of the instance
variable "master_flavor_name" {
  description = "The OpenStack instance master flavor name"
  type        = string
  sensitive   = true
  default     = "m1.medram"
}

variable "worker_flavor_name" {
  description = "The OpenStack instance worker flavor name"
  type        = string
  sensitive   = true
  default     = "m1.medram"
}

# The floating IP pool from which the floating IP will be allocated
variable "master_floating_ip_pool" {
  description = "The OpenStack instance master floating IP pool"
  type        = string
  sensitive   = true
  default     = "public"
}

variable "worker_floating_ip_pool" {
  description = "The OpenStack instance worker floating IP pool"
  type        = string
  sensitive   = true
  default     = "public"
}

# SSH key
variable "ssh_public_key_path" {
  description = "The OpenStack instances ssh public key"
  type        = string
  sensitive   = true
}
