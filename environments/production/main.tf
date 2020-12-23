resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  env                    = "prod"
  cluster_type           = "${var.project_id}-${local.env}"
  network_name           = "${var.project_id}-${local.env}-network-${random_string.suffix.result}"
  subnet_name            = "${var.project_id}-${local.env}-subnet"
  master_auth_subnetwork = "${var.project_id}-${local.env}-master-subnet"
  pods_range_name        = "ip-range-pods-${random_string.suffix.result}"
  svc_range_name         = "ip-range-svc-${random_string.suffix.result}"
}

provider "google" {
  version = "~> 3.42.0"
  # project = var.project_id
  # region  = var.region
}

provider "google-beta" {
  version = "~> 3.42.0"
}

module "gke" {
  source                  = "../../modules/safer-cluster/"
  project_id              = var.project_id
  name                    = "${local.cluster_type}-${random_string.suffix.result}"
  regional                = false
  region                  = var.region
  zones                   = var.location
  enable_private_endpoint = false
  network                 = module.gcp-network.network_name
  subnetwork              = module.gcp-network.subnets_names[index(module.gcp-network.subnets_names, local.subnet_name)]
  ip_range_pods           = local.pods_range_name
  ip_range_services       = local.svc_range_name
  # compute_engine_service_account = var.compute_engine_service_account
  master_ipv4_cidr_block     = "172.16.0.0/28"
  add_cluster_firewall_rules = false
  firewall_inbound_ports     = ["9443", "15017"]
  logging_service            = "none"
  monitoring_service         = "none"
  master_authorized_networks = [
    {
      cidr_block   = "10.60.0.0/17"
      display_name = "VPC"
    },
  ]
  # notification_config_topic = google_pubsub_topic.updates.id

}

# module "redis" {
#   source     = "../../modules/redis"
#   location   = "us-west1-a"
#   network    = module.gcp-network.network_name
#   instance_name = "redis"
#   memory_size_gb = 1
#   depends_on = [google_service_networking_connection.private_vpc_connection]
# }

