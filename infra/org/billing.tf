// Optional: who can administrate billing accounts at the org level.
resource "google_billing_account_iam_binding" "billing_account_bindings" {
  for_each = var.billing_account_iam_bindings

  billing_account_id = each.value.billing_account_id
  role               = each.value.role
  members            = each.value.members
}

// Optionally expose which folders are allowed to host billable projects under
// specific billing accounts. This is descriptive metadata that other stacks
// (project-factory) can consume via remote_state, not a GCP-native concept.
locals {
  billing_folder_mapping = var.billing_folder_mapping
}
