resource "nuon_terraform_module_component" "example" {
  name   = "example"
  app_id = nuon_app.example.id

  connected_repo = {
    directory = "example/terraform"
    repo      = data.nuon_connected_repo.customer_noteable.name
    branch    = "main"
  }

  var {
    name  = "install_id"
    value = "{{.nuon.install.id}}"
  }
  var {
    name  = "region"
    value = "{{.nuon.install.sandbox.outputs.account.region}}"
  }

  var {
    name  = "public_domain"
    value = "{{.nuon.install.public_domain}}"
  }

  var {
    name  = "public_domain_zone_id"
    value = "{{.nuon.install.sandbox.outputs.public_domain.zone_id}}"
  }
}
