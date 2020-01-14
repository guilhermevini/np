#!/bin/bash

terraform init
terraform workspace new neon-lab # se for a primeira vez
terraform workspace select neon-lab
terraform validate
terraform plan -target=module.infra_lab -out=tfplan -input=false
terraform apply -input=false -auto-approve tfplan
