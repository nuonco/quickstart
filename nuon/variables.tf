variable "org_id" {
  type        = string
  description = "your nuon organization"
}

variable "example_app_id" {
  type        = string
  description = "id of the example app you created while signing up"
}

variable "api_auth_token" {
  type        = string
  description = "your nuon api auth token"
}

variable "customer_one_install_access_role" {
  type        = string
  description = "the IAM role that provides access to manage a sandbox for customer one"
}

variable "customer_two_install_access_role" {
  type        = string
  description = "the IAM role that provides access to manage a sandbox for customer two"
}
