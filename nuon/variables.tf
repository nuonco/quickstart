variable "example_app_repo" {
  type        = string
  description = "github path of the repo the example app's code is in"
}

variable "install_count" {
  type        = number
  description = "number of installs to create and manage with terraform"
}

variable "install_region" {
  type        = string
  description = "region to create installs in"
  default     = "us-west-2"
}

variable "install_iam_role_arn" {
  type        = string
  description = "iam role arn to use for install access"
  default     = ""
}
