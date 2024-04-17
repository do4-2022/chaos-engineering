variable "ssh_key_path" {
  description = "The path to the SSH public key to use"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "nb_master" {
  description = "Number of master nodes"
  type        = number
}

variable "nb_worker" {
  description = "Number of worker nodes"
  type        = number
}

variable "kubeconfig_path" {
  description = "The path to kubeconfig file"
  type        = string
}
