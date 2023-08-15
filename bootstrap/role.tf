resource "aws_iam_role" "bootstrap" {
  tags = local.default_tags
  name = "bootstrap"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "${var.trusted_principal}"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "provision" {
  role       = aws_iam_role.bootstrap.name
  policy_arn = aws_iam_policy.provision.arn
}

resource "aws_iam_role_policy_attachment" "update" {
  role       = aws_iam_role.bootstrap.name
  policy_arn = aws_iam_policy.update.arn
}

resource "aws_iam_role_policy_attachment" "deprovision" {
  role       = aws_iam_role.bootstrap.name
  policy_arn = aws_iam_policy.deprovision.arn
}
