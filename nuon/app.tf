resource "nuon_app" "example" {
  name = "quickstart_test_app"
}

resource "nuon_app_sandbox" "main" {
  app_id            = nuon_app.example.id
  terraform_version = "v1.6.3"

  public_repo = {
    repo      = "nuonco/sandboxes"
    branch    = "main"
    directory = "aws-eks"
  }

  input {
    name  = "eks_version"
    value = "v1.27.8"
  }
}
