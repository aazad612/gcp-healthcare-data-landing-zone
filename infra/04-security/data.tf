# Read Layer 03 (Host Projects)
data "terraform_remote_state" "net" {
  backend = "gcs"
  config = {
    bucket = "johneys-tf-states"
    prefix = "healthcare-landing-zone/03-networking"
  }
}

# Read Layer 05 (Service Projects)
data "terraform_remote_state" "domains" {
  backend = "gcs"
  config = {
    bucket = "johneys-tf-states"
    prefix = "healthcare-landing-zone/05-domains"
  }
}

locals {
  # Host Projects (e.g., prj-net-clin-pd-host)
  host_ids = data.terraform_remote_state.net.outputs.host_project_ids

  # Service Projects (e.g., prj-clin-syn-np)
  svc_ids  = data.terraform_remote_state.domains.outputs.project_ids
}