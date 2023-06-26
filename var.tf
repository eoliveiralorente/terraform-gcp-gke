variable "cluster_name" {
    type        = string
    description = "The name of the cluster (required)"
    default     = "teste-dasa-deletar"
}

variable "project_id" {
    type        = string
    description = "The project ID to host the cluster in (required)"
    default     = "our-signal-391015"
}

variable "location" {
    type        = string
    description = "Cluster location (required)"
    default     = "us-central1"
}

variable "remove_default_node_pool" {
    type        = bool
    description = "(Optional) The number of nodes to create in this cluster's default node pool."
    default     = true
}

variable "initial_default_node_pool_count" {
    type        = number
    description = "(Optional) The number of nodes to create in this cluster's default node pool."
    default =   1
}

variable "default_node_locations" {
    type        = list(string)
    description = "The list of zones in which the node pool's nodes should be located."
    default = [ "us-central1" ]
}

variable "description" {
    type        = string
    description = "(Optional) Description of the cluster."
    default = "null"
}

variable "default_max_pods_per_node" {
    type        = number
    description = "(Optional) The default maximum number of pods per node in this cluster."
    default     = 110
}

variable "min_master_version" {
    type        = string
    description = "The minimum version of the master."
    default     = "latest"
}

variable "network" {
    type        = string
    description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
    default     = "default"
}


variable "subnetwork" {
    type        = string
    description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
    default     = "default"
}

variable "cluster_secondary_range_name" {
    type        = string
    description = "cluster_secondary_range_name"
    default     = "teste-pods"
}

variable "services_secondary_range_name" {
    type        = string
    description = "services_secondary_range_name"
    default     = "teste-servicos"
}

variable "http_load_balancing-disabled" {
    type        = bool
    description = "(Optional) The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster."
    default     = true
}

variable "horizontal_pod_autoscaling-disabled" {
    type        = bool
    description = "(Optional) The status of the Horizontal Pod Autoscaling addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods."
    default     = false
}

variable "private_cluster" {
    type        = bool
    description = "(Optional) Enables the private cluster feature, creating a private endpoint on the cluster. In a private cluster, nodes only have RFC 1918 private addresses and communicate with the master's private endpoint via private networking."
    default     = true
}

variable "private_ips_cluster" {
    type        = string
    description = "(Optional) The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning private IP addresses to the cluster master(s) and the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network, and it must be a /28 subnet. See Private Cluster Limitations for more details. This field only applies to private clusters, when enable_private_nodes is true"
    default     = "172.16.100.0/28"
}

variable "workload_identity" {
    type        = bool
    description = "Enable or disable workload_identity_config GKE"
    default     = false
}

variable "start_time" {
    type        = string
    default     = "2023-06-26T09:00:00Z"
}

variable "end_time" {
    type        = string
    default     = "2040-01-01T17:00:00Z"
}

variable "recurrence" {
    type        = string
    default     = "FREQ=WEEKLY;BYDAY=SA,SU"
}

/**********************************
   Node Pools
 *********************************/

variable "nodepools" {
  type        = list(map(string))
  description = "The list of nodepools being created"
  default = [ 
      {
        nodepool_name         = "da-nodepool-dasa"
        nodepool_location     = "us-central1"
        initial_node_count    = 3
        version               = "1.22.6-gke.1000"
        min_node_count        = 1
        max_node_count        = 5
        preemptible           = true
        machine_type          = "e2-medium"
    },
  ]
}

variable "node_locations" {
    type        = list(string)
    description = "The list of zones in which the node pool's nodes should be located."
    default = [ "us-central1" ]
}

variable "max_surge"{
    type        = number
    description = "(Required) The number of additional nodes that can be added to the node pool during an upgrade"
    default = 1
}

variable "max_unavailable"{
    type        = number
    description = "(Required) The number of nodes that can be simultaneously unavailable during an upgrade. "
    default = 1
}

variable "service_account" {
    type        = string
    description = "Service account used by nodes"
    default = ""
}

# variable "cidr_blocks_authorized_networks" {
#     type        = string
#     description = "External network that can access Kubernetes master through HTTPS. Must be specified in CIDR notation."
# }