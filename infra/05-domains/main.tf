locals {
  default_apis = [
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "storage.googleapis.com"
  ]
}


module "service_projects" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 15.0"

  for_each = var.service_projects

  name       = each.value.project_id
  project_id = each.value.project_id
  org_id     = var.org_id

  folder_id = local.folder_ids[each.value.folder_key]

  billing_account = var.billing_account_id

  svpc_host_project_id = local.host_project_ids[each.value.host_project_key]


  shared_vpc_subnets = [
    local.subnet_ids[each.value.subnet_key]
  ]

  # DYNAMIC CONFIGURATION
  # 1. Use the specific list from tfvars
  activate_apis = distinct(concat(local.default_apis, each.value.apis))

  # 2. (Optional) Disable the default APIs if you want strict control
  # If false, the module automatically adds compute, container, etc.
  disable_services_on_destroy = false
}