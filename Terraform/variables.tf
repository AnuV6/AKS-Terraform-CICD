variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "aks-assignment-rg"
}

variable "location" {
  description = "Azure region for resources"
  default     = "westus2"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  default     = "my-aks-cluster"
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  default     = "1.32.0"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  default     = 2
}

variable "vm_size" {
  description = "Size of the VMs"
  default     = "Standard_D2_v2"
}