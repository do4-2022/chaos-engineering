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

variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
  default     = "local"
}
