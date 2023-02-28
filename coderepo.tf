## Copyright (c) 2023, Oracle and/or its affiliates.
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

resource "oci_devops_repository" "test_repository" {
  #Required
  name       = "devops-coderepo-${var.app_name}"
  project_id = oci_devops_project.test_project.id

  #Optional
  default_branch = var.repository_default_branch
  description    = var.repository_description

  repository_type = var.repository_repository_type
}

resource "null_resource" "clone_from_ocicoderepo" {
  depends_on = [oci_devops_project.test_project,oci_devops_repository.test_repository]
  provisioner "local-exec" {
    command = <<-EOT
     echo "remove existing repo";
     echo '(3) Starting git clone command... '; echo 'Username: Before' ${var.oci_user_name}; echo 'Username: After' ${local.encode_user}; echo 'auth_token' ${local.auth_token}; git clone https://${local.encode_user}:${local.auth_token}@devops.scmservice.${var.region}.oci.oraclecloud.com/namespaces/${local.ocir_namespace}/projects/${oci_devops_project.test_project.name}/repositories/${oci_devops_repository.test_repository.name};
    EOT
  }
}

locals {
  encode_user = urlencode(var.oci_user_name)
  auth_token  = urlencode(var.oci_user_authtoken)
}