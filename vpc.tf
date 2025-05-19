module "vpc" {
  # source  = "terraform-aws-modules/vpc/aws"
  # version = "~> 5.21.0"
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=7c1f791efd61f326ed6102d564d1a65d1eceedf0" # commit hash of version 5.21.0"
  name   = "eks-vpc1"
  cidr   = "10.104.0.0/16"

  azs                    = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets        = ["10.104.1.0/24", "10.104.2.0/24", "10.104.3.0/24"]
  public_subnets         = ["10.104.101.0/24", "10.104.102.0/24", "10.104.103.0/24"]
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
  tags = merge(
    var.common_tags,
    {
    }
  )
}
