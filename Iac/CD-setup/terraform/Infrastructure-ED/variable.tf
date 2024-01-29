variable "project" {
  type = string
  description  = "my project id "
}

variable "region" {
  type = string
  description  = "my region"
}


variable "router"{
  type = string

}


variable "google_project_service_compute"{
  type = string
}

variable "google_project_service_container"{
  type = string
}

variable "vpc_google_compute_network"{

  type = object({
            name   = string
            routing_mode  = string
            auto_create_subnetworks = bool
            mtu     = number
            delete_default_routes_on_create = bool
        })
     
}



variable "google_compute_subnetwork_data"{

    type = object({
          name   = string
          ip_cidr_range = string
          region  = string
          private_ip_google_access = bool
  })

}

variable "g_subnetwork_ip_range_service"{
    type = object({
        range_name    = string
        ip_cidr_range = string
    })
}

variable "g_subnetwork_ip_range_pod"{
    type = object({
        range_name    = string
        ip_cidr_range = string
    })
}


variable "google_container_node_pool_general"{
   type = object({
       name = string
       node_count = number
   })
}


variable "google_container_node_pool_management"{
    type = object({
      auto_repair  = bool
      auto_upgrade = bool
    })
}

variable "google_container_node_pool_autoscaling"{
    type = object({
      min_node_count = number
      max_node_count = number
    })
}

variable "google_container_node_pool_node_config"{
    type = object({
      preemptible  = bool
      machine_type = string
      disk_size_gb = number
    })
}

variable "google_container_cluster_primary" {
  type =object({
      name                     = string
      location                 = string
      remove_default_node_pool = bool
      initial_node_count       = number
      logging_service          = string
      monitoring_service       = string
      networking_mode          = string
  })
}



variable "google_addons_config_http_load_balancing"{
      type =object({
        disabled = bool
        })
  }

variable "google_addons_config_horizontal_pod_autoscaling" {
    type =object({
        disabled = bool
        })
  }


variable "google_cluster_release_channel"{
    type =object({
          channel = string
          })
}

variable  "google_private_cluster_config"{
  type =object({
      enable_private_nodes    = bool
      enable_private_endpoint = bool
      master_ipv4_cidr_block  = string
    })
  }



    # ignore_changes = [ master_auth, network ]