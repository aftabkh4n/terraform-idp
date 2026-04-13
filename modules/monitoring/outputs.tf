output "grafana_url" {
  value = "http://localhost:32000"
}

output "grafana_password" {
  value     = "admin123"
  sensitive = true
}