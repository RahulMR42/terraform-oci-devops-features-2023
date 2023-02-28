resource "oci_devops_deploy_pipeline" "test_deploy_pipeline" {
  depends_on = [oci_devops_build_pipeline.test_build_pipeline,module.oci-oke]
  #Required
  project_id   = oci_devops_project.test_project.id
  description  = var.deploy_pipeline_description
  display_name = "devops-oke-pipeline_${random_id.tag.hex}"

#  deploy_pipeline_parameters {
#    items {
#      name          = var.deploy_pipeline_deploy_pipeline_parameters_items_name
#      default_value = var.deploy_pipeline_deploy_pipeline_parameters_items_default_value
#      description   = var.deploy_pipeline_deploy_pipeline_parameters_items_description
#    }
  #}
  defined_tags = { "${oci_identity_tag_namespace.ArchitectureCenterTagNamespace.name}.${oci_identity_tag.ArchitectureCenterTag.name}" = var.release }
}