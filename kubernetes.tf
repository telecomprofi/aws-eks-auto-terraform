resource "kubectl_manifest" "ingress_class_params" {
  depends_on = [module.eks]
  yaml_body = jsonencode({
    apiVersion = "eks.amazonaws.com/v1"
    kind       = "IngressClassParams"
    metadata = {
      name = "eks-auto-alb"
    }
    spec = {
      scheme = "internet-facing"
      group = {
        name = "myapp" /// uses for same ALB for multiple services
      }
    }

  })
}

resource "kubectl_manifest" "ingress_class" {
  depends_on = [module.eks]
  yaml_body = jsonencode({
    apiVersion = "networking.k8s.io/v1"
    kind       = "IngressClass"
    metadata = {
      name = "eks-auto-alb"
    }
    annotations = {
      "alb.ingress.kubernetes.io/group.name" = "myapp"
    }
    spec = {
      controller = "eks.amazonaws.com/alb"
      parameters = {
        apiGroup = "eks.amazonaws.com"
        kind     = "IngressClassParams"
        name     = "eks-auto-alb"
      }
    }
  })
}
