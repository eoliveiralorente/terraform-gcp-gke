variable "cluster_name" {
    type        = string
    description = "The name of the cluster (required)"
}

variable "project_id" {
    type        = string
    description = "The project ID to host the cluster in (required)"
}

variable "location" {
    type        = string
    description = "Cluster location (required)"
}

variable "remove_default_node_pool" {
    type        = bool
    description = "(Optional) The number of nodes to create in this cluster's default node pool."
}

variable "initial_default_node_pool_count" {
    type        = number
    description = "(Optional) The number of nodes to create in this cluster's default node pool."
}

variable "default_node_locations" {
    type        = list(string)
    description = "The list of zones in which the node pool's nodes should be located."
}

variable "description" {
    type        = string
    description = "(Optional) Description of the cluster."
}

variable "default_max_pods_per_node" {
    type        = number
    description = "(Optional) The default maximum number of pods per node in this cluster."
}

variable "min_master_version" {
    type        = string
    description = "The minimum version of the master."
}

variable "network" {
    type        = string
    description = "The name or self_link of the Google Compute Engine network to which the cluster is connected."
}


variable "subnetwork" {
    type        = string
    description = "The name or self_link of the Google Compute Engine subnetwork in which the cluster's instances are launched."
}

variable "cluster_secondary_range_name" {
    type        = string
    description = "cluster_secondary_range_name"
}

variable "services_secondary_range_name" {
    type        = string
    description = "services_secondary_range_name"
}

variable "http_load_balancing-disabled" {
    type        = bool
    description = "(Optional) The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster."
}

variable "horizontal_pod_autoscaling-disabled" {
    type        = bool
    description = "(Optional) The status of the Horizontal Pod Autoscaling addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods."
}

variable "private_cluster" {
    type        = bool
    description = "(Optional) Enables the private cluster feature, creating a private endpoint on the cluster. In a private cluster, nodes only have RFC 1918 private addresses and communicate with the master's private endpoint via private networking."
}

variable "private_ips_cluster" {
    type        = string
    description = "(Optional) The IP range in CIDR notation to use for the hosted master network. This range will be used for assigning private IP addresses to the cluster master(s) and the ILB VIP. This range must not overlap with any other ranges in use within the cluster's network, and it must be a /28 subnet. See Private Cluster Limitations for more details. This field only applies to private clusters, when enable_private_nodes is true"
}


variable "workload_identity" {
    type        = bool
    description = "Enable or disable workload_identity_config GKE"
    default     = false
}

# variable "cidr_blocks_authorized_networks" {
#     type        = string
#     description = "External network that can access Kubernetes master through HTTPS. Must be specified in CIDR notation."
# }

variable "start_time" {
    type        = string
    description = ""
}
variable "end_time" {
    type        = string
    description = ""
}
variable "recurrence" {
    type        = string
    description = ""
}

#variable "cidr_blocks_authorized_networks" {
#    type        = string
#    description = "External network that can access Kubernetes master through HTTPS. Must be specified in CIDR notation."
#}
