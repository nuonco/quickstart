data "http" "sandbox_provision_policy" {
  url = "${local.artifact_base_url}/${chomp(data.http.sandbox_version.response_body)}/provision.json"
}

resource "aws_iam_policy" "provision" {
  tags        = local.default_tags
  name        = "${var.app_name}-provision"
  path        = "/"
  description = "Provides access to provision a new install of ${var.app_name}"
  policy      = data.http.sandbox_provision_policy.response_body
}

data "http" "sandbox_deprovision_policy" {
  url = "${local.artifact_base_url}/${chomp(data.http.sandbox_version.response_body)}/deprovision.json"
}

resource "aws_iam_policy" "deprovision" {
  tags        = local.default_tags
  name        = "${var.app_name}-deprovision"
  path        = "/"
  description = "Provides access to deprovision an install  of ${var.app_name}"
  policy      = data.http.sandbox_deprovision_policy.response_body
}
