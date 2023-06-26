output "cluster_id" {
  description = "Cluster ID"
  value       = google_container_cluster.primary.id
}

output "location" {
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
  value       = google_container_cluster.primary.location
}

output "endpoint" {
  description = "The server-defined URL for the resource"
  value       = google_container_cluster.primary.endpoint
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster"
  value       = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)
}
