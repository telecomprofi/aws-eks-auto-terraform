provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Terraform  = "true"
      GithubRepo = "telecomprofi-aws-eks-auto-terraform"
      GithubPath = "envs/:${basename(path.cwd)}"
    }
  }
}

provider "kubectl" {
  host                   = module.eks.cluster_endpoint
  load_config_file       = false
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}


# Configure TF Providers and backend for storing a state
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubectl = {
      source  = "bnu0/kubectl"
      version = "0.27.0"
    }
  }
  # backend "local" {}
}

