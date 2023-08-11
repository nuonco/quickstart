resource "nuon_container_image_component" "httpbin" {
  name   = "httpbin"
  app_id = nuon_app.example.id

  public = {
    image_url = "kennethreitz/httpbin"
    tag       = "latest"
  }

  sync_only = true
}
