terraform {
  required_version = ">= 1.3.7"

  required_providers {
    nuon = {
      source  = "terraform.local/local/nuon"
      version = "0.0.1"
    }
  }
}

provider "nuon" {
  api_url = "https://api.prod.nuon.co/graphql"
}
