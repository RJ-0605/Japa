# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster
resource "google_container_cluster" "primary" {
  name                     = var.google_container_cluster_primary.name
  location                 = var.google_container_cluster_primary.location
  remove_default_node_pool = var.google_container_cluster_primary.remove_default_node_pool
  initial_node_count       = var.google_container_cluster_primary.initial_node_count
  network                  = google_compute_network.main.self_link
  subnetwork               = google_compute_subnetwork.private.self_link
  logging_service          = var.google_container_cluster_primary.logging_service
  monitoring_service       = var.google_container_cluster_primary.monitoring_service
  networking_mode          = var.google_container_cluster_primary.networking_mode

  # Optional, if you want multi-zonal cluster
#   node_locations = [
#     "us-central1-b"
#   ]
    node_config {
        service_account = google_service_account.kp-service-account.email
        oauth_scopes = [
            "https://www.googleapis.com/auth/cloud-platform"
        ]
    }

  addons_config {
    http_load_balancing {
      disabled = var.google_addons_config_http_load_balancing.disabled
    }
    horizontal_pod_autoscaling {
      disabled = var.google_addons_config_http_load_balancing.disabled
    }
  }

  release_channel {
    channel = var.google_cluster_release_channel.channel
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = var.g_subnetwork_ip_range_pod.range_name
    services_secondary_range_name = var.g_subnetwork_ip_range_service.range_name
  }

  private_cluster_config {
    enable_private_nodes    = var.google_private_cluster_config.enable_private_nodes
    enable_private_endpoint = var.google_private_cluster_config.enable_private_endpoint
    master_ipv4_cidr_block  = var.google_private_cluster_config.master_ipv4_cidr_block
  }

    lifecycle {
        ignore_changes = [ master_auth, network ]
    }


# resource "null_resource" "mygcloudconfig1" {
#   provisioner "local-exec" {
#     command = "gcloud container clusters get-credentials ${module.gke.name} --region us-central1 --project awinteck-solutions-a"
  
#   }
  
# }

# resource "null_resource" "myhelm1" {
#   provisioner "local-exec" {
#     command = "chmod +x helm_install.sh && ./helm_install.sh"
#   }
# }

# resource "null_resource" "updatemydeploy16" {
#   provisioner "local-exec" {
#     command = "chmod +x update-deploy.sh && ./update-deploy.sh"
#   }
# }

# resource "null_resource" "mydeploy19" {
#   provisioner "local-exec" {
#     command = "chmod +x deploy_argo.sh && ./deploy_argo.sh"
#   }
# }





  #   Jenkins use case
  #   master_authorized_networks_config {
  #     cidr_blocks {
  #       cidr_block   = "10.0.0.0/18"
  #       display_name = "private-subnet-w-jenkins"
  #     }
  #   }
}