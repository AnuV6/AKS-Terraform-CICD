# AKS Infrastructure as Code and Deployment Project

This repository contains Terraform configurations and Kubernetes manifests for deploying a simple web application on Azure Kubernetes Service (AKS).

## Project Overview

This project demonstrates how to:
- Set up an AKS cluster using Terraform
- Deploy applications to Kubernetes
- Use ConfigMaps to customize application content
- Implement Infrastructure as Code (IaC) principles

## Prerequisites

To use this repository, you'll need:

- Azure CLI
- Terraform
- kubectl
- Git
- Visual Studio Code

## Repository Structure
```bash
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── main.tf
│   └── outputs.tf
├── k8s/
│   ├── nginx-deployment.yaml
│   ├── nginx-service.yaml
│   ├── deployment.yaml 
│   └── service.yaml 
└── myweb/
    └── index.html
```
## Setup Instructions

### 1. Deploy AKS Cluster with Terraform

```bash
# Navigate to terraform directory
cd terraform

# Log in to Azure
az login

# Initialize Terraform
terraform init

# Create execution plan
terraform plan -out=tfplan

# Apply the plan
terraform apply tfplan

# Configure kubectl to connect to AKS
az aks get-credentials --resource-group aks-assignment-rg --name my-aks-cluster

# Deploy NGINX with Custom Content

# Create ConfigMap from custom HTML
kubectl create configmap nginx-index-html-configmap --from-file=index.html=./myweb/index.html

# Apply Kubernetes manifests
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Get the service's external IP
kubectl get service nginx-service
```

## Terraform Configuration Explanation

- **providers.tf**: Configures the Azure provider for Terraform
- **variables.tf**: Defines variables for resource group, location, cluster name, etc.
- **main.tf**: Contains the main Terraform code for creating the AKS cluster
- **outputs.tf**: Outputs the Kubernetes configuration information

## Kubernetes Manifests Explanation

- **nginx-deployment.yaml**: Defines a deployment for NGINX with 2 replicas
- **nginx-service.yaml**: Creates a LoadBalancer service to expose NGINX externally
- **deployment.yaml**: (Example) Defines a deployment for an echo server
- **service.yaml**: (Example) Creates a LoadBalancer service for the echo server

## Notes and Troubleshooting

- If you encounter issues with Kubernetes versions, remove the explicit version specification to let Azure select a default supported version.
- Make sure to check the service's external IP address with `kubectl get service nginx-service` before trying to access it in a browser.
- Custom content for NGINX is managed through a ConfigMap, which can be easily updated without rebuilding container images.
- You can access the deployed my web application at: http://172.179.122.42/