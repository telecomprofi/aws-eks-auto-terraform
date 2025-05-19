variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    CostCentre  = "CostCentreExample"
    Project     = "eks-auto-example"
    Owner       = "telecomprofi"
    Environment = "dev"
  }
}
