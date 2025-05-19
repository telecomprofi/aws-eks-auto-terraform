This stack creates VPC with NAT GW and insecure AWS EKS cluster in auto mode
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | 0.27.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.98.0 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 0.27.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks"></a> [eks](#module\_eks) | git::https://github.com/terraform-aws-modules/terraform-aws-eks.git | 37e3348dffe06ea4b9adf9b54512e4efdb46f425 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git | 7c1f791efd61f326ed6102d564d1a65d1eceedf0 |

## Resources

| Name | Type |
|------|------|
| [kubectl_manifest.ingress_class](https://registry.terraform.io/providers/bnu0/kubectl/0.27.0/docs/resources/manifest) | resource |
| [kubectl_manifest.ingress_class_params](https://registry.terraform.io/providers/bnu0/kubectl/0.27.0/docs/resources/manifest) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster_auth.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common tags to apply to all resources | `map(string)` | <pre>{<br/>  "CostCentre": "CostCentreExample",<br/>  "Environment": "dev",<br/>  "Owner": "telecomprofi",<br/>  "Project": "eks-auto-example"<br/>}</pre> | no |

## Outputs

No outputs.
