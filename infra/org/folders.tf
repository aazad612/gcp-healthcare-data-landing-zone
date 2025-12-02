// Top-level folder hierarchy under the organization.

resource "google_folder" "top_level" {
  for_each     = var.top_level_folders
  display_name = each.value
  parent       = "organizations/${var.org_id}"
}
