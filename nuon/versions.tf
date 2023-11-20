terraform {
  required_version = ">= 1.3.7"

  required_providers {
    nuon = {
      source  = "nuonco/nuon"
      version = ">= 0.4.3"
    }
  }
}

provider "nuon" {}
