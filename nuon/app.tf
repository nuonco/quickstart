resource "nuon_app" "example" {
  name   = "Example App"
  org_id = data.nuon_org.nuon.id
}
