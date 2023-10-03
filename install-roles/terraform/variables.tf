variable "app_name" {
  type        = string
  description = "Name of the app to be installed."
}

locals {
  default_tags = {
    app_name = var.app_name
  }

  artifact_base_url = "https://nuon-artifacts.s3.us-west-2.amazonaws.com/sandbox/aws-eks"
}

data "http" "sandbox_version" {
  url = "${local.artifact_base_url}/latest.txt"
}
