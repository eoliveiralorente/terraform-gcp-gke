output "cluster_id" {
  description = "Cluster ID"
  value       = module.cluster.cluster_id
}

output "host" {
  description = "The server-defined URL for the resource"
  value       = local.host
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public certificate that is the root certificate of the cluster"
  value       = module.cluster.cluster_ca_certificate
}
