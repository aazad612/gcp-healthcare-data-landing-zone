# Read Layer 01 (Folders)
data "terraform_remote_state" "org" {
  backend = "gcs"
  config = {
    bucket = "johneys-tf-states"
    prefix = "healthcare-landing-zone/01-organization"
  }
}

# Read Layer 03 (Networking)
data "terraform_remote_state" "net" {
  backend = "gcs"
  config = {
    bucket = "johneys-tf-states"
    prefix = "healthcare-landing-zone/03-networking"
  }
}

locals {
  # These maps allow us to look up "networking" -> "folders/12345"
  folder_ids       = data.terraform_remote_state.org.outputs.folder_ids
  host_project_ids = data.terraform_remote_state.net.outputs.host_project_ids
  subnet_ids       = data.terraform_remote_state.net.outputs.subnet_ids
  vpc_ids          = data.terraform_remote_state.net.outputs.vpc_ids
}