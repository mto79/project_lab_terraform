# project_terraform_template

Hybrid + multi-provider Terraform starter with env directories (dev/stage/prod) and support for workspaces (recommended for `dev` for per-tenant/per-dev stacks).

## Providers included
AWS, Azure, GCP, DigitalOcean, Hetzner Cloud, Proxmox, libvirt (KVM).

## Quick start (dev)
```bash
cd envs/dev
terraform init

# optional: dev workspaces
terraform workspace new alice
terraform workspace select alice

# set variables via tfvars or env vars, then:
terraform plan
terraform apply

environments (client, private, public, lab, demo)
-> stage (dev, acc, tst, prd )
--> provider (aws, azurerm, google, digitalocean, hetzner, proxmox, libvirt)
--->  variables (giving by tfvars file)

modules

We use stages for terraform workspaces

If there is one stage than envs/stage can be skipped and all stages can be defined in envs/prd

# how to handle states
