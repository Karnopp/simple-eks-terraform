variable "cidr_block" {
  type        = string
  description = "Network CIDR block to be used for the VPC"
}

variable "project_name" {
  type        = string
  description = "Name project to be used in name resources (tag name)"
}

variable "version_eks" {
  type        = string
  description = "version to be used in eks"
}

variable "region" {
  type        = string
  description = "AWS regioon to create the resources"
}