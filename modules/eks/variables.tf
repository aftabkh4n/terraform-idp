variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "idp-demo"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-2"
}