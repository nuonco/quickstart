variable "app_id" {
  type        = string
  description = "ID of the app to be installed."
}

variable "trusted_principal" {
  type        = string
  description = "The AWS IAM principal that will assume the bootstrap role and provision the install."
}

locals {
  default_tags = {
    app_id = var.app_id
  }
}
