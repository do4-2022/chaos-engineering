variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
}

variable "master_hosts" {
  description = "List of master hosts"
  type        = list(string)
}

variable "worker_hosts" {
  description = "List of worker hosts"
  type        = list(string)
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
