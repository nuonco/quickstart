resource "nuon_docker_build_component" "example" {
  name   = "Example"
  app_id = nuon_app.example.id

  dockerfile = "Dockerfile"
  connected_repo = {
    directory = "example/docker"
    repo      = var.example_app_repo
    branch    = "main"
  }

  sync_only = true
}
