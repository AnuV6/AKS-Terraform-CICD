# 🚀 AKS Infrastructure as Code and Deployment Project

This repository showcases a complete end-to-end deployment of a web application on Azure Kubernetes Service (AKS) using Infrastructure as Code principles.
![AKS Project Architecture Diagram](https://github.com/user-attachments/assets/dcbe7b23-3d67-4606-9af9-813dc74095d3)

## ✨ Project Overview

This project demonstrates modern DevOps practices by:
- 🏗️ Setting up an AKS cluster using Terraform
- 🚢 Deploying applications to Kubernetes
- ⚙️ Using ConfigMaps to customize application content
- 📝 Implementing Infrastructure as Code (IaC) principles
- 🔄 Establishing a repeatable deployment process

## 📋 Prerequisites

Before starting, ensure you have the following tools installed:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://www.terraform.io/downloads.html)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Git](https://git-scm.com/downloads)
- [Visual Studio Code](https://code.visualstudio.com/)

## 📂 Repository Structure

```
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

## 🔧 Step-by-Step Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/AnuV6/AKS-Terraform-CICD.git
cd AKS-Terraform-CICD
```

### 2. Set Up Azure Authentication

```bash
az login
az account set --subscription "your-subscription-id"
```

### 3. Deploy AKS Cluster with Terraform

```bash
cd terraform
terraform init
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

### 4. Configure kubectl to Connect to Your AKS Cluster

```bash
az aks get-credentials --resource-group aks-assignment-rg --name my-aks-cluster
kubectl get nodes
```

### 5. Prepare Your Custom Web Content

```bash
kubectl create configmap nginx-index-html-configmap --from-file=index.html=./myweb/index.html
```

### 6. Deploy the Web Application

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl get deployments
kubectl get pods
kubectl get service nginx-service --watch
```

### 7. Access Your Web Application

Once the external IP is provisioned:

```
http://172.179.122.42/
```

## 🔍 Terraform Configuration Details

- **providers.tf**: Azure provider setup
- **variables.tf**: Customizable variables
- **main.tf**: AKS and resource group config
- **outputs.tf**: Output variables like kube config

## 🧩 Kubernetes Resources Explained

- **nginx-deployment.yaml**: 2 replicas, resource limits, volume mounts
- **nginx-service.yaml**: LoadBalancer service on port 80
- **deployment.yaml**: Echo server example
- **service.yaml**: Echo server service

## 🛠️ Advanced Configuration Options

### Scaling Your Application

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

### Updating Your Web Content

```bash
nano ./myweb/index.html
kubectl create configmap nginx-index-html-configmap --from-file=index.html=./myweb/index.html -o yaml --dry-run=client | kubectl apply -f -
kubectl rollout restart deployment nginx-deployment
```

## 🔥 Troubleshooting Tips

- **Version issues**: Let Azure choose AKS version
- **No external IP**: Check quota/network with:
  ```bash
  kubectl describe service nginx-service
  ```
- **Pod issues**: Use logs:
  ```bash
  kubectl get pods
  kubectl logs <pod-name>
  ```
- **ConfigMap not applying**: Restart deployment:
  ```bash
  kubectl rollout restart deployment nginx-deployment
  ```

## 🧹 Cleanup Resources

```bash
kubectl delete service nginx-service
kubectl delete deployment nginx-deployment
kubectl delete configmap nginx-index-html-configmap
cd terraform
terraform destroy -auto-approve
```

## 🚀 Live Demo


[http://172.179.122.42/](http://172.179.122.42/)

![My Web](https://github.com/user-attachments/assets/84ecf0f7-1af8-475b-9e1b-dbfdc9804337)

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file.

## 🤝 Contributing

Contributions are welcome! Feel free to submit a Pull Request.

---

⭐ If you find this project helpful, please give it a star on GitHub! ⭐
