// Organization-level IAM bindings.
resource "google_organization_iam_binding" "org_bindings" {
  for_each = var.org_iam_bindings

  org_id = var.org_id
  role   = each.value.role
  members = each.value.members
}

// Folder-level IAM bindings for top-level folders.
// folder_key must match a key in var.top_level_folders.
resource "google_folder_iam_binding" "folder_bindings" {
  for_each = var.folder_iam_bindings

  folder = google_folder.top_level[each.value.folder_key].name
  role   = each.value.role
  members = each.value.members
}
