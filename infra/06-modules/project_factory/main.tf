############################################################
# modules/project_factory/main.tf
#
# Simple "project factory" module that:
# - creates a GCP project under an org or folder
# - attaches billing
# - enables a list of APIs
# - optionally binds basic owner IAM
############################################################

resource "google_project" "this" {
  name            = var.name
  project_id      = var.project_id
  org_id          = var.org_id != "" ? var.org_id : null
  folder_id       = var.folder_id != "" ? var.folder_id : null
  billing_account = var.billing_account_id

  labels = var.labels

  auto_create_network = false
}

resource "google_project_service" "this" {
  for_each = toset(var.activate_apis)

  project            = google_project.this.project_id
  service            = each.key
  disable_on_destroy = false
}

resource "google_project_iam_binding" "owners" {
  count   = length(var.owner_members) > 0 ? 1 : 0
  project = google_project.this.project_id
  role    = "roles/owner"
  members = var.owner_members
}
