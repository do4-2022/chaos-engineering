locals {
  kubeconfig_content = fileexists(var.kubeconfig_path) ? file(var.kubeconfig_path) : yamlencode({
    apiVersion : "v1",
    kind : "Config",
    clusters : [],
    contexts : [],
    users : []
  })
}

resource "k0s_cluster" "kubernetes_cluster" {
  name    = "kubernetes-cluster"
  version = "1.29.3+k0s.0"

  hosts = concat(
    [for host in var.master_hosts : {
      role = "controller"

      ssh = {
        address  = host
        port     = 22
        user     = "debian"
        key_path = var.ssh_key_path
      }
    }],
    [for host in var.worker_hosts : {
      role = "worker"

      ssh = {
        address  = host
        port     = 22
        user     = "debian"
        key_path = var.ssh_key_path
      }
    }]
  )
}

# merge the kubeconfig file with the existing one (if any)
resource "local_sensitive_file" "merge_kubeconfig" {
  filename = var.kubeconfig_path
  content = yamlencode({
    "apiVersion" : "v1",
    "kind" : "Config",
    "current-context" : yamldecode(k0s_cluster.kubernetes_cluster.kubeconfig).current-context,
    "clusters" : concat(
      yamldecode(local.kubeconfig_content).clusters,
      [yamldecode(k0s_cluster.kubernetes_cluster.kubeconfig).clusters[0]]
    ),
    "contexts" : concat(
      yamldecode(local.kubeconfig_content).contexts,
      [yamldecode(k0s_cluster.kubernetes_cluster.kubeconfig).contexts[0]]
    ),
    "users" : concat(
      yamldecode(local.kubeconfig_content).users,
      [yamldecode(k0s_cluster.kubernetes_cluster.kubeconfig).users[0]]
    )
  })
}
