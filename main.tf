provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  ibmcloud_timeout = 300
}

# Create the Resource Group where to provision all resources for the enviroinment
resource "ibm_resource_group" "group" {
  name = local.resource_group_name
  tags = local.tags
}


# Create the workload ROKS cluster
module "workload-roks" {
  source = "./modules/workload-roks"

  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  resource_group   = ibm_resource_group.group.id
  prefix           = local.prefix

  tags = [
    "owner:${var.owner}"
  ]

  # ROKS Parameters
  machine_type                          = var.machine_type
  default_pool_size                   = var.default_pool_size
  roks_version                    = var.roks_version
}

