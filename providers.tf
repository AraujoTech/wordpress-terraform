terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "kubernetes" {
  config_path            = "~/.kube/config"
  config_context         = "minikube"
  config_context_cluster = "minikube"
}

provider "helm" {
  kubernetes {
    config_path            = "~/.kube/config"
    config_context         = "minikube"
    config_context_cluster = "minikube"
  }
} 