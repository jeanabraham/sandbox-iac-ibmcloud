variable "ibmcloud_api_key" {
  type        = string
  description = "IBM Cloud API Key that is authorized to provision all of the resources in this terraform"
}

variable "region" {
  type        = string
  default     = "us-south"
  description = "Region to all resources. List all available regions with: ibmcloud regions"
}

variable "owner" {
  type        = string
  description = "Use your user name or team name. The owner is used to label the cluster and other resources with the tag 'owner:{owner}'"
}

#######################################################
# Variables used in naming convention of resources
#######################################################
variable "purpose" {
  type        = string
  default     = "sandbox"
}
variable "iteration" {
  type        = string
  default     = "01"
  description = "Sequence number for the environment.  Failed creation attempts or blue-green deployments require incrementing."
}


##################################################################################
# ROKS Cluster Configuration
##################################################################################
variable "machine_type" {
  type        = string
  default     = "b3c.4x16"
  description = "Flavor or machine type of the cluster nodes. List all flavors for each zone with: 'ibmcloud ks flavors --zone us-east-1'. Examples: 'mx2.4x32', 'mx2.8x64', 'cx2.4x8'"
}

variable "default_pool_size" {
  type        = number
  default     = 1
  description = "Number of cluster nodes per zone"
}

variable "roks_version" {
  type        = string
  default     = "4.9_openshift"
  description = "Version of OpenShift to use.  To see available versions, use: 'ibmcloud ks versions'"
}


# Local Variables
locals {
  prefix              = join("-", [var.purpose, var.iteration])
  resource_group_name = join("-", [var.purpose, var.iteration, "rg", var.region])
  tags = [
    "owner:${var.owner}"
  ]
}
