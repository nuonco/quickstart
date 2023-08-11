resource "nuon_docker_build_component" "example" {
  name   = "Example"
  app_id = nuon_app.example.id

  dockerfile = "Dockerfile"
  connected_repo = {
    directory = "example/docker"
    repo      = data.nuon_connected_repo.customer_noteable.name
    branch    = "main"
  }

  sync_only = true
}
