data "http" "sandbox_trust_policy" {
  url = "${local.artifact_base_url}/${chomp(data.http.sandbox_version.response_body)}/trust.json"
}

module "install_access" {
  tags        = local.default_tags
  source      = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version     = ">= 5.1.0"
  create_role = true
  role_name   = "${var.app_name}-install-access"

  allow_self_assume_role          = true
  create_custom_role_trust_policy = true
  custom_role_trust_policy        = data.http.sandbox_trust_policy.response_body
  custom_role_policy_arns = [
    aws_iam_policy.deprovision.arn,
    aws_iam_policy.provision.arn
  ]
}
