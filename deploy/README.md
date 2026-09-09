# Azure ACI Deployment (POC)

This folder contains an Azure Container Instances (ACI) deployment template for the **sum two** static app container.

## What is included
- `main.bicep`: Deploys
  - Log Analytics workspace
  - ACI container group (public IP + DNS label)
- `parameters.json`: Default parameter values for quick deployment

## Assumptions
- Container image already exists in a registry (for example, Azure Container Registry).
- Image build and push are handled externally.
- This template does **not** create any ACR resources.

## Deploy with Azure CLI

```bash
az group create -n sumtwo-rg -l southeastasia
az deployment group create \
  -g sumtwo-rg \
  -f deploy/main.bicep \
  -p @deploy/parameters.json
```

## Notes
- Update `dnsNameLabel` to a globally unique value in the target region.
- Update registry credentials and image details before deploying.
