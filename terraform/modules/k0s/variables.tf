variable "ssh_key_path" {
  description = "The path to the SSH private key to use"
  type        = string
}

variable "master_hosts" {
  description = "Master hosts"
  type        = list(string)
}

variable "worker_hosts" {
  description = "Worker hosts"
  type        = list(string)
}

variable "kubeconfig_path" {
  description = "The path to kubeconfig file"
  type        = string
}
