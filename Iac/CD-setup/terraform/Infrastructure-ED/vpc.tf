# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_service
resource "google_project_service" "compute" {
  service = var.google_project_service_compute
}

resource "google_project_service" "container" {
  service = var.google_project_service_container
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                            = var.vpc_google_compute_network.name
  routing_mode                    = var.vpc_google_compute_network.routing_mode
  auto_create_subnetworks         = var.vpc_google_compute_network.auto_create_subnetworks
  mtu                             = var.vpc_google_compute_network.mtu
  delete_default_routes_on_create = var.vpc_google_compute_network.delete_default_routes_on_create

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}