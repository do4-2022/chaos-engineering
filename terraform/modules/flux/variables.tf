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

variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
}

# Git repositories
variable "git_username" {
  description = "The username for authenticating to the NATS-Julien-Yann-AlexisB repositories"
  type        = string
}

variable "git_password" {
  description = "The password for authenticating to the NATS-Julien-Yann-AlexisB repositories"
  type        = string
  sensitive   = true
}
