# Terraform IDP Infrastructure

Complete local infrastructure provisioned with Terraform using a single command.

## What it provisions

- PostgreSQL 16 in Docker with networking
- Kubernetes namespace, deployment, service, and ingress for the IDP platform
- Prometheus + Grafana monitoring stack via Helm

## Stack

| Tool | Purpose |
|---|---|
| Terraform | Infrastructure as code |
| Docker | PostgreSQL container |
| Kubernetes | App deployment and orchestration |
| Helm | Prometheus + Grafana installation |
| Grafana | Metrics dashboard |
| Prometheus | Metrics collection |

## Running

Prerequisites: Docker Desktop with Kubernetes enabled, Terraform, Helm

```bash
# Add Helm repos
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Copy config
cp terraform.tfvars.example terraform.tfvars

# Provision everything
terraform init
terraform apply

# Access Grafana
kubectl port-forward -n monitoring service/prometheus-stack-grafana 3000:80
# Open http://localhost:3000 - admin / admin123
```

## Tear down

```bash
terraform destroy
```

Everything is removed cleanly. Re-apply anytime to recreate.

## Structure
TerraformIDP/
├── main.tf              # Root - wires all modules together
├── variables.tf         # Input variables
├── outputs.tf           # Outputs - URLs, connection strings
├── terraform.tfvars     # Your values (gitignored)
└── modules/
├── kubernetes/      # Namespace, deployment, service, ingress
├── postgres/        # PostgreSQL in Docker
└── monitoring/      # Prometheus + Grafana via Helm
