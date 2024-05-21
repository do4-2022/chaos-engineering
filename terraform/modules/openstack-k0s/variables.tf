# Kubernetes cluster configuration
variable "cluster_config_endpoint" {
  description = "The Kubernetes API server endpoint"
  type        = string
}

variable "cluster_config_client_certificate" {
  description = "The client certificate for authenticating to the Kubernetes API server"
  type        = string
  sensitive   = true
}

variable "cluster_config_client_key" {
  description = "The client key for authenticating to the Kubernetes API server"
  type        = string
  sensitive   = true
}

variable "cluster_config_cluster_ca_certificate" {
  description = "The cluster CA certificate for authenticating to the Kubernetes API server"
  type        = string
  sensitive   = true
}

# OpenStack configuration
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
