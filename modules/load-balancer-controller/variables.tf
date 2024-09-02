variable "project_name" {
  type        = string
  description = "Name project to be used in name resources (tag name)"
}

variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name to create MNG"
}