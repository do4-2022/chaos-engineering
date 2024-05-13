variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
  default     = "local"
}

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

variable "docker_config_path" {
  type        = string
  description = "The path to the docker config file"
  default     = "~/.docker/config.json"
}

# Secrets

variable "git_username" {
  description = "The username for authenticating to the NATS-Julien-Yann-AlexisB repositories"
  type        = string
}

variable "git_password" {
  description = "The password for authenticating to the NATS-Julien-Yann-AlexisB repositories"
  type        = string
  sensitive   = true
}
