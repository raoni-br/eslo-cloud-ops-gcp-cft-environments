resource "google_monitoring_custom_service" "monitor_services"{
  for_each = var.services

  project   = var.monitoring_project_id
  service_id   = each.key
  display_name = each.value
}
