
resource "ibm_container_cluster" "roks_cluster" {
    name            = "${var.prefix}-roks"
    datacenter      = "dal10"
    machine_type    = var.machine_type
    hardware        = "shared"

    kube_version = var.roks_version

    default_pool_size = var.default_pool_size
        
    public_service_endpoint  = "true"

    resource_group_id = var.resource_group
}

# enable multi-zone

# resource "ibm_container_worker_pool_zone_attachment" "dal12" {
# cluster         = ibm_container_cluster.roks_cluster.id
# worker_pool     = ibm_container_cluster.roks_cluster.worker_pools.0.id
# zone            = "dal12"
# resource_group_id = var.resource_group
# }

# resource "ibm_container_worker_pool_zone_attachment" "dal13" {
# cluster         = ibm_container_cluster.roks_cluster.id
# worker_pool     = ibm_container_cluster.roks_cluster.worker_pools.0.id
# zone            = "dal13"
# resource_group_id = var.resource_group
# }


