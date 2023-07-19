# lemmy-azure-container-apps

Deploys Lemmy on Azure Container Apps with the following components:
- Azure Container App environment
- Azure Postgres Flexible Server Database
- Container Apps for:
  - nginx or Caddy
  - lemmy UI
  - lemmy backend
  - pict-rs
  - postfix

The infrastucture is deployed using Terraform Cloud.

Most configuration knowledge was taken from here: https://join-lemmy.org/docs/administration/install_docker.html

## Required Terraform Workspace Variables

The following variables are required to be set in the workspace (i.e. in the UI) for the Terraform azurerm provider to authenticate:

```
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
```

Other required workspace variables are documented in `variables_workspace.tf`

## Related Github repositories

https://github.com/FrostSalamander/lemmy-azure-container-apps

- This repo. Contains Terraform configuration to deploy the project

https://github.com/FrostSalamander/lemmy-azure-acr

- Deploys an Azure Container Registry and related build tasks for the images used in this project.  Pushes to the below image repos will trigger automatic builds in ACR.

https://github.com/FrostSalamander/docker-lemmy-nginx
- Nginx image used for Lemmy.  Container Apps doesn't support ConfigMaps yet, so need to bake Nginx configuration into our own image

https://github.com/FrostSalamander/docker-lemmy-caddy
- Caddy image if preferred over Nginx. Also requires baked-in config

https://github.com/FrostSalamander/docker-lemmy
- Lemmy backend image.  Contains baked-in config.

https://github.com/FrostSalamander/lemmy-ui
- Forked version of Lemmy UI.  Branch taken at version 0.18.2 tag and extra tooling added into lemmy-ui runtime Docker image (curl, wget, drill).  Can use this branch to add any other debugging: https://github.com/FrostSalamander/lemmy-ui/tree/docker-debug