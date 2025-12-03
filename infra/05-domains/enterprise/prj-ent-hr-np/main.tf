############################################################
# /mnt/data/project-factory/infra/05-domains/enterprise/prj-ent-hr-np/main.tf
#
# Creates the GCP project for: Enterprise HR Analytics Nonprod
# - Uses modules/project_factory
# - Expects org_id/folder_id/billing_account_id via variables
############################################################

terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}

provider "google" {
  # Uses GOOGLE_APPLICATION_CREDENTIALS / gcloud auth from your shell.
  # You typically run this with your johneysadminproject service account.
}

module "project" {
  source = "../../../../modules/project_factory"

  name               = "Enterprise HR Analytics Nonprod"
  project_id         = "prj-ent-hr-np"
  org_id             = var.org_id
  folder_id          = var.folder_id
  billing_account_id = var.billing_account_id

  activate_apis = var.activate_apis

  labels = {
    "domain" = "enterprise",
"env" = "nonprod"
  }

  owner_members = var.owner_members
}

output "project_id" {
  value = module.project.project_id
}

output "project_number" {
  value = module.project.project_number
}
