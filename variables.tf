## Copyright (c) 2023, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable "app_name" {
  default     = "ociDevops"
  description = "Application name. Will be used as prefix to identify resources, such as OKE, VCN, DevOps, and others"
}

variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "0.0"
}

## Devops related variables
variable "project_description" {
  description = "Devops project description"
  default = "OCI Devops project features"
}

variable "project_logging_config_retention_period_in_days" {
  default = 30
}


## Devops related variables