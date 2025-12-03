deployment "simple" {
  inputs = {
    length    = "2"
    separator = "-"
  }
}

publish_output "clusters" {
  description = "the clusters value"
  value       = deployment.simple.clusters
}
