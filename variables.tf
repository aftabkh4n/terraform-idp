variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "idp-platform"
}

variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string
  default     = "idpuser"
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string
  default     = "idpdb"
}

variable "postgres_port" {
  description = "PostgreSQL port"
  type        = number
  default     = 5432
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "local"
}

variable "aws_region" {
  description = "AWS region for EKS cluster"
  type        = string
  default     = "eu-west-2"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "idp-demo"
}