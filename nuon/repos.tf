data "nuon_connected_repo" "customer_noteable" {
  org_id = data.nuon_org.nuon.id
  name   = "powertoolsdev/customer-noteable"
}
