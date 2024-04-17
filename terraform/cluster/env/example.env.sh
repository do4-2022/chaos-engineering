# Example environment variables for local development

#= MODIFY THESE LINES =============================================================================

export TF_VAR_nb_master=1
export TF_VAR_nb_worker=1

export TF_VAR_ssh_public_key_path="$HOME/.ssh/openstack.pub"
export TF_VAR_ssh_private_key_path="$HOME/.ssh/openstack"

export TF_VAR_kubeconfig_path="$HOME/.kube/config"

#= DO NOT MODIFY THESE LINES ======================================================================

echo "Use 'terraform init' to initialize Terraform with the correct backend configuration"