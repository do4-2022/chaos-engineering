# Voting App infrastructure

This repository contains all necessary configurations for provisioning the infrastructure of the Voting application (with NATS) using Terraform. It supports setting up and configuring a Kubernetes cluster, either locally via K3d or on a remote environment with K0s. This project uses Flux to manage the Kubernetes resources.

## Prerequisites

Before starting, ensure you have the following tools installed on your machine:

- Terraform (v0.12+)
- kubectl (matching your Kubernetes cluster version)

## Cluster Creation

### Local Cluster with K3d

K3d is a lightweight wrapper to run K3s (Rancher Lab's minimal Kubernetes distribution) in Docker.

To create a local Kubernetes cluster with K3d:

1. Move to the `local-cluster` directory:

   ```
   cd terraform/local-cluster
   ```

2. Copy `example.tfvars` to `local.tfvars` and fill in the necessary values.

3. Initialize Terraform:

   ```
   terraform init
   ```

4. Create a plan to preview the changes:

   ```
   terraform plan -out plan.plan -var-file=local.tfvars
   ```

5. If everything looks good. Apply the configuration:

   ```
   terraform apply plan.plan
   ```

> **Note:** To destroy the local cluster, run `terraform destroy -var-file=local.tfvars`. It will remove the K3d cluster and the associated resources. If it fails to remove the cluster, you can manually delete it by running `k3d cluster delete votingapp` or by destroying the docker containers (starting with `k3d-votingapp`: `docker ps -a | grep k3d-votingapp | awk '{print $1}' | xargs docker rm -f`).

### Remote Cluster with K0s

K0s is a minimal Kubernetes distribution that is designed to be secure, lightweight, and easy to install.
K0s is now production-ready and can be used to deploy a remote Kubernetes cluster.

To deploy a remote Kubernetes cluster with k0s:

1. Move to the `remote-cluster` directory:

   ```
   cd terraform/remote-cluster
   ```

2. The Terraform state is stored securely in Terraform Cloud. So first you need to login to Terraform Cloud:

   ```
   terraform login
   ```

3. Copy the `example.tfvars` file to `production.tfvars` and fill in the necessary values.

4. Initialize Terraform:

   ```
   terraform init
   ```

5. Create a plan to preview the changes:

   ```
   terraform plan -out plan.plan -var-file=production.tfvars
   ```

6. If everything looks good. Apply the configuration:

   ```
   terraform apply plan.plan
   ```

## Maintenance

This project uses Flux to manage the Kubernetes resources. Flux watches the Git repository for changes and applies the changes to the cluster.

You just have to push the changes to the repository, and Flux will automatically apply the changes to the cluster.
