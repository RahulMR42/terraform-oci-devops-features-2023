## Copyright (c) 2023, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}

variable oci_user_name {
  default = ""
}

variable oci_user_authtoken {
  default = ""
}

locals {
  ocir_docker_repository = join("", [lower(lookup(data.oci_identity_regions.current_region.regions[0], "key")), ".ocir.io"])
  ocir_namespace = lookup(data.oci_objectstorage_namespace.ns, "namespace")
}

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
 variable "build_pipeline_description" {
   default = "OCI Build pipeline"
 }

variable "deploy_pipeline_description" {
  default = "OCI Deploy pipeline"
}

variable "repository_default_branch" {
  default = "main"
}

variable "repository_description" {
  default = "oci_devops_canary sample application"
}


variable "repository_repository_type" {
  default = "HOSTED"
}

## Devops related variables