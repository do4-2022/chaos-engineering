variable "ssh_key_path" {
  description = "The path to the SSH public key to use"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
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
