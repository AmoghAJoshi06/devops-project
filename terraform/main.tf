provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "devops-eks-cluster"
  cluster_version = "1.27"
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }
}
