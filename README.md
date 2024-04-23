# do4-2022/NATS-Julien-Yann

# Setup the cluster

1. Navigate to the Terraform directory:

   ```
   cd terraform/cluster
   ```

2. Copy the `terraform/cluster/example.env.sh` file to `terraform/cluster/whateveryouwant.env.sh` and fill in the necessary values.

3. Source the environment variables:

   ```
   source env/whateveryouwant.env.sh
   ```

4. Initialize Terraform:

   ```
   terraform init
   ```

5. Create a Terraform plan to preview the changes:

   ```
   terraform plan -out plan.plan
   ```

6. Check the plan and ensure that the resources are correct.

7. Apply the configuration and provision the cluster:

   ```
   terraform apply plan.plan
   ```

> [!NOTE]
> You might want to apply the configuration a second time as the apply of the CRDs might fail the first time. 