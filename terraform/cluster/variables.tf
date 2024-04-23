variable "nb_master" {
  description = "The number of master nodes"
  type        = number
  default     = 1
}

variable "nb_worker" {
  description = "The number of worker nodes"
  type        = number
  default     = 1
}

output "name" {
  value = <<-EOT
    You may now run the following command to connect to the chaos-mesh dashboard:"
    
    $ kubectl port-forward svc/chaos-dashboard 2333:2333 -n chaos-mesh
    
    Then Open your browser, follow the instructions and there you go 🚀!
  EOT
} 
