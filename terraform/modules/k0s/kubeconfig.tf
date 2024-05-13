resource "local_file" "kubeconfig" {
  content  = k0s_cluster.votingapp.kubeconfig
  filename = "${path.module}/output/kubeconfig.yaml"
}
