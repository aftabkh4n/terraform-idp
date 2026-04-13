terraform {
  required_version = ">= 1.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Connect to local Kubernetes (Docker Desktop)
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "docker-desktop"
}

# Helm for installing charts (Prometheus, Grafana)
provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "docker-desktop"
  }
}

# Docker provider for local containers
provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

# PostgreSQL module
module "postgres" {
  source = "./modules/postgres"

  postgres_password = var.postgres_password
  postgres_user     = var.postgres_user
  postgres_db       = var.postgres_db
  postgres_port     = var.postgres_port
}

# Kubernetes namespaces and base config
module "kubernetes" {
  source = "./modules/kubernetes"

  app_name      = var.app_name
  postgres_host = module.postgres.postgres_host
  postgres_port = var.postgres_port
  postgres_user = var.postgres_user
  postgres_db   = var.postgres_db

  depends_on = [module.postgres]
}

# Monitoring stack
module "monitoring" {
  source = "./modules/monitoring"

  depends_on = [module.kubernetes]
}