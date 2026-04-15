output "postgres_host" {
  description = "PostgreSQL host"
  value       = module.postgres.postgres_host
}

output "postgres_connection_string" {
  description = "Full PostgreSQL connection string"
  value       = "Host=${module.postgres.postgres_host};Port=${var.postgres_port};Database=${var.postgres_db};Username=${var.postgres_user};Password=${var.postgres_password}"
  sensitive   = true
}

output "kubernetes_namespace" {
  description = "Kubernetes namespace for the app"
  value       = module.kubernetes.namespace
}

output "grafana_url" {
  description = "Grafana dashboard URL"
  value       = module.monitoring.grafana_url
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_kubeconfig_command" {
  description = "Command to configure kubectl for EKS"
  value       = module.eks.kubeconfig_command
}