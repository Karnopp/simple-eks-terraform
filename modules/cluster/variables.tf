variable "project_name" {
  type        = string
  description = "Name project to be used in name resources (tag name)"
}

variable "pub_subnet_a" {
  type        = string
  description = "subnet to create EKS cluster AZ a"
}

variable "pub_subnet_b" {
  type        = string
  description = "subnet to create EKS cluster AZ b"
}

variable "version_eks" {
  type        = string
  description = "version to be used in eks"
}