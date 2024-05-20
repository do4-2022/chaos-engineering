variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
}

variable "ssh_login_name" {
  description = "Name of the user to use for SSH access"
}

variable "docker_config_path" {
  type        = string
  description = "The path to the docker config file"
  default     = "~/.docker/config.json"
}

# Secrets

variable "git_username" {
  description = "The username for authenticating to the nats-julien-yann-alexisb repositories"
  type        = string
}

variable "git_password" {
  description = "The password for authenticating to the nats-julien-yann-alexisb repositories"
  type        = string
  sensitive   = true
}

variable "postgresql_username" {
  description = "The username for authenticating to the PostgreSQL database"
  type        = string
}

variable "postgresql_password" {
  description = "The password for authenticating to the PostgreSQL database"
  type        = string
  sensitive   = true
}

# OpenStack

variable "openstack_username" {
  description = "The OpenStack username"
  type        = string
}

variable "openstack_tenant_name" {
  description = "The OpenStack tenant name"
  type        = string
}

variable "openstack_password" {
  description = "The OpenStack password"
  type        = string
  sensitive   = true
}

variable "openstack_auth_url" {
  description = "The OpenStack auth URL"
  type        = string
}

variable "openstack_region" {
  description = "The OpenStack region"
  type        = string
}

variable "openstack_ssh_public_key_path" {
  description = "The OpenStack instances ssh public key path"
  type        = string
}

variable "openstack_ssh_private_key_path" {
  description = "The OpenStack instances ssh private key path"
  type        = string
  sensitive   = true
}
