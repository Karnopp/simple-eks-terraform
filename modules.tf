module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
}

module "eks_cluster" {
  source       = "./modules/cluster"
  project_name = var.project_name
  pub_subnet_a = module.eks_network.subnet_pub_a
  pub_subnet_b = module.eks_network.subnet_pub_b
  version_eks  = var.version_eks
}

module "eks_managed_node_group" {
  source        = "./modules/managed-node-group"
  project_name  = var.project_name
  cluster_name  = module.eks_cluster.cluster_name
  priv_subnet_a = module.eks_network.subnet_priv_a
  priv_subnet_b = module.eks_network.subnet_priv_b
}

module "eks_load-balancer-controller" {
  source       = "./modules/load-balancer-controller"
  project_name = var.project_name
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}