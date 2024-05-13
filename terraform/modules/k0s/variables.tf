variable "master_hosts" {
  description = "List of master hosts"
  type        = list(string)
}

variable "worker_hosts" {
  description = "List of worker hosts"
  type        = list(string)
}

variable "ssh_login_name" {
  description = "SSH user to connect to hosts"
}

variable "cluster_environment" {
  description = "The environment of the cluster"
  type        = string
}
