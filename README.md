# np

First, create a bucket for save the terraform state

```bash
chmod +X init.sh
./init.sh
```

Execute terraform

```bash
terraform --version # Terraform v0.11.14

terraform init
terraform workspace new neon-lab # se for a primeira vez
terraform workspace list # se quiser verificar se criou
terraform workspace select neon-lab
terraform validate
terraform plan -target=module.infra_lab -out=tfplan -input=false
terraform apply -input=false -auto-approve tfplan
```
