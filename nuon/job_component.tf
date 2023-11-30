# Using a public image.
resource "nuon_job_component" "kubectl_job" {
  name      = "kubectl_job"
  app_id    = nuon_app.example.id
  image_url = "bitnami/kubectl"
  tag       = "latest"
  cmd       = ["kubectl"]
  args      = ["get", "pods"]
}

# Using a custom image:

# Sync your image to each install's ECR
resource "nuon_docker_build_component" "custom_job_image" {
  name   = "custom_job_image"
  app_id = nuon_app.example.id

  dockerfile = "Dockerfile.custom_job"
  public_repo = {
    directory = "example/jobs"
    repo      = var.example_app_repo
    branch    = "main"
  }
}

# Run the image a k8s job workload.
resource "nuon_job_component" "custom_job" {
  name      = "custom_job"
  app_id    = nuon_app.example.id
  image_url = "{{.nuon.components.custom_job_image.image.repository.uri}}"
  tag       = "{{.nuon.components.custom_job_image.image.tag}}"
  cmd       = [""]
  args      = [""]

  env_var {
    name  = "NUON_INSTALL_ID"
    value = "{{.nuon.install.id}}"
  }
}
