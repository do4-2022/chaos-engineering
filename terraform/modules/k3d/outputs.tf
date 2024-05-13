output "config_endpoint" {
  value = k3d_cluster.votingapp.credentials[0].host
}

output "config_cluster_ca_certificate" {
  value = k3d_cluster.votingapp.credentials[0].cluster_ca_certificate
}

output "config_client_certificate" {
  value = k3d_cluster.votingapp.credentials[0].client_certificate
}

output "config_client_key" {
  value = k3d_cluster.votingapp.credentials[0].client_key
}
