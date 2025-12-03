data "terraform_remote_state" "org" {
  backend = "gcs"
  config = {
    bucket = "johneys-tf-states"
    prefix = "healthcare-landing-zone/01-organization"
  }
}

locals {
  folder_ids = data.terraform_remote_state.org.outputs.folder_ids
}