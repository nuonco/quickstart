resource "nuon_docker_build_component" "dockerfile" {
  name   = "dockerfile"
  app_id = nuon_app.example.id

  dockerfile = "Dockerfile"
  public_repo = {
    directory = "example/docker"
    repo      = var.example_app_repo
    branch    = "main"
  }
}
