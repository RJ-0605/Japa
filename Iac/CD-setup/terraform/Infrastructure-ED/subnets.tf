# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private" {
  name                     = var.google_compute_subnetwork_data.name
  ip_cidr_range            = var.google_compute_subnetwork_data.ip_cidr_range
  region                   = var.google_compute_subnetwork_data.region
  network                  = google_compute_network.main.id
  private_ip_google_access = var.google_compute_subnetwork_data.private_ip_google_access

  secondary_ip_range {
    range_name    = var.g_subnetwork_ip_range_pod.range_name
    ip_cidr_range = var.g_subnetwork_ip_range_pod.ip_cidr_range
  }
  secondary_ip_range {
    range_name    = var.g_subnetwork_ip_range_service.range_name
    ip_cidr_range = var.g_subnetwork_ip_range_service.ip_cidr_range
  }
}