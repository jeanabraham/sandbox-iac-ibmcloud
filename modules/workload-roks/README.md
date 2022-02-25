# Workload ROKS

This module creates the following resources:

1. ROKS cluster

### Input Variables

| Name              | Description                                         | Type         | Default / Example | Required |
| ----------------- | --------------------------------------------------- | ------------ | ----------------- | -------- |
| ibmcloud_api_key  | API Key used to provision resources                 | string       |                   | yes      |
| resource_group    | ID of the resource group                            | string       |                   | yes      |
| prefix            | Prefix to name all the provisioned resources        | string       |                   | yes      |
| tags              | List of tags to provision label provision resources | list(string) |                   | yes      |
| machine_type      | Flavor or machine type of the cluster nodes.        | string       |                   | yes      |
| default_pool_size | Amount of cluster nodes per zone                    | number       |                   | yes      |
| roks_version      | OpenShift version                                   | string       |                   | yes      |

### Output Variables

### Notes
