variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
}

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

variable "docker_config_path" {
  type        = string
  description = "The path to the docker config file"
  default     = "~/.docker/config.json"
}

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

# OpenStack variables
variable "openstack_auth_url" {
  description = "The OpenStack auth URL"
  type        = string
  sensitive   = true
  default     = "https://overcloud.do.intra:13000"
}

variable "openstack_identity_application_credential" {
  description = "The OpenStack application credential"
  type = object({
    id     = string
    secret = string
    region = string
  })
  default = {
    id     = ""
    secret = ""
    region = ""
  }
}
