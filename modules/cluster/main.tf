resource "google_container_cluster" "primary" {
  name                      = var.cluster_name
  project                   = var.project_id
  location                  = var.location
  remove_default_node_pool  = var.remove_default_node_pool
  initial_node_count        = var.initial_default_node_pool_count
  node_locations            = var.default_node_locations
  description               = var.description
  default_max_pods_per_node = var.default_max_pods_per_node
  min_master_version        = var.min_master_version
  network                   = var.network
  subnetwork                = var.subnetwork
  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster_secondary_range_name
    services_secondary_range_name = var.services_secondary_range_name
  }

  maintenance_policy {
    recurring_window {
      start_time = var.start_time
      end_time = var.end_time
      recurrence = var.recurrence
  }
}
  addons_config {
  http_load_balancing {
    disabled = var.http_load_balancing-disabled
  }

  horizontal_pod_autoscaling {
    disabled = var.horizontal_pod_autoscaling-disabled
  }
}
  private_cluster_config {
    enable_private_nodes    = var.private_cluster
    enable_private_endpoint = false
    master_ipv4_cidr_block  = var.private_ips_cluster
    
    master_global_access_config {
      enabled = true
    }

  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  # master_authorized_networks_config {
  #   cidr_blocks {
  #     cidr_block = var.cidr_blocks_authorized_networks
  #   }
  # }

}