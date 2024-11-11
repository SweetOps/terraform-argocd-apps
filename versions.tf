terraform {
  required_version = ">= 1.3"

  required_providers {
    argocd = {
      source  = "argoproj-labs/argocd"
      version = ">= 7"
    }
  }
}

