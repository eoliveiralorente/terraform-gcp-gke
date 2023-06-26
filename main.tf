module "cluster" {
  source = "./modules/cluster"
  cluster_name                        = var.cluster_name
  project_id                          = var.project_id
  location                            = var.location
  remove_default_node_pool            = var.remove_default_node_pool
  initial_default_node_pool_count     = var.initial_default_node_pool_count
  default_node_locations              = var.default_node_locations
  description                         = var.description
  private_cluster                     = var.private_cluster
  private_ips_cluster                 = var.private_ips_cluster
  default_max_pods_per_node           = var.default_max_pods_per_node
  min_master_version                  = var.min_master_version
  network                             = var.network
  subnetwork                          = var.subnetwork
  workload_identity                   = var.workload_identity
  cluster_secondary_range_name        = var.cluster_secondary_range_name
  services_secondary_range_name       = var.services_secondary_range_name
  http_load_balancing-disabled        = var.http_load_balancing-disabled
  horizontal_pod_autoscaling-disabled = var.horizontal_pod_autoscaling-disabled
  start_time                          = var.start_time
  end_time                            = var.end_time
  recurrence                          = var.recurrence
}

module "nodepool" {
  source              = "./modules/nodepool"
  project_id          = var.project_id
  cluster_name        = module.cluster.cluster_id
  nodepools           = var.nodepools
  node_locations      = var.node_locations
  max_surge           = var.max_surge
  max_unavailable     = var.max_unavailable
  service_account     = var.service_account
  oauth_scopes        = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  depends_on   = [module.cluster]
}
