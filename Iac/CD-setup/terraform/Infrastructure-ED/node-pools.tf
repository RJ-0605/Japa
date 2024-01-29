

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool
resource "google_container_node_pool" "general" {
  name       = var.google_container_node_pool_general.name
  cluster    = google_container_cluster.primary.id
  node_count = var.google_container_node_pool_general.node_count

  management {
    auto_repair  = var.google_container_node_pool_management.auto_repair
    auto_upgrade = var.google_container_node_pool_management.auto_upgrade
  } 

 autoscaling {
    min_node_count = var.google_container_node_pool_autoscaling.min_node_count
    max_node_count = var.google_container_node_pool_autoscaling.max_node_count
  }

  node_config {
    preemptible  = var.google_container_node_pool_node_config.preemptible
    machine_type = var.google_container_node_pool_node_config.machine_type
    disk_size_gb = var.google_container_node_pool_node_config.disk_size_gb

  labels = {
    role = "general"
  }

    service_account = google_service_account.kp-service-account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      # "https://www.googleapis.com/auth/logging.write",
      # "https://www.googleapis.com/auth/monitoring"
    ]
  }
}

# resource "google_container_node_pool" "spot" {
#   name    = "spot"
#   cluster = google_container_cluster.primary.id

#   management {
#     auto_repair  = true
#     auto_upgrade = true
#   }

  

#   node_config {
#     preemptible  = true
#     machine_type = "e2-standard-2"
    

#     labels = {
#       team = "devops"
#     }

#     taint {
#       key    = "instance_type"
#       value  = "spot"
#       effect = "NO_SCHEDULE"
#     }

#     service_account = google_service_account.kp-service-account.email
#     oauth_scopes = [
#       "https://www.googleapis.com/auth/cloud-platform"
#     ]
#   }
# }