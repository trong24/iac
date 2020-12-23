resource "google_redis_instance" "redis" {
  name               = var.instance_name
  memory_size_gb     = var.memory_size_gb
  location_id        = var.location
  tier               = var.tier
  authorized_network = var.network
  redis_version      = var.redis_version
}