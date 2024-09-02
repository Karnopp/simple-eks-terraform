variable "project_name" {
  type        = string
  description = "Name project to be used in name resources (tag name)"
}

variable "priv_subnet_a" {
  type        = string
  description = "subnet AZ a"
}

variable "priv_subnet_b" {
  type        = string
  description = "subnet AZ b"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name to create MNG"
}