locals {
  nodepools = {
    for x in var.nodepools :
    "${x.nodepool_location}/${x.nodepool_name}" => x
  }
}

resource "google_container_node_pool" "node_pool" {
  for_each           = local.nodepools
  cluster            = var.cluster_name
  name               = each.value.nodepool_name
  location           = each.value.nodepool_location
  initial_node_count = each.value.initial_node_count
  node_locations     = var.node_locations 
  project            = var.project_id
  version            = each.value.version
    upgrade_settings   {
    max_surge       = var.max_surge
    max_unavailable = var.max_unavailable
  }
  autoscaling {
    min_node_count = each.value.min_node_count
    max_node_count = each.value.max_node_count
    
  } 
  node_config {
    preemptible     = each.value.preemptible
    machine_type    = each.value.machine_type
    service_account = var.service_account
    oauth_scopes    = var.oauth_scopes
  }
}