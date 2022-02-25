##################################################################################
# General configuration, apply to all resources
##################################################################################
variable "ibmcloud_api_key" {}

variable "region" {
  description = "Region to provision the Openshift cluster. List all available regions with: ibmcloud regions"
}

variable "resource_group" {
  description = "Resource Group id in your account to host the cluster. List all available resource groups with: ibmcloud resource groups. It is created if empty"
}

variable "prefix" {
  description = "Prefix to name all the provisioned resources."

  validation {
    condition     = length(var.prefix) >= 4 && length(var.prefix) <= 30
    error_message = "The prefix length has to be between 4 and 30 characters."
  }
}

variable "tags" {
  type        = list(string)
  description = "List of tags to label the provisioned resources. Each tag is a key:value pair, like 'owner:my_username'. The most common keys are: 'owner', 'project_name' and 'environment'. At least one tag is required and 'owner' is always required."

  validation {
    condition     = can(regex("owner:\\w+\\|", join("|", concat(var.tags, ["."]))))
    error_message = "The list of tags requires the key:value \"owner:<a username>\", where the username has alphanumeric and \"_\"."
  }
}



##################################################################################
# ROKS Cluster Configuration
##################################################################################
variable "machine_type" {
  type        = string
  description = "Flavor or machine type of the cluster nodes. List all flavors for each zone with: 'ibmcloud ks flavors --zone us-south-1 --provider vpc-gen2'. Examples: 'mx2.4x32', 'mx2.8x64', 'cx2.4x8'"
}

variable "default_pool_size" {
  type        = number
  default     = 2
  description = "Amount of cluster nodes per zone"
}

variable "roks_version" {
  default     = "4.6"
  description = "List available versions: ibmcloud ks versions"
}


// Local Variables
locals {
  tags = concat(var.tags, [
    "type:workload"
  ])
}
