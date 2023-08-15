variable "app_id" {
  type        = string
  description = "ID of the app to be installed."
}

locals {
  default_tags = {
    app_id = var.app_id
  }
}
