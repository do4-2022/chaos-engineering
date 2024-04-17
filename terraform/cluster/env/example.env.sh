# Example environment variables for local development

#= MODIFY THESE LINES =============================================================================

export CLUSTER_NAME=""

export TF_VAR_nb_master=1
export TF_VAR_nb_worker=1

export TF_VAR_public_ssh_key_path="$HOME/.ssh/openstack.pub"
export TF_VAR_private_ssh_key_path="$HOME/.ssh/openstack"

export TF_VAR_kubeconfig_path="$HOME/.kube/config"

#= DO NOT MODIFY THESE LINES ======================================================================

export STATE_FILE="states/${CLUSTER_NAME}.tfstate"
echo "Environment variables loaded (environment: $TF_VAR_environment)"
echo "Use 'terraform init' to initialize Terraform with the correct backend configuration"