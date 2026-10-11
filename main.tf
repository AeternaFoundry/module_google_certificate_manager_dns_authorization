resource "google_certificate_manager_dns_authorization" "certificate_manager_dns_authorizations" {
  for_each = var.certificate_manager_dns_authorizations

  domain          = each.value.domain
  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  location        = each.value.location
  project         = each.value.project
  type            = each.value.type

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

