variable "project_id" {
    type        = string
    description = "The ID of the project in which to create the node pool."
}

variable "cluster_name" {
    type        = string
    description = "(Required) The cluster to create the node pool for. Cluster must be present in location provided for zonal clusters. "
}

variable "nodepools" {
  type        = list(map(string))
  description = "The list of nodepools being created"
}

variable "node_locations" {
    type        = list(string)
    description = "The list of zones in which the node pool's nodes should be located."
}

variable "max_surge"{
    type        = number
    description = "(Required) The number of additional nodes that can be added to the node pool during an upgrade"
}

variable "max_unavailable"{
    type        = number
    description = "(Required) The number of nodes that can be simultaneously unavailable during an upgrade. "
}

variable "service_account" {
    type        = string
    description = "Service account used by nodes"
}
variable "oauth_scopes" {
  type        = list(string)
}