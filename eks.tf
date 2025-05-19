module "eks" {
  #source = "terraform-aws-modules/eks/aws"
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-eks.git?ref=37e3348dffe06ea4b9adf9b54512e4efdb46f425" # version 20.36.0
  #version         = "~> 20.31"
  cluster_name    = "eks-automode"
  cluster_version = "1.31"
  # Optional
  cluster_endpoint_public_access = true
  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = merge(
    var.common_tags,
    {
    }
  )
}
