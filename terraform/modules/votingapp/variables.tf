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
