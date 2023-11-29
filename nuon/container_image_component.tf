resource "nuon_container_image_component" "public_image" {
  name   = "public_image"
  app_id = nuon_app.example.id

  public = {
    image_url = "kennethreitz/httpbin"
    tag       = "latest"
  }
}
