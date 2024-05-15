locals {
  controller_hosts = [for host in var.master_hosts : host if !contains(var.worker_hosts, host)]
  worker_hosts     = [for host in var.worker_hosts : host if !contains(var.master_hosts, host)]
  both_hosts       = [for host in var.master_hosts : host if contains(var.worker_hosts, host)]
}

resource "k0s_cluster" "votingapp" {
  name    = "votingapp-${var.cluster_environment}"
  version = "1.29.3+k0s.0"

  hosts = concat(
    [
      for index, controller_host in local.controller_hosts : {
        role = "controller"
        ssh = {
          address  = controller_host
          port     = 22
          user     = var.ssh_login_name
          key_path = var.ssh_private_key_path
        }
        hostname = "votingapp-${var.cluster_environment}-controller-${index}"
      }
    ],
    [
      for index, worker_host in local.worker_hosts : {
        role = "worker"
        ssh = {
          address  = worker_host
          port     = 22
          user     = var.ssh_login_name
          key_path = var.ssh_private_key_path
        }
        hostname = "votingapp-${var.cluster_environment}-worker-${index}"
      }
    ],
    [
      for index, both_host in local.both_hosts : {
        role = "controller+worker"
        ssh = {
          address  = both_host
          port     = 22
          user     = var.ssh_login_name
          key_path = var.ssh_private_key_path
        }
        no_taints = true
        hostname  = "votingapp-${var.cluster_environment}-controller-worker-${index}"
      }
    ]
  )
}
